# Quest 6
# Get the average length of three different languages and make histograms.
# Get the tokens randomly for each.

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

# Get tokens up to index of max vector 
random_max <- c(10, 800, 2000, 230, 1002, 121, 578, 202)
results <- c()

# Iterate each language
for (content in contents){
  # Get tokens, count_tokens and count_letters
  for (el in random_max){
    randomized_tokens <- sample(TokenizeText(content), el, replace=TRUE)
    count_tokens      <- length(randomized_tokens)
    count_letters     <- sum(nchar(randomized_tokens))

    # Return average word length, round and append
    average_length <- round(count_letters/count_tokens, digits=2)
    results <- c(results, average_length)
    }
  # Plot the results
  plot(random_max, results)
  # Neutralize the vector
  results <- c()
  }
