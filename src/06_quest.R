# Quest 6
# Get the mean of three different languages and make histograms.
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
max_list <- 1:2000

# Declare the function
get_means <- function(text, limit_list) {
  means <- c()

  for (limit in limit_list) {
    # Get tokens, count_types and count_letters
    tokens        <- sample(TokenizeText(text), limit, replace = T)  # Get tokens up to i in max_list 
    count_letters <- sum(nchar(tokens))

    mean <-  count_letters/limit
    means <- round(c(means, mean), digits=2)
  }
  return (means)
}

# Iterate each language and print average length, then plot the result
for (content in contents){
  means <- get_means(content, max_list)
  cat("Retrieving means graph...\n")
  plot(max_list, means)
}
