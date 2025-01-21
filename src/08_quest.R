# Quest 8
# Read text, tokenize, get length of words
# Create histogram
# Get confidential interval
# Get mean of mean
# Test the results with t.test
# Compare Italian and German

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get the content
content_it <- GetFileContent("../data/IT.txt")
content_ge <- GetFileContent("../data/GE.txt")

# Get a vector of all
contents <- c(content_ge, content_it)

# Declare get_means
get_means <- function(text, limit) {
  means <- c()
  
  for (i in 1:limit) {
    # Get tokens, count_types and count_letters
    tokens        <- sample(TokenizeText(text), limit, replace = T)
    count_letters <- sum(nchar(tokens))

    mean <-  count_letters/limit
    means <- round(c(means, mean), digits=2)
  }
  return (means)
}

# Declare get_histogram
get_histogram <- function(vector){
  hist(vector)
}

# Declare get_mean
get_mean <- function(vector){
  return (mean(vector))
}

# Declare get_confidence_intervals
get_confidence_intervals <- function(vector, min=0.025, max=0.975) {
  return (qnorm( c(min, max), mean(mean), sd(mean)))
}

# Declare do_ttest 
print_ttest <- function(text){
  print(t.test(nchar(TokenizeText(text)), nchar(TokenizeText(text))))
}

# Iterate each content
for (content in contents) {
  mean <- get_means(content, 1000)
  get_histogram(mean)
  mean_of_mean <- get_mean(mean)
  cat("Mean of Mean:", mean_of_mean, "\n")
  confidence_interval <- get_confidence_intervals(mean)
  cat("-----Confidence Intervals-----\n",
      "Lowest Value  ==>", confidence_interval[1], "\n",
      "Highest Value ==>", confidence_interval[2], "\n")
  print_ttest(content)
}
