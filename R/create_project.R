#' Create a new project
#'
#' Create a new data processing or analysis project.
#'
#' The file structure in this template was created by Emily Riederer:
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
  for(folder in c("analysis", "src", "data", "output", "doc", "ext"))
    dir.create(file.path(path, folder), recursive = TRUE, showWarnings = FALSE)

  # Change the working directory to the recently created folder:
  setwd(path)

  # Create the skeleton of a README.md
  writeLines(
    paste0(
      "\n# [title]\n\n-----\n\n[description]\n\n-----\n\n",
      "Project created on ", Sys.Date(), ".\n\n",
      "Folder legend:\n\n",
      "- analysis: RMarkdown files that constitute the final data processing or analysis\n\n",
      "- src: R scripts that contain useful helper functions or other set-up tasks (e.g. data pulls)\n\n",
      "- data: Raw data - this folder should be considered read only!\n\n",
      "- output: Intermediate data objects created in the analysis\n\n",
      "- doc: Any long form documentation or set-up instructions\n\n",
      "- ext: Any miscellaneous external files or presentation material collected or created throughout the analysis\n"
    ),
    "README.md"
  )
}
