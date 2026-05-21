#' Translate a simple sentence
#'
#' This function translates a short sentence word by word using the built-in dictionary.
#'
#' @param sentence A character string with the sentence to translate.
#' @param from The language code of the input sentence. Options are "nl", "en", or "es".
#' @param to The language code of the output sentence. Options are "nl", "en", or "es".
#'
#' @return A translated sentence as a character string.
#'
#' @examples
#' translate_sentence("ik hou van koffie", from = "nl", to = "en")
#'
#' @export
translate_sentence <- function(sentence, from = "nl", to = "en") {

  words <- unlist(strsplit(tolower(sentence), " "))

  translated_words <- sapply(words, function(x) {
    translated <- translate_word(x, from = from, to = to)

    if (is.na(translated)) {
      paste0("[", x, "]")
    } else {
      translated
    }
  })

  paste(translated_words, collapse = " ")
}
