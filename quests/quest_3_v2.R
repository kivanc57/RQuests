# Quest 3
# Get the average length of three different languages and make histograms.

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data for Afrikaans, Chinese and Czech
content_afr <- GetFileContent("../data/AFR.txt")
content_ch <- GetFileContent("../data/CH2.txt")
content_cz <- GetFileContent("../data/CZ1.txt")

# Get a vector of all
contents <- c(content_afr, content_ch, content_cz)

# Iterate each language
for (content in content){
  # Get tokens, count_types and count_letters
  tokens        <- TokenizeText(content)
  count_tokens  <- length(tokens)
  count_lengths <- nchar(tokens)
  count_letters <- sum(count_lengths)

  # Return average word length and round it
  average_length <- round(count_letters/count_tokens, digits=2)
  # Plot each count_length
  plot(table(count_lengths))
}
