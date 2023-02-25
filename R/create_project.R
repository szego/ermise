#' Create a new project
#'
#' Create a new data processing or analysis project.
#'
#' The file structure in this template is based on one created by Emily Riederer:
#' https://emilyriederer.netlify.app/post/team-of-packages/
#'
#' @param path Location of the new project.
#' @param ... Not used currently.
#'
#' @export
create_project <- function(path, ...) {
  # Create the project path given the name chosen by the user:
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # Create project subfolders
  for(folder in c("analysis", "src", "data", "save", "doc", "publish"))
    dir.create(file.path(path, folder), recursive = TRUE, showWarnings = FALSE)

  # Create the skeleton of a README.md
  writeLines(
    c(
      "\n# [Title]",
      "-----",
      "[Description]",
      "-----",
      paste0("Project created on ", Sys.Date(), "."),
      "Folder legend:",
      "- analysis: RMarkdown files that constitute the final data processing or analysis",
      "- src: R scripts that contain useful helper functions or other set-up tasks (e.g. data pulls)",
      "- data: Raw data - this folder should be considered read only!",
      "- save: Intermediate data objects created during the analysis",
      "- doc: Any long-form documentation or setup instructions",
      "- publish: Any files created by the analysis to be used outside of the project"
    ),
    file.path(path, "README.md"),
    sep = "\n\n"
  )

  writeLines("", file.path(path, ".here"))

  writeLines("here", file.path(path, "required_packages.txt"))
}
