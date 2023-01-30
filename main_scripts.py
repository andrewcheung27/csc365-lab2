# author: Andrew Cheung
# acheun29@calpoly.edu

import os
import pandas as pd
from pathlib import Path
import tempfile
from zipfile import ZipFile


def create_basics(datasets: list, path_prefix: str):
    """If directories don't exist, creates directories, empty database
    creation files, and empty database deletion files.
    """
    for ds in datasets:
        p = Path("{p}/{d}".format(p=path_prefix, d=ds))
        if not p.exists():
            # create directory
            p.mkdir()

            # create setup file in directory
            setup_file = open("{pr}/{d}-setup.sql".format(pr=str(p), d=ds),
                              "x")
            setup_file.close()

            # create deletion file in directory
            deletion_file = open(
                "{pr}/{d}-cleanup.sql".format(pr=str(p), d=ds), "x")
            deletion_file.close()


def csv_to_sql(csv_file: str, dataset_name: str, table_name: str,
               path_prefix: str):
    """Converts a csv file into an SQL script that inserts each row
    into the specified table.
    """
    # specify backslash escape character to handle commas inside CSV values
    df = pd.read_csv(csv_file, escapechar="\\", float_precision="high")
    df.columns = df.columns.str.strip()  # strip column names
    sql_file = open("{pr}/{d}/{d}-build-{t}.sql".format(
        pr=path_prefix, d=dataset_name, t=table_name), "w")

    # special cases for this lab
    if dataset_name == "BAKERY" and table_name == "receipts":
        # SQL DATE format
        df["Date"] = df["Date"].apply(
            lambda date: pd.to_datetime(date).strftime("'%Y-%m-%d'"))
    elif dataset_name == "INN" and table_name == "Reservations":
        # SQL DATE format
        df["CheckIn"] = df["CheckIn"].apply(
            lambda date: pd.to_datetime(date).strftime("'%Y-%m-%d'"))
        df["CheckOut"] = df["CheckOut"].apply(
            lambda date: pd.to_datetime(date).strftime("'%Y-%m-%d'"))
    elif dataset_name == "MARATHON" and table_name == "marathon":
        # SQL TIME format
        df["Time"] = df["Time"].apply(
            lambda t: pd.to_datetime(t[1:len(t)-1],
                                     format="%H:%M:%S").strftime("'%H:%M:%S'"))
        df["Pace"] = df["Pace"].apply(
            lambda t: pd.to_datetime(t[1:len(t)-1],
                                     format="%M:%S").strftime("'00:%M:%S'"))
    elif dataset_name == "WINE" and table_name == "wine":
        # exclude State and Drink columns
        df = df.drop(columns=["State", "Drink"])

    df = df.fillna("NULL")
    lst = [s.lower().capitalize() for s in table_name.split("-")]
    table_name = "".join(lst)

    # convert each row into an SQL command
    for i in range(len(df.index)):
        row = df.iloc[i].tolist()
        row = ", ".join(map(str, row)).strip()
        # special cases: replace apostrophes inside names for
        # KATZENJAMMER/Songs.csv
        row = row.replace("'God's Great Dust Storm'",
                          "'God''s Great Dust Storm'")
        row = row.replace("'Shepherd's Song'",
                          "'Shepherd''s Song'")
        row = row.replace("'Ain't no Thang'",
                          "'Ain''t no Thang'")

        # write to SQL file, skipping blank lines
        if len(row) > 0:
            sql_file.write("INSERT INTO " + table_name
                           + "\nVALUES(" + row + ");\n\n")


def create_sql_populators(datasets: list, path_prefix: str):
    """Takes a list of csv file names (without .csv extension) and
    creates an SQL script for each csv file to insert the rows into a table.
    """
    for ds in datasets:
        with tempfile.TemporaryDirectory() as temp_dir:
            temp = Path(temp_dir)
            data_path = Path("data/{d}.zip".format(d=ds))
            with ZipFile(data_path, 'r') as zip_ref:
                zip_ref.extractall(str(temp))
            # convert all the extracted csv files to SQL scripts
            for file in temp.glob('*.csv'):
                # KATZENJAMMER/Songs.csv has a line with ",  " which causes
                # a pandas parser error when csv_to_sql tries to make a
                # pandas dataframe. We'll use a temporary copy with
                # a backslash inserted to make the dataframe and SQL file.
                # Assumes that the dataset only has one file called "Songs.csv"
                # across all directories.
                if file.stem == "Songs":
                    temp_songs_filename = tempfile.mktemp(dir=temp_dir)
                    temp_songs = open(temp_songs_filename, "w")
                    songs = open(file, "r")
                    for line in songs:
                        line = line.replace(",  ", "\,  ")
                        temp_songs.write(line)
                    temp_songs.close()
                    csv_to_sql(temp_songs_filename, ds,
                               "Songs", path_prefix)
                    os.remove(temp_songs_filename)
                else:
                    csv_to_sql(str(file), ds, Path(file).stem, path_prefix)


def main():
    path_prefix = "lab submission"  # directory to zip and turn in

    datasets = ["AIRLINES", "BAKERY", "CARS", "CSU", "INN", "KATZENJAMMER",
                "MARATHON", "STUDENTS", "WINE"]

    # after create_basics, must manually fill out
    # creation and deletion SQL scripts for each dataset
    create_basics(datasets, path_prefix)

    create_sql_populators(datasets, path_prefix)

    return 0


if __name__ == "__main__":
    main()

