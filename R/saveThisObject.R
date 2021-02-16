#' Take a selection as an object name and insert code to save and later reload that object.
#'
#' Turns \cr\cr
#' \code{object_with_a_name}\cr\cr
#' into\cr\cr
#' \code{
#' saveRDS(object_with_a_name, file = "object_with_a_name.rds")
#' object_with_a_name <- readRDS(file = "object_with_a_name.rds")}
#'
#' @export
saveThisObject <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  if (!is.null(ctx)) {

    if (ctx$selection[[1]]$text != "") {

      objName <- ctx$selection[[1]]$text

      op <- options("useFancyQuotes")
      options(useFancyQuotes = FALSE)

      rstudioapi::insertText(paste0("\n",
                                    "saveRDS(",
                                    objName,
                                    ", file = \"",
                                    objName,
                                    ".rds\")",
                                    "\n",
                                    objName,
                                    " <- readRDS(file = \"",
                                    objName,
                                    ".rds\")"
                                    ))

    }

  }

}
