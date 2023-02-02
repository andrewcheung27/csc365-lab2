from pathlib import Path


def main():
    # adds my name and email to the top of all SQL files
    prefix = "lab submission/"
    datasets = ["AIRLINES", "BAKERY", "CARS", "CSU", "INN", "KATZENJAMMER",
                "MARATHON", "STUDENTS", "WINE"]

    for ds in datasets:
        ds_dir = Path(prefix + ds)
        for f in ds_dir.glob("*.sql"):
            with open(f, "r+") as file:
                shit = file.readlines()
                file.seek(0)
                file.write("/* Author: Andrew Cheung */\n")
                file.write("/* Email: acheun29@calpoly.edu */\n\n\n")
                file.writelines(shit)


if __name__ == "__main__":
    main()

