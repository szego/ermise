#' Add packages to required_packages.txt
#'
#' @param ... Names of packages to add to the list
#' @param .package_list File path of required_packages.txt
#'
#' @export
require_packages <- function(..., .package_list = here::here("required_packages.txt")) {
  package_names <- list(...)

  if(length(package_names) == 0 | !all(sapply(package_names, is.character)))
    stop("Package names must all be strings.")

  package_names <- unique(unlist(package_names))

  package_is_installed <- vapply(package_names, FUN = requireNamespace, FUN.VALUE = logical(1), quietly = TRUE)

  if(!all(package_is_installed)) {
    missing_packages <- package_names[!package_is_installed]
    stop(paste(
      "These packages are not installed:",
      paste(missing_packages, collapse = ", ")
    ))
  }

  if(file.exists(.package_list)) {
    packages_already_required <- readLines(.package_list)
    new_required_packages <- unique(c(packages_already_required, package_names))
    writeLines(new_required_packages, .package_list)
  } else {
    writeLines(package_names, .package_list)
  }
}
