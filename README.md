# MT-Data-ManagingAnxietyStudy

This repository is the knowledge base for the MindTrails Managing Anxiety Study (R34) 
dataset. For more information, see the [Managing Anxiety page][ma-wiki] of the 
[MindTrails wiki][ma-wiki].

**Table of Contents**  
1. [Previous Names](#previous-names)  
2. [Goal](#goal)  
3. [Data Cleaning](#data-cleaning)  
4. [List of Projects](#list-of-projects)  
5. [Contact](#contact)

## Previous Names
Until 5/18/2020, this repository was named `R34-Data`.

## Goal
To conduct centralized data cleaning for the study and list projects that analyze 
the study's data. Each data analysis project has its own folder that contains the 
code specific to that project (or a link to the code).

## Data Cleaning

### For Main Outcomes Paper

See the [Data Cleaning](./Data Cleaning) 
folder for cleaning scripts that predated the cleaning script used in the main outcomes paper.

- `R34_cleaning_script.R` (author: maybe Claudia Calicho-Mamani, but uploaded by Sonia Baee)
  - Imports TODO
  - Exports TODO
- `R34.ipynb` (author: Sonia Baee)
  - Imports TODO
  - Exports `FinalData-28Feb20.csv`, but this is not the file imported by the first script
  (`Script1_DataPrep.R`) on the [OSF project](https://osf.io/3b67v) for the main outcomes paper
  ([Ji et al., 2021](https://doi.org/g62s)), which imports `FinalData-28Feb20_v02.csv` instead.
  Thus, `R34.ipynb` is not the final cleaning script used in the main outcomes paper. Sonia 
  indicated on 11/22/2021 that the final cleaning script was lost when she switched laptops.

### Subsequent Cleaning for Item-Level Data

**TODO:**

- Jeremy to finish explaining what scripts are in the `Data Cleaning` folder, how they relate 
to the data used in the main outcomes paper, why additional cleaning was needed, and how the 
cleaning scripts on the present repo differ from the cleaning scripts in a new linked repo [TeachmanLab/MT-Data-ManagingAnxietyStudy-Cleaning](https://github.com/TeachmanLab/MT-Data-ManagingAnxietyStudy-Cleaning)

## List of Projects
1. [Main Outcomes](./Main Outcomes) (Lead: Julie Ji)
2. [Credibility](./Credibility) (Lead: Nicola Hohensee)
3. [Flexibility](https://doi.org/10.1177/20438087241226642) (Lead: Julie Ji)
4. [Attrition](https://doi.org/m5tz) (Lead: [Sonia Baee](https://github.com/soniabaee))
5. [Network Analyses](https://osf.io/w63br/) (Lead: [Jeremy Eberle][jeremy])
6. [Structural Validity](https://osf.io/sth87/) (Lead: [Jeremy Eberle][jeremy])

## Contact
If you are a researcher who wants to contribute to this project, please contact 
Bethany Teachman at bteachman@virginia.edu. Thanks!

[jeremy]: https://github.com/jwe4ec
[ma-wiki]: https://sites.google.com/a/virginia.edu/mindtrails-wiki/studies/managinganxiety