# Religion Tree Comparison

Code used for the analysis described the [preregistration](https://osf.io/85r2e/registrations), where data dervived trees and compared to the expert dervived tagging tree. 

## Data 

Data were downloaded from the [Database of Religious History (DRH)](https://religiondatabase.org/landing/) on 30<sup>th</sup> July 2020 and consists of 342 entries with 47482 unique answers. 

## Data Analysis Software

All data preprocessing was performed using [R version 4.0.2](https://cran.r-project.org/index.html). The following packages were used:
  - [tidyverse version 1.3.0](https://cran.r-project.org/web/packages/tidyverse/index.html)
  - [data.table version 1.12.8](https://cran.r-project.org/web/packages/data.table/index.html)
  - [h2o version 3.30.0.1](https://cran.r-project.org/web/packages/h2o/index.html)
  - [ape version 5.4](https://cran.r-project.org/web/packages/ape/index.html)

The data derived taxonomy was then produced using [BEAST2 version 2.6.1](https://www.beast2.org/). 

Comparison between the expert sourced tagging tree and the data dervived taxonomy was then conducted using [R version 4.0.2](https://cran.r-project.org/index.html), with the following packages:
  - [tidyverse version 1.3.0](https://cran.r-project.org/web/packages/tidyverse/index.html)
  - [ape version 5.4](https://cran.r-project.org/web/packages/ape/index.html)
  - [igraph version 2.24.0](https://cran.r-project.org/web/packages/igraph/index.html)
  - [adephylo version 1.1-11](https://cran.r-project.org/web/packages/adephylo/index.html)
  - [rlist version 0.4.6.1](https://cran.r-project.org/web/packages/rlist/index.html)
  - [ggtree version 2.99.0](https://bioconductor.org/packages/release/bioc/html/ggtree.html)
  - [ggpubr version 0.4.0](https://cran.r-project.org/web/packages/ggpubr/index.html)


All required packaged will be automatically installed by running the analysis code. 

## Run Analysis 

To run the analysis use: 
1. Use ```setwd()``` or the RStudio file selector to set the working directory to the folder that contains the analysis code.
2. ```source("run_preprocessing.r")```
3. ```source("run_analysis.r")```
