#' Create an .R file for a new function in /src/
#'
#' @param function_name The name of the new function
#' @param ... Currently unused
#' @param src_path Destination folder of the new .R file
#' @param name_repair If TRUE, automatically make function_name valid
#'
#' @export
new_src <- function(function_name, ..., src_path = here::here("src"), name_repair = FALSE) {
  if(!is.character(function_name))
    stop("function_name must be a string.")

  if(length(function_name) != 1 | is.na(function_name))
    stop("function_name must have length 1.")

  valid_function_name <- make.names(function_name)
  clean_function_name <- janitor::make_clean_names(function_name)

  if(isTRUE(name_repair)) {
    function_name <- clean_function_name
  } else {
    if(function_name != valid_function_name)
      stop(paste("Provided function_name is not valid. Suggested alternative:", clean_function_name))
  }

  function_file_path <- file.path(src_path, paste0(function_name, ".R"))

  if(file.exists(function_file_path))
    stop(paste(function_file_path, "already exists!"))

  writeLines(
    c(
      "#' [Title]",
      "#' ",
      "#' [Description]",
      "#' ",
      "#' @return ",
      "#' ",
      "#' @examples",
      "#' ",
      paste(function_name, "<- function() {"),
      "  ",
      "}"
    ),
    function_file_path
  )

  if(Sys.getenv("RSTUDIO") == "1" & requireNamespace("rstudioapi", quietly = TRUE))
    rstudioapi::navigateToFile(function_file_path)

  invisible()
}
