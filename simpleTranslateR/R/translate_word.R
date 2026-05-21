#' Translate a single word
#'
#' This function translates one word between Dutch, English and Spanish.
#'
#' @param word A character string with the word to translate.
#' @param from The language code of the input word. Options are "nl", "en", or "es".
#' @param to The language code of the output word. Options are "nl", "en", or "es".
#'
#' @return A translated word as a character string. If the word is not found, the function returns NA.
#'
#' @examples
#' translate_word("hond", from = "nl", to = "en")
#' translate_word("coffee", from = "en", to = "nl")
#'
#' @export
translate_word <- function(word, from = "nl", to = "en") {

  dictionary <- data.frame(
    nl = c("hond", "kat", "koffie", "water", "boek", "huis", "ik", "hou", "van"),
    en = c("dog", "cat", "coffee", "water", "book", "house", "i", "love", "of"),
    es = c("perro", "gato", "cafe", "agua", "libro", "casa", "yo", "amo", "de"),
    stringsAsFactors = FALSE
  )

  if (!from %in% names(dictionary) || !to %in% names(dictionary)) {
    stop("Language not available. Use 'nl', 'en', or 'es'.")
  }

  word <- tolower(word)
  match_row <- dictionary[dictionary[[from]] == word, ]

  if (nrow(match_row) == 0) {
    return(NA_character_)
  }

  match_row[[to]]
}
