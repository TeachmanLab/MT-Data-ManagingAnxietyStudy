# Obtain and Redact Raw Data

## Data on Open Science Framework

Raw data from the Managing Anxiety SQL database are stored in the [MindTrails Managing Anxiety Study](https://osf.io/pvd67/) project on the Open Science Framework (OSF). The project has two components, with different permissions: a [Private Component](https://osf.io/5sn2x/) and a [Public Component](https://osf.io/2x3jq/).

### Private Component

The [Private Component](https://osf.io/pvd67/) contains the full set of 20 raw data tables dumped from the Managing Anxiety SQL database on February 2, 2019. Yuhan Hou used Grafana to dump these files except for the "TrialDAO" file, which was too large to dump via Grafana and which she thus dumped from the database directly. The folder structure of the ZIP file is below.

```
.
└── data
    └── 1_raw_full       # 20 CSV files (e.g., "DASS21_AS_02_02_2019.csv", "ImageryPrime_02_02_2019.csv")
```

Researchers can request access to files on this component by contacting the study team ([studyteam@mindtrails.org](mailto:studyteam@mindtrails.org)).

### Public Component

The [Public Component](https://osf.io/2x3jq/) contains a partial set of raw data tables (i.e., those that did not need redaction) and a redacted table (from [2_redact_data.R](#2_redact_dataR)). The structure of the ZIP file is below.

Note: The `ImageryPrime` table in the `1_raw_full` folder of the [Private Component](#private-component) that is not in the `1_raw_partial` folder of this [Public Component](https://osf.io/2x3jq/) contains free-text responses that may or may not have identifiers. In the [Public Component](https://osf.io/2x3jq/), a redacted version of this table is in `2_redacted`.

```
.
├── data                    
|   ├── 1_raw_partial    # 19 CSV files (did not need redaction; e.g., "DASS21_AS_02_02_2019.csv")
|   └── 2_redacted       # 1 CSV file (needed redaction; i.e., ImageryPrime_02_02_2019_redacted.csv")
└── materials
    ├── appendices       # Appendices
    └── codebooks        # Codebooks
```

## Redaction Scripts: Setup and File Relations

The scripts in the [`Redact Raw Data`](Redact Raw Data) folder of this repository import the full raw data files and redact a file.

If you have access to the full raw data (from the [Private Component](#private-component)), you can reproduce the redaction. Create a parent folder (with any desired name, indicated by `.` below) with two subfolders: `data` and `Redact Raw Data`. The working directory must be set to the parent folder for the script to import and export data correctly using relative file paths.

Put all the raw data files in a subfolder of `data` called `1_raw_full`. When you run the script, `2_redact_data.R` will create `2_redacted` and a file therein.

```
.                                # Parent folder (i.e., working directory)
├── data                         #   Data subfolder
|   ├── 1_raw_full               #     20 CSV files from Private Component
|   └── (2_redacted)             #     Folder with 1 CSV file will be created by "2_redact_data.R"
└── Redact Raw Data              #   Code subfolder
    ├── 1_define_functions.R     #     Define functions for use by subsequent R scripts
    └── 2_redact_data.R          #     Redact 1 CSV file from "1_raw_full" and output it to "2_redacted"
```