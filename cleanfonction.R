# Clean Function for text vectors. Wi will use it to clean the corpus.
# 
clean_text = function(x)
{
  x = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", " ", x) # remove Retweet
  x = gsub("@\\w+", " ", x) # remove at(@)
  x = gsub("[[:punct:]]", " ", x) # remove punctuation
  x = gsub("[[:digit:]]", " ", x) # remove numbers/Digits
  x = gsub('[[:cntrl:]]', ' ', x) #
  x = gsub("http[[:alnum:]]*", " ", x) # remove url links
  x = gsub("http\\w+", " ", x)  # remove links http
  x = gsub("[ |\t]{2,}", " ", x) # remove tabs
  x = gsub(" . ", " ", x) # remove single character words
  x = gsub("^ ", " ", x)  # remove blank spaces at the beginning
  x = gsub(" $", " ", x) # remove blank spaces at the end
  x = gsub('^\\s+|\\s+$', ' ', x) # remove extra space
  x <- iconv(x, 'UTF-8', 'ASCII')
  x = gsub("edUAUB\\S*"," ",x)
  x = gsub('Tmp F.*', ' ', x, ignore.case=T) 
  
  try.error = function(z) #To convert the text in lowercase
  {
    y = NA
    try_error = tryCatch(tolower(z), error=function(e) e)
    if (!inherits(try_error, "error"))
      y = tolower(z)
    return(y)
  }
  x = sapply(x,try.error)
  return(x)
}


