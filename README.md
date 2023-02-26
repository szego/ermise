
# ermise

<!-- badges: start -->
<!-- badges: end -->

This R package is a set of tools and workflow enhancements for data processing and analysis projects.

Core features:
- Create projects with a folder structure geared toward data processing and analysis using RStudio's New Project wizard (`File > New Project...`) or `ermise::create_project()`
- Document package dependencies to facilitate collaboration using `ermise::require_packages()`
- Start a new R Notebook for an analysis using `ermise::new_analysis()`
- Start a new R source file to develop a helper function using `ermise::new_src()`

The template's folder structure is based on one recommended by [Emily Riederer](https://emilyriederer.netlify.app/post/team-of-packages/).

### Create a new project

After installing this package, use the Rstudio's New Project wizard (`File > New Project...`) to create a new "ermise Project". ermise will create some folders in the project directory:
![RStudio's New Project wizard and ermise folder structure](/inst/readme_imgs/new_project.png)
You can also create the project without RStudio by calling `ermise::create_project()` directly.

The created folders are:
- analysis: RMarkdown files that constitute the final data processing or analysis
- src: R scripts that contain useful helper functions or other set-up tasks (e.g. data pulls)
- data: Raw data - this folder should be considered read only!
- save: Intermediate data objects created during the analysis
- doc: Any long-form documentation or setup instructions
- publish: Any files created by the analysis to be used outside of the project

ermise will also create a file called "required_packages.txt" in the project's root folder.

## Document package dependencies

To facilitate collaboration on the project, you can call `ermise::require_packages()` to update the "required_packages.txt" file with new package names as necessary.

For example, this will add `dplyr` and `tidyr` to "required_packages.txt":
```r
ermise::require_packages("dplyr", "tidyr")
```

This can be a decent start to share dependency information if you aren't at the point of needing more fully-featured environment management tools like [renv](https://rstudio.github.io/renv/articles/renv.html).

## Create new analysis and source files

Create a new R Notebook for an analysis using `ermise::new_analysis()`. This will create a new .Rmd file in the project's /analysis/ folder with some basic formatting. It will also include `library()` calls to load any packages it found in "required_packages.txt".

For example, run the following line to create a new analysis R Notebook:
```r
ermise::new_analysis("Summary of hospital totals")
```
This creates a new file in /analysis/ called "summary_of_hospital_totals.Rmd". Assuming we already ran the code above to add `dplyr` and `tidyr` to "required_packages.txt", that new file would look like this:
![An .Rmd file with the provided title, a place to enter a description, and a setup chunk containing library() calls to packages from required_packages.txt](/inst/readme_imgs/new_analysis.png)

Create a new R source file for a helper function using `ermise::new_src()`. This will create a new .R folder in /src/ with a simple code template for the helper function.

For example, run the following line to create a new source file:
```r
ermise::new_src("clean_hospital_names")
```
This creates a new file in /src/ called "clean_hospital_names.R" that looks like this:
![An .R file with a function template for a function called clean_hospital_names()](/inst/readme_imgs/new_src.png)
The comment block above the function follows [roxygen2](https://roxygen2.r-lib.org/) formatting.

## Installation

You can install ermise directly from GitHub using the [devtools](https://cran.r-project.org/package=devtools) package:

``` r
devtools::install_github("szego/ermise")
```

After installing, create a new "ermise Project" using RStudio's new project wizard (`File > New Project...`).

-----

ermise (c) by Antonio R. Vargas

ermise is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

You should have received a copy of the license along with this work. If not, see [https://creativecommons.org/licenses/by-nc-sa/4.0/](https://creativecommons.org/licenses/by-nc-sa/4.0/).
