# Quest 5
# Plot a text's average length iteratively. 

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("../data/chapter.txt")

# Get tokens, count_tokens and count_letters
tokens <- TokenizeText(content)

# Get tokens up to index of max vector 
max     <- c(10, 100, 1000, 1000)
results <- c()
for (el in max){
  tokens_const  <- tokens[0:el]
  count_tokens  <- length(tokens_const)
  count_letters <- sum(nchar(tokens))

  # Return average word length, round and append
  average_length <- round(count_letters/count_tokens, digits=2)
  append(results, average_length)
}
plot(max, results)

