# Quest 1
# Get the average length of a text

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("../data/svejk.txt")

# Get tokens, count_tokens and count_letters
tokens        <- TokenizeText(content)
count_tokens  <- length(tokens)
count_letters <- sum(nchar(tokens))

# Return average word length and round it
average_length <- round(count_letters/count_tokens, digits=2)
