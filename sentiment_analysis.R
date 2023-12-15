# Load required libraries
library(lda)
library(tm)
library(ggplot2)
library(wordcloud)
#install.packages("ggthemes")
# Load required packages
library(topicmodels)
library(tm)
library(wordcloud)
library(ggplot2)
library(ggthemes)
library(tidyverse)
library(quanteda)
#install.packages('quanteda.corpora')
library(quanteda.corpora)
library(seededlda)
#devtools::install_github("koheiw/seededlda")
#devtools::install_github("quanteda/quanteda.corpora")
#install.packages('seededlda')
library(lubridate)
library(zoo)
#install.packages('tidytext')
library(tidytext)

library(quanteda.textstats)




########################################## sentiment analysis
########################################## 
########################################## 
########################################## 
########################################## 
########################################## 
########################################## 
########################################## 

# Install and load the sentimentr package
install.packages("sentimentr")
library(sentimentr)


# Split the text into sentences
sentences <- get_sentences(shakira$comment)

# Perform sentiment analysis using Spanish sentiment dictionary
sentiment_result <- sentiment(sentences, language = "spanish")


# Convert sentiment_result to a data frame
sentiment_df <- as.data.frame(sentiment_result)


# Remove empty sentiments
sentiment_df <- sentiment_df[sentiment_df$sentiment != "", ]

# moving average
sentiment_df$ma <-zoo::rollmean(sentiment_df$sentiment, k = 1000, align = "right", fill = NA)


# Create a bar plot of sentiment distribution
ggplot(as.data.frame(sentiment_df), aes(x = element_id, y = sentiment)) +
  geom_line() +
  geom_line(aes( y = ma), color = "red", size = 1, linetype = "dashed") +
  labs(x = "Sentiment", y = "Count", title = "Sentiment Analysis Result") +
  theme_economist() 

# Create a bar plot of sentiment distribution
ggplot(as.data.frame(sentiment_df[select,]), aes(x = element_id, y = sentiment)) +
  geom_line() +
  geom_line(aes( y = ma), color = "red", size = 1, linetype = "dashed") +
  labs(x = "Sentiment", y = "Count", title = "Sentiment Analysis Result and moving average") +
  theme_economist() 



summary(sentiment_result$sentiment)
sd(sentiment_result$sentiment)

# Install and load the lexiconES package
install.packages("lexiconES")
library(lexiconES)




# Perform sentiment analysis using lexiconES
sentiment_result$sentiementES <- lexiconES::lexicon_sentiment(sentences)

# Print the sentiment analysis result
print(sentiment_result)


########################################## sentiment analysis


# Install and load the sentimentr package
install.packages("sentimentr")
library(sentimentr)


# Split the text into sentences
sentences <- get_sentences(shakira$comment)

# Perform sentiment analysis using Spanish sentiment dictionary
sentiment_result <- sentiment(sentences, language = "spanish")


# Convert sentiment_result to a data frame
sentiment_df <- as.data.frame(sentiment_result)



# Remove empty sentiments
sentiment_df <- sentiment_df[sentiment_df$sentiment != "", ]

# Some basic statistics
summary(sentiment_result$sentiment)
sd(sentiment_result$sentiment)


# moving average
sentiment_df$ma <-zoo::rollmean(sentiment_df$sentiment, k = 1000, align = "right", fill = NA)


# Create a bar plot of sentiment distribution
ggplot(as.data.frame(sentiment_df), mapping=aes(x = element_id)) +
  geom_line(aes(y = sentiment, color="Sentiment"),size = 1) +
  geom_line(aes(y = ma, color = "Moving average"), size = 1, linetype = "dashed") +
  labs(x = "Sentiment", y = "Count", title = "Sentiment Analysis Result and moving average") +
  scale_color_manual(values = c("Sentiment" = "black", "Moving average" = "red")) +
  theme_economist() 


#As we have a very large dataset, we can select only a few rows, for example, 100K
select<-sample(1:474540,10000, replace = TRUE)

# Create a bar plot of sentiment distribution
ggplot(as.data.frame(sentiment_df[select,]), aes(x = element_id, y = sentiment)) +
  geom_line() +
  geom_line(aes( y = ma), color = "red", size = 1, linetype = "dashed") +
  labs(x = "Sentiment", y = "Count", title = "Sentiment Analysis Result and moving average") +
  theme_economist() 

