# Load the libraries
library(stringi)
library(stringr)

# Assign variables
count = 0
total = 0

# Get the remote built-int functions
remote <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("../data/svejk.txt")

# Get tokens
tokens <- TokenizeText(remote)

# Calculate total and sum
for (token in tokens){
  total <- total + nchar(token)
  count <- count + 1
}

# Return average word length and round it
average_length = round(total/count, digits=2)
