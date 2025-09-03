# Obtain and Redact Raw Data

## Data on Open Science Framework

Raw data from the Managing Anxiety SQL database are stored in the [MindTrails Managing Anxiety Study](https://osf.io/pvd67/) project on the Open Science Framework (OSF). The project has two components, with different permissions: a [Private Component](https://osf.io/5sn2x/) and a [Public Component](https://osf.io/2x3jq/).

### Private Component

The [Private Component](https://osf.io/pvd67/) contains the full set of 20 raw data tables dumped from the Managing Anxiety SQL database on February 2, 2019. Yuhan Hou used Grafana to dump these files except for the "TrialDAO" file, which was too large to dump via Grafana and which she thus dumped from the database directly. The folder structure of the ZIP file is below.

```
.
├── data
└── └── 1_raw_full       # 20 CSV files (e.g., "DASS21_AS_02_02_2019.csv", "ImageryPrime_02_02_2019.csv")
```

Researchers can request access to files on this component by contacting the study team ([studyteam@mindtrails.org](mailto:studyteam@mindtrails.org)).

### Public Component

The [Public Component](https://osf.io/2x3jq/) contains a partial set of raw data tables (i.e., those that did not need redaction) and a redacted table (from [2_redact_data.R](#2_redact_dataR)). The structure of the ZIP file is below.

Note: The `ImageryPrime` table in the `1_raw_full` folder of the [Private Component](#private-component) that is not in the `1_raw_partial` folder of this [Public Component](https://osf.io/2x3jq/) contains free-text responses that may or may not have identifiers. In the [Public Component](https://osf.io/2x3jq/), a redacted version of this table is in `2_redacted`.

```
.
├── data                    
├── ├── 1_raw_partial    # 19 CSV files (did not need redaction; e.g., "DASS21_AS_02_02_2019.csv")
├── ├── 2_redacted       # 1 CSV file (needed redaction; i.e., ImageryPrime_02_02_2019_redacted.csv")
├── materials
├── ├── appendices       # Appendices
└── └── codebooks        # Codebooks
```

## Redaction Script: Setup and File Relations

TODO





