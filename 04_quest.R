# Quest 4
# Ensure the change in the word length by the length of the text with limitations. 
# Use for for iteration and automate it 

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("./data/chapter.txt")

# Create range_values
range_values <- c(10, 100, 1000, 10000)

# Create means
means <- c()

# Declare get_means
get_means <- function(text, means, limit=1000) {
  # Get tokens, count_types and count_letters
  tokens        <- TokenizeText(text)[1:limit]  # Get tokens up to i in max_list 
  count_letters <- sum(nchar(tokens))
  
  mean <- round(count_letters/limit, digits=2)
  means <- c(means, mean)
  return (means)
}

# Get mean of each content
for (limit in range_values){
  mean <- get_means(content, means, limit)
  cat("Mean:", mean, "\n")
}
# Plot the results=means
plot(range_values, means)

