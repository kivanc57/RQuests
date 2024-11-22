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

# Initialize vectors to store the average lengths
average_length_IT <- numeric(1000)
average_length_GE <- numeric(1000)

# Get a token list of 1000 for 1000 times and append to means
## IT ##########################################################################
for (i in 1:1000) {
  # Get randomized_tokens, length_tokens, and count_letters
  randomized_tokens <- sample(TokenizeText(content_it), 10, replace=TRUE)
  length_tokens <- length(randomized_tokens)
  count_letters <- sum(nchar(randomized_tokens))
  
  # Return average word length, round, and append
  average_length_IT[i] <- round(count_letters / length_tokens, digits=2)
}

## GE ##########################################################################
for (i in 1:1000) {
  randomized_tokens <- sample(TokenizeText(content_ge), 10, replace=TRUE)
  length_tokens <- length(randomized_tokens)
  count_letters <- sum(nchar(randomized_tokens))
  
  # Return average word length, round, and append
  average_length_GE[i] <- round(count_letters / length_tokens, digits=2)
}

# Create histograms and save them as .jpeg files
## IT ##########################################################################
jpeg(filename="../results/average_length_histogram_it.jpeg", width=800, height=800)
hist(average_length_IT, main="Histogram of Average Length (IT)", xlab="Average Length of Words")
dev.off()

## GE ##########################################################################
jpeg(filename="../results/average_length_histogram_ge.jpeg", width=800, height=800)
hist(average_length_GE, main="Histogram of Average Length (GE)", xlab="Average Length of Words")
dev.off()

# Get confidence intervals using quantiles
ci_IT <- qnorm( c(0.025, 0.975), mean(average_length_IT), sd(average_length_IT))
ci_GE <- qnorm( c(0.025, 0.975), mean(average_length_GE), sd(average_length_GE))

# Print confidence intervals
cat("Confidence Interval for Italian: Lower =", ci_IT[1], ", Upper =", ci_IT[2], "\n")
cat("Confidence Interval for German: Lower =", ci_GE[1], ", Upper =", ci_GE[2], "\n")

# Calculate the mean of mean
mean_mean_IT <- mean(average_length_IT)
mean_mean_GE <- mean(average_length_GE)

# Conduct t-test to determine
t_test_result <- t.test(nchar(TokenizeText(content_it)), nchar(TokenizeText(content_ge)))
print(t_test_result)
