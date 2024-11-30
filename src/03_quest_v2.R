# Quest 3
# Get the mean of three different languages and make histograms.
# PS: This version is the iterative version with for

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

# Declare get_plot
get_plot <- function(length_vector) {
  plot(table(length_vector))
}

# Declare get_mean_and_plot
get_mean_and_plot <- function(text) {
  # Get tokens, count_types and count_letters
  tokens        <- TokenizeText(text)
  count_tokens  <- length(tokens)
  count_lengths <- nchar(tokens)
  count_letters <- sum(count_lengths)
  
  # Get plot
  get_plot(count_lengths)
  
  # Return mean and round it
  mean <- round(count_letters/count_tokens)
  return (mean)
}

# Iterate each language
for (content in contents){
  cat("Retrieving plot and mean...\n",
      "Mean:", get_mean(content), "\n")
}
