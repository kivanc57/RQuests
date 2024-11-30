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

# Declare get_plot
get_plot <- function(length_vector) {
  plot(table(length_vector))
}

# Declare get_average_length_and_plot
get_average_length_and_plot <- function(text) {
  # Get tokens, count_types and count_letters
  tokens        <- TokenizeText(text)
  count_tokens  <- length(tokens)
  count_lengths <- nchar(tokens)
  count_letters <- sum(count_lengths)

  # Get plot
  get_plot(count_lengths)

  # Return average word length and round it
  average_length <- round(count_letters/count_tokens)
  return (average_length)
}

# Print average length for each language
cat("---AFR---\nRetrieving plot and average_length...\nAverage length:", get_average_length_and_plot(content_afr), "\n")
cat("---CH---\nRetrieving plot and average_length...\nAverage length:", get_average_length_and_plot(content_ch), "\n")
cat("---CZ---\nRetrieving plot and average_length...\nAverage length:", get_average_length_and_plot(content_cz), "\n")
