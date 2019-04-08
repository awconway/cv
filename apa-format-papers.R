orcid.id  <-  "0000-0002-9583-8636"
d  <-  works(orcid_id(orcid = orcid.id))
dois <- identifiers(d, type = "doi")
dois  <-  dois[duplicated(tolower(dois))==FALSE] # remove duplicates

apa_papers <- cr_cn(dois, format = "text" , "apa")