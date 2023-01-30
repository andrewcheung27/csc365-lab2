import pandas as pd
from pathlib import Path


def main():
    # datasets = ["AIRLINES", "BAKERY", "CARS", "CSU", "INN", "KATZENJAMMER",
    #             "MARATHON", "STUDENTS", "WINE"]
    datasets = ["CARS"]
    main_df = pd.DataFrame(columns=["Dataset", "Table", "Column",
                                    "LongestLength", "Rounded"])

    for ds in datasets:
        with Path("unzipped/" + ds) as path:
            for csv_file in path.glob("*.csv"):
                # SKIPS KATZENJAMMER/Songs.csv, MUST COUNT THAT ONE MANUALLY
                if csv_file.stem == "Songs":
                    continue
                df = pd.read_csv(csv_file)
                df.columns = df.columns.str.strip()  # strip column names
                table_name = csv_file.stem
                lst = [s.lower().capitalize() for s in
                       table_name.split("-")]
                table_name = "".join(lst)

                cols = df.columns.values
                types = df.dtypes
                # for col in df.columns.values:
                for i in range(len(cols)):
                    if types[i] == object:
                        longest = df[cols[i]].str.len().max()
                        rounded = longest
                        if longest % 10 != 0:
                            rounded += 10 - longest % 10
                    else:
                        longest = -1
                        rounded = -1
                    main_df.loc[len(main_df.index)] = [ds, table_name,
                                                       str(cols[i]), longest,
                                                       rounded]

    print(main_df)


if __name__ == "__main__":
    main()

