#First, we declare the database.
shakira <- read.csv2('./shakira.csv', sep=',')

# To harmonize the date format
shakira$date <- as.Date(shakira$date)
shakira$date <- format(shakira$date, format = "%Y-%m-%d")
summary(shakira$date)


# Remove emojis
library(stringi)
shakira$comment <- stri_trans_general(shakira$comment, "latin-ascii")
shakira$comment <- gsub("[^[:alnum:][:space:]]", "", shakira$comment)
shakira$comment <- clean_text(shakira$comment)

# Remove empty lines
shakira <- shakira[nzchar(shakira$comment),]

shakira<-shakira[!is.na(shakira$comment),]
