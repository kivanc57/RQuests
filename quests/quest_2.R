# Quest 2
# Get the average length of a dictionary based on a text

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("../data/svejk.txt")

# Get dictionary, count_types and count_letters
dictionary    <- unique(TokenizeText(content))
count_types   <- length(dictionary)
count_letters <- sum(nchar(dictionary))

# Return average word length and round it
average_length <- round(count_letters/count_types, digits=2)
