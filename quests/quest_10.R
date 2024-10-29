# Quest 10
# Find if "i" or "y" is more frequent in a Czech text

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get the content
content <- GetFileContent("../data/test.txt")

# Tokenize text with regex
results <- TokenizeText(content, "[iíyý]", regexIsMask=TRUE)

# Get results
table(results)

# Relative difference constant
relative_constant <- 123

# Create difference_table vector
difference_table <- numeric()

# Randomize the results
for (i in 1:1000){
  randomized_results <- sample(results, relative_constant, replace=TRUE)
  results_i <- length(which(randomized_results == "i"))
  results_í <- length(which(randomized_results == "í"))
  results_y <- length(which(randomized_results == "y"))
  results_ý <- length(which(randomized_results == "ý"))
  
  difference <- abs(((results_i + results_í) - (results_y + results_ý)) / (relative_constant))
  difference_table <- append(difference_table, difference)
  hist(difference_table)
}

# Get confidence interval
qnorm( c(0.025, 0.975), mean(difference_table), sd(difference_table))
