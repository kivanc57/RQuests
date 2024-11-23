# Quest 10
# Find if "i" or "y" is more frequent in a Czech text
# Get histogram
# Get confidence interval

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get the content
content <- GetFileContent("./data/test.txt")

# Declare get_difference_table
get_difference_table <- function(text, coefficient=123, limit=1000) {
  difference_table <- c()

  # Tokenize text with regex
  tokens <- TokenizeText(text, "[iíyý]", regexIsMask=TRUE)

  for (i in 1:limit){
    sample <- sample(tokens, coefficient, replace=TRUE)
    results_i <- length(which(sample == "i"))
    results_í <- length(which(sample == "í"))
    results_y <- length(which(sample == "y"))
    results_ý <- length(which(sample == "ý"))
    
    difference <- abs(((results_i + results_í) - (results_y + results_ý)) / (coefficient))
    difference_table <- c(difference_table, difference)
  }
  return(difference_table)
}

# Declare get_histogram
get_histogram <- function(vector) {
  hist(vector)
}

# Declare get_confidence_intervals
get_confidence_intervals <- function(vector, min=0.025, max=0.975) {
  return (qnorm(c(min, max), mean(vector), sd(vector)))
}

# Call all the functions and start analysis
difference_table <- get_difference_table(content)
get_histogram(difference_table)
confidence_interval <- get_confidence_intervals(difference_table)
cat("-----Confidence Intervals-----\n",
    "Lowest Value  ==>", confidence_interval[1], "\n",
    "Highest Value ==>", confidence_interval[2], "\n")
