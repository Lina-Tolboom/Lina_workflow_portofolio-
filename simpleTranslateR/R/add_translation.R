#' Add a translation to a dictionary
#'
#' This function adds a new translation row to an existing dictionary.
#'
#' @param dictionary A data frame with the columns nl, en and es.
#' @param word_nl Dutch word.
#' @param word_en English word.
#' @param word_es Spanish word.
#'
#' @return A data frame with the new translation added.
#'
#' @examples
#' dict <- data.frame(
#'   nl = "hond",
#'   en = "dog",
#'   es = "perro",
#'   stringsAsFactors = FALSE
#' )
#' add_translation(dict, "boek", "book", "libro")
#'
#' @export
add_translation <- function(dictionary, word_nl, word_en, word_es) {

  required_columns <- c("nl", "en", "es")

  if (!all(required_columns %in% names(dictionary))) {
    stop("Dictionary must contain the columns: nl, en and es.")
  }

  new_row <- data.frame(
    nl = word_nl,
    en = word_en,
    es = word_es,
    stringsAsFactors = FALSE
  )

  rbind(dictionary, new_row)
}
