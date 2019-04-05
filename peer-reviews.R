

reviews <- orcid_peer_reviews("0000-0002-9583-8636")
length <- length(reviews$`0000-0002-9583-8636`$group[[1]])
issncodes_function <- function(x){
  entries <- reviews$`0000-0002-9583-8636`$group[[1]][[x]]
  str_remove_all(entries$`review-group-id`, "issn:")[[1]]
}

issn_codes <- map_chr(seq(1, length, by=1), issncodes_function)

get_title_from_issn <- function(issn) {
  tryCatch(issn_title[[issn]], error = function(e) {rcrossref::cr_journals(issn)$data$title})
}

journalnames <- map(issn_codes, get_title_from_issn)
