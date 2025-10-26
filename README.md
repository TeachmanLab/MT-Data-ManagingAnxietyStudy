# MT-Data-ManagingAnxietyStudy

This repository is the knowledge base for the MindTrails Managing Anxiety Study (R34) 
data. For more information about the study, see the [Managing Anxiety page][mt-wiki-ma] 
of the [MindTrails wiki][mt-wiki].

[Previous Names](#previous-names)  
[Goal](#goal)  
[Main Outcomes Paper](#main-outcomes-paper)  
[Credibility Paper](#credibility-paper)  
[Subsequent Data Cleaning](#subsequent-data-cleaning)  
[Contact](#contact)

## Previous Names
Until 5/18/2020, this repository was named `R34-Data`.

## Goal
The initial goal of this repo was to describe data cleaning for the study and list 
projects that analyze the study's data. However, the current goal is to house the 
initial data cleaning and analysis scripts used for the 
[main outcomes paper](#main-outcomes-paper) and an analysis script used for the 
[credibility paper](#credibility-paper). 
[Subsequent, centralized data cleaning](#subsequent-data-cleaning-for-item-level-data) 
done after these papers were published is described on the separate repo
[MT-Data-ManagingAnxietyStudy-Cleaning][ma-cleaning-repo].

## Main Outcomes Paper

Lead: Julie Ji

### Drafts of Data Cleaning Scripts

See the [Data Cleaning](./Data%20Cleaning) folder for drafts of three initial data
cleaning scripts used in the main outcomes paper ([Ji et al., 2021][ji-et-al-2021]). 
However, the final cleaning script was lost, and the exact version of the raw dataset 
that was cleaned for that paper also seems lost. The scripts have [issues][ma-repo-issues], 
which will not be fixed now but that are left open for reference.

- `R34_cleaning_script.R` (author: likely [Claudia Calicho-Mamani][claudia], but uploaded 
by [Sonia Baee][sonia])
- `Claudia - cleaning script.R` (author: likely Sonia Baee's revision of `R34_cleaning_script.R`)
- `R34.ipynb` (author: Sonia Baee)

These seem to be separate drafts (i.e., except for `notes.csv`, which is exported by 
`Claudia - cleaning script.R` and imported by `R34.ipynb`, one script does not import files 
exported from the other). Given that `R34.ipynb` exports a data file whose name (`FinalData-28Feb20.csv`) 
resembles that of the file (`FinalData-28Feb20_v02.csv`) imported by `Script1_DataPrep.R` (on the 
main outcomes paper's [OSF project][ji-et-al-2021-osf]), `R34.ipynb` seems to be the latest draft. 
But the final version of `R34.ipynb` is unavailable (Sonia wrote on 11/22/2021 that the final 
script was lost switching laptops).

For more details about the initial cleaning done for the main outcomes paper, including more
details on these scripts and the clean data exported from the initial cleaning pipeline, see
the [Initial Cleaning][ma-cleaning-repo-readme-initial-cleaning] section of the README on 
the separate centralized data cleaning repo [MT-Data-ManagingAnxietyStudy-Cleaning][ma-cleaning-repo],
which is introduced [below](#subsequent-data-cleaning-for-item-level-data).

### Drafts of Analysis Scripts

See the [Main Outcomes](./Main%20Outcomes) folder for drafts of analysis scripts
used in the main outcomes paper. The final analysis scripts are on the main outcomes
paper's [OSF project][ji-et-al-2021-osf].

## Credibility Paper

Lead: Nicola Hohensee

See the [Credibility](./Credibility) folder for the analysis script used in the
credibility paper ([Hohensee et al., 2020][hohensee-et-al-2020]).

## Subsequent Data Cleaning

Given that the final cleaning script and the raw data used to generate the clean data for the 
[main outcomes paper](#main-outcomes-paper) are lost, and that the clean data on the main outcomes 
paper's OSF project has item-level data only at baseline (and only scale-level data over time),
the separate [MT-Data-ManagingAnxietyStudy-Cleaning][ma-cleaning-repo] repo seeks to obtain clean 
item-level data on key measures over time for the 807 participants in the main outcomes paper's
intent-to-treat sample.

The repo does so by redacting two raw datasets and then comparing them to the clean datasets used 
in the main outcomes paper. Although neither raw dataset seems to be the exact version cleaned for 
the main outcomes paper, the repo's code is able to reproduce most of the scale-level data used in 
that paper from a combination of data drawn from these two raw datasets (and from the baseline 
item-level data used in the main outcomes paper).

After reproducing most of the scale-level data used in the main outcomes paper, the repo deviates 
from that paper in the cleaning of the demographics data (i.e., cleaning additional values for birth 
year and education; handling of blank values) and the OASIS data (i.e., recoding session values to be 
consecutive). The repo also outputs clean data for more measures (i.e., credibility) than are in the 
datasets used in that paper, and the new cleaning pipeline is reproducible.

For the raw datasets and cleaning scripts used by the new pipeline and the clean data it exports,
see the [MT-Data-ManagingAnxietyStudy-Cleaning][ma-cleaning-repo] repo. For differences between the 
initial data cleaning used in the main outcomes paper and the new pipeline, see the 
[Differences][ma-cleaning-repo-readme-differences] section of the new pipeline's README.

## Contact
If you would like to contribute to this project, contact Bethany Teachman at 
([bteachman@bvirginia.edu][bethany-email]).

<!-- Reference links -->

[bethany-email]: mailto:bteachman@virginia.edu
[claudia]: https://github.com/cpc4tz
[hohensee-et-al-2020]: https://doi.org/10.1007/s41347-020-00129-8
[jeremy]: https://github.com/jwe4ec
[ji-et-al-2021]: https://doi.org/10.1016/j.brat.2021.103864
[ji-et-al-2021-osf]: https://osf.io/3b67v
[ma-repo-issues]: https://github.com/TeachmanLab/MT-Data-ManagingAnxietyStudy/issues
[ma-cleaning-repo]: https://github.com/TeachmanLab/MT-Data-ManagingAnxietyStudy-Cleaning
[ma-cleaning-repo-readme-differences]: https://github.com/TeachmanLab/MT-Data-ManagingAnxietyStudy-Cleaning#differences
[ma-cleaning-repo-readme-initial-cleaning]: https://github.com/TeachmanLab/MT-Data-ManagingAnxietyStudy-Cleaning#initial-cleaning
[mt-wiki]: https://sites.google.com/d/1x5M3ATWCvOFtk9hIX8gprtK367xX-3kk/p/1312N9KMPKyqKHopSHfr0QH_2AlUO2Wgu/edit?pli=1
[mt-wiki-ma]: https://sites.google.com/d/1x5M3ATWCvOFtk9hIX8gprtK367xX-3kk/p/1Vf0wPMhHS5aYQ3mOWQOhVo52JaKrf3or/edit?pli=1
[sonia]: https://github.com/soniabaee