# Quest 4
# Plot a text's average length manually. 

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("../data/chapter.txt")

# Create results vector
results <- c()

# Get tokens, count_tokens and count_letters
tokens <- TokenizeText(content)

# Get tokens up to index of max vector 
max <- c(10, 100, 1000, 1000)

# Result for 10
tokens_const  <- tokens[0:10]
count_tokens  <- length(tokens_const)
count_letters <- sum(nchar(tokens))

# Return average word length, round and append
average_length <- round(count_letters/count_tokens, digits=2)
append(results, average_length)

#####################################

# Result for 100
tokens_const  <- tokens[0:100]
count_tokens  <- length(tokens_const)
count_letters <- sum(nchar(tokens))

# Return average word length, round and append
average_length <- round(count_letters/count_tokens, digits=2)
append(results, average_length)

#####################################

# Result for 1000
tokens_const  <- tokens[0:1000]
count_tokens  <- length(tokens_const)
count_letters <- sum(nchar(tokens))

# Return average word length, round and append
average_length <- round(count_letters/count_tokens, digits=2)
append(results, average_length)

#####################################

# Result for 10000
tokens_const  <- tokens[0:10000]
count_tokens  <- length(tokens_const)
count_letters <- sum(nchar(tokens))

# Return average word length, round and append
average_length <- round(count_letters/count_tokens, digits=2)
append(results, average_length)


# Plot the results
plot(max, results)
