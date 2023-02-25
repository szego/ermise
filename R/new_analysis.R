#' Create an .Rmd file in /analysis/
#'
#' @param analysis_name The name of the new analysis
#' @param ... Currently unused
#' @param analysis_path Destination folder of the new .Rmd file
#' @param name_repair If TRUE, automatically make "analysis_name.Rmd" a simplified, valid file name
#'
#' @export
new_analysis <- function(analysis_name, ..., analysis_path = here::here("analysis"), name_repair = TRUE) {
  if(!is.character(analysis_name))
    stop("analysis_name must be a string.")

  if(length(analysis_name) != 1 | is.na(analysis_name))
    stop("analysis_name must have length 1.")

  if(isTRUE(name_repair)) {
    analysis_file_name <- paste0(janitor::make_clean_names(analysis_name), ".Rmd")
  } else {
    analysis_file_name <- paste0(analysis_name, ".Rmd")
  }

  analysis_file_path <- file.path(analysis_path, analysis_file_name)

  if(file.exists(analysis_file_path))
    stop(paste(analysis_file_path, "already exists!"))

  if(file.exists(here::here("required_packages.txt"))) {
    required_packages <- readLines(here::here("required_packages.txt"))

    if(length(required_packages) > 0) {
      library_calls <- paste0("library(", required_packages, ")")
      library_calls <- c(library_calls, "")
    } else {
      library_calls <- NULL
    }
  } else {
    library_calls <- NULL
  }

  writeLines(
    c(
      "",
      analysis_name,
      "",
      "-----",
      "",
      "[Description]",
      "",
      "-----",
      "",
      "```{r setup}",
      library_calls,
      'sapply(list.files(here::here("src"), full.names = TRUE), source)',
      "```",
      ""
    ),
    analysis_file_path
  )

  if(Sys.getenv("RSTUDIO") == "1" & requireNamespace("rstudioapi", quietly = TRUE))
    rstudioapi::navigateToFile(analysis_file_path)

  invisible()
}
