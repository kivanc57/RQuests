# Quest 7
# Make an estimation graph of the average word length for an author from one of his books.

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get the content
content <- GetFileContent("../data/Christie.txt")

# Create a vector to append means
means <- c(1000)

# Get a token list of 1000 for 1000 times
# Append it to means
for (i in 1:1000){
  # Get randomized_tokens, length_tokens and count_letters
  randomized_tokens  <- sample(TokenizeText(content), 1000, replace=TRUE)
  length_tokens      <- length(randomized_tokens)
  count_letters      <- sum(nchar(randomized_tokens))
  
  # Return average word length, round and append
  means[i] <- round(count_letters/length_tokens, digits=2)
}

# Get a histogram
hist(
  means,
  main="Histogram of Average Word Lengths",
  col="lightblue",
  border="black",
  xlab="Average Word Length"
)


