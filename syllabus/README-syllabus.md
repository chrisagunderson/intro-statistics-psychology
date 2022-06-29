# README: Syllabus

The syllabus was inspired by _Steve's Templates_, see link [here](http://svmiller.com/stevetemplates/). In `r`, you can install several templates he has made with `install.packages("stevetemplates")`. After installation, choose the r markdown template `stevetemplates::syllabus`. To make the tables in the syllabus easier to edit and work with (vs. markdown table formats), I created several `.csv` files. The syllabus can otherwise remain the same with minor edits, and major edits can be done in the following `.csv` files:

- `course-schedule.csv`
- `grading-overview.csv`
- `letter-grades.csv`

Make sure both the `psyc-2300-intro-stats-syllabus.Rmd` and the above `.csv` files are in the same folder before rendering a `.pdf` document with the `knitr` package in `r`.
