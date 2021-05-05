library(tm)
library(NLP)
library(wordcloud) 
library(RColorBrewer)
# Select the directory that our text is located
dirPath <- "D:/AUTONOMO/Data visualization with R/Data-Visualization-with-R/datos"

# Load the data as a corpus
speech <- Corpus(DirSource(dirPath))


inspect(speech) # to inspect the content

class(speech)

?Corpus

# Convert the text to lower case
speech <- tm_map(speech, content_transformer(tolower))
inspect(speech)
# Remove numbers
speech <- tm_map(speech, removeNumbers)

# Remove english common stopwords
speech <- tm_map(speech, removeWords, stopwords("english"))
inspect(speech)
# Remove your own stop word
# specify your stopwords as a character vector
speech <- tm_map(speech, removeWords, c("floccinaucinihilipification", "squirrelled")) 

# Remove punctuations
speech <- tm_map(speech, removePunctuation)
inspect(speech)
# Eliminate extra white spaces
speech <- tm_map(speech, stripWhitespace)



# Create a Term Document Matrix
dtm <- TermDocumentMatrix(speech)

# Matrix transformation
m <- as.matrix(dtm)

#Sort it to show the most frequent words
v <- sort(rowSums(m),decreasing=TRUE)

#transform to a data frame
d <- data.frame(word = names(v),freq=v)
head(d, 10)

names(d)

wordcloud(words = d$word, freq = d$freq)

wordcloud(words = d$word, freq = d$freq, min.freq=1)

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=250)


wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=250, colors=brewer.pal(8, "Dark2"))


wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=250, colors=brewer.pal(8, "Dark2"),
          random.order = FALSE )
