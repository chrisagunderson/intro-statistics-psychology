# README: Formula Sheets

The _Formula Sheets_ were made using `RMarkdown` and formatted with a `latex` file (i.e., `.tex`). Specifically, you will see in the `YAML` header at the top of each `.Rmd` file for each formula sheet, a reference to a corresponding `.tex` file. They were then compiled in with the `knitr` function in `r` to `.pdf` format. Make sure the the `.Rmd` and `.tex` file for each formula sheet is in the same folder before compiling to a new a `.pdf` file.

There is some inconsistency in the `latex` math formulas that are worth editing (from the _Midterm_ to the _Final Exam_ formula sheets). Specifically, it may be worthwhile to replace `\Sum` with `\Sigma`. This will result in a minor aesthetic difference. Some formulas that were covered during lecture but not explicitly needed for the _Midterm_ or the _Final Exam_ were omitted for brevity.
