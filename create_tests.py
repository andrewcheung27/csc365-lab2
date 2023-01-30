def main():
    # creates test files for each dataset, based on the existing cleanup files
    prefix = "lab submission/"
    datasets = ["AIRLINES", "BAKERY", "CARS", "CSU", "INN", "KATZENJAMMER",
                "MARATHON", "STUDENTS", "WINE"]
    suffix = "-cleanup.sql"

    for ds in datasets:
        with open(prefix + ds + "/" + ds + suffix, "r") as cleanup_file:
            with open(prefix + ds + "/" + ds + "-test.sql", "w") as test_file:
                for line in cleanup_file:
                    if line.startswith("DROP TABLE"):
                        test_file.write("SELECT * FROM " +
                                        line[11:])
                        test_file.write("SELECT COUNT(*) FROM " +
                                        line[11:] + "\n\n")


if __name__ == "__main__":
    main()

