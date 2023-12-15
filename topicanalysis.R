################## Topic analysis

select<-sample(1:474540,10000, replace = TRUE)

#we have to transform the comment vector into a corpus
corpus <- corpus(shakira, text_field = "comment")

# Perform additional preprocessing steps as needed
corpus <- clean_text(corpus)

# Tokeinze corpus
toks <- tokens(corpus, remove_punct = TRUE, remove_numbers = TRUE, remove_symbol = TRUE)
toks <- tokens_remove(toks, pattern = c(stopwords("es")))
toks <- tokens_remove(toks, pattern = c(stopwords("en")))


#Further, after removal of function words and punctuation in dfm(), we will only keep the top 20% of the most frequent features (min_termfreq = 0.8) that appear in less than 10% of all documents (max_docfreq = 0.1) using dfm_trim() to focus on common but distinguishing features.


dfmat <- dfm(toks) %>% 
  dfm_trim(min_termfreq = 0.8, termfreq_type = "quantile",
           max_docfreq = 0.1, docfreq_type = "prop")


#LDA
# k = 5 specifies the number of topics to be discovered. This is an important parameter and you should try a variety of values and validate the outputs of your topic models thoroughly.

tmod_lda <- textmodel_lda(dfmat, k = 7)


library(textmineR)
#nstall.packages('textmineR')


# Get the most probable terms for each topic
terms(tmod_lda, 5)


head(topics(tmod_lda), 20)

# assign topic as a new document-level variable
dfmat$topic <- topics(tmod_lda)

# cross-table of the topic frequency
table(dfmat$topic)



