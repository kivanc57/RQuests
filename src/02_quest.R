# Quest 2
# Get the average length of a dictionary based on a text.

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("../data/svejk.txt")

# Declare the function
get_mean <- function(text) {
  # Get dictionary, count_types and count_letters
  types         <- unique(TokenizeText(text))
  count_types   <- length(types)
  count_letters <- sum(nchar(types))
  
  # Return mean and round it
  mean <- round(count_letters/count_types, digits=2)
  return(mean)
}

# Print average type length
cat("Average type length:", get_mean(content), "\n")
