# YouTube Comments
 This project will allow you to download and analyze textual data from video comments

This code will allow you to download comments from YouTube videos for your textual analyses, lexicometry, and NLP (Natural Language Processing). It's a very simple code. 

The function has been coden in python. 
Afterwards, I provided an example of analysis using R.


## File: youtube_comments.py
The file 'youtube_comments.py' contains the function to download the relevant content, namely: the comment content, date, and author.

## File: exemple.py
The 'example.py' file is an example of how to use the code. I downloaded the comments from the video of the song 'pa tipos como tu' by Shakira and Bizarrap. I chose this song because it has a lot of comments, which demonstrates the power of the function.

This file shows how to transform lists into a data frame and then save it as a .csv file.

Once you have the database in the form of a .csv file, you can use it to conduct your analyses


## File: cleaning.R
The file 'cleaning.R' contains some rather simple manipulations in R to clean the database and standardize the date format. You will also find two lines to remove empty lines and emojis. In my case, emojis were not very important, so it made sense to delete them.

## File: sentiment_analysis.R
This file contains lines to perform sentiment analysis. First, we obtain the sentences. Then, we calculate the sentiment associated with the sentences using the 'sentiment' function from the 'sentimentr' package. I chose this function because it has a lexicon in Spanish (as most of the comments are in Spanish). After some manipulations, I have included a graph to visualize the result.


First sentiment analysis plot:
![alt text](https://github.com/fbietti/YouTube-Comments/blob/main/plots/plot1.png)

Second sentiment analysis plot:
![alt text](https://github.com/fbietti/YouTube-Comments/blob/main/plots/plot2.png)

## File: celanfonction.R

The file 'cleanfunction.R' contains a function to clean character string vectors. It will be useful for cleaning comments.


## File: topicanalysis.R
This file contains commands to conduct an analysis to highlight the main themes that appear in the corpus. To do this, I am using several commands from the quanteda package.






