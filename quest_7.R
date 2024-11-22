# Quest 7
# Make an estimation graph of the average word length for any excerpt.

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get the content
content <- GetFileContent("./data/Christie.txt")

# Declare get_means
get_means <- function(text, limit) {
  means <- c()
  
  for (i in 1:limit) {
    # Get tokens, count_types and count_letters
    tokens        <- sample(TokenizeText(text), limit, replace = T)
    count_letters <- sum(nchar(tokens))
    
    mean <- round(count_letters/limit, digits=2)
    means <- c(means, mean) 
  }
  return (means)
}

# Declare get_histogram
get_histogram <- function(means){
  hist(
    means,
    main="Histogram of Average Word Lengths",
    col="lightblue",
    border="black",
    xlab="Average Word Length"
  )
}

# Call get_means
found_means <- get_means(content, 1000)

# Call get_histogram
get_histogram(found_means)
