# YouTube Comments
 This project will allow you to download and analyze textual data from video comments

This code will allow you to download comments from YouTube videos for your textual analyses, lexicometry, and NLP (Natural Language Processing). It's a very simple code. 

The function has been coden in python. 


## File: youtube_comments.py
The file 'youtube_comments.py' contains the function to download the relevant content, namely: the comment content, date, and author.

## File: exemple.py
The 'example.py' file is an example of how to use the code. I downloaded the comments from the video of the song 'pa tipos como tu' by Shakira and Bizarrap. I chose this song because it has a lot of comments, which demonstrates the power of the function.

This file shows how to transform lists into a data frame and then save it as a .csv file.

Once you have the database in the form of a .csv file, you can use it to conduct your analyses


## File: cleaning.R
The file 'cleaning.R' contains some rather simple manipulations in R to clean the database and standardize the date format. You will also find two lines to remove empty lines and emojis. In my case, emojis were not very important, so it made sense to delete them.

## File: sentiment_analysis.R


