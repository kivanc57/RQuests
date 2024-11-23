# Quest 1
# Get the mean of a text.

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("./data/svejk.txt")

# Declare get_mean
get_mean <- function(text){
  # Get tokens, count_tokens and count_letters
  tokens        <- TokenizeText(text)
  count_tokens  <- length(tokens)
  count_letters <- sum(nchar(tokens))

  # Return mean and round it
  mean <- round(count_letters/count_tokens, digits=2)
  return (mean)
}

# Print the result
cat("Average token length:", get_mean(content), "\n")
