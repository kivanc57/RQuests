# Quest 3
# Get the average length of three different languages and make histograms

# Load the libraries
library(stringi)
library(stringr)

# Assign variables
count <- 0
total <- 0
languages <- 0

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")


# Get data for Afrikaans, Chinese and Czech
content_afr <- GetFileContent("../data/AFR.txt")
content_ch <- GetFileContent("../data/CH2.txt")
content_cz <- GetFileContent("../data/CZ1.txt")

# Get a vector of all
contents <- c(content_afr, content_ch, content_cz)

# 
for (content in content){
  tokens <- TokenizeText(content)
  length_list <- nchar(content)
# Get total and count 
  for (length in length_list){
    total <- total + length
    count <- count + 1
  }
# Return average word length and round it
  average_length = round(total/count, digits=2)
# Plot each language
  plot(table(length_list))
}
