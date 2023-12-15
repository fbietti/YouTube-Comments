
# Load required libraries
library(Rgraphviz)
# Rgraphviz : installation :
#if (!require("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install("Rgraphviz")

library(MASS)
library(Rtools)
library(caret)
library(lda)
#install.packages('qdap')
library(qdap)

# Create a corpus
corpus <- corpus(shakira, text_field = "comment")

# Clean the corpus 
corpus <- clean_text(corpus)


# Create a document-term matrix
dtm <- DocumentTermMatrix(corpus[select])

# Convert the document-term matrix to a matrix
dtm_matrix <- as.matrix(dtm)
class(dtm)
dim(dtm)

# find associations 
findAssocs(dtm, c("lloran", "pique", "ferrari", "rolex"), 
           c(0.2, 0.2, 0.2))

# word association network
freq.terms <- findFreqTerms(dtm, lowfreq=8)
plot(dtm, term = freq.terms, corThreshold =0.05, weighting = F, 
     attrs=list(node=list(width=15, fontsize=40, 
                          fontcolor="blue", color="red")))

plot(dtm, terms = names(findAssocs(dtm,term=c("lloran", "pique", "ferrari"),0.8)[[c("nolloran", "pique", "ferrari")]]), corThreshold = 0.80)
                  
