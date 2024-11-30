# Quest 5
# Retrieve means by the length of the text with limitations. 
# Use for for iteration and automate it 

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data
content <- GetFileContent("../data/chapter.txt")

# Get tokens up to index of max vector 
max_list <- c(10, 100, 1000, 1000)

# Declare the function
get_means <- function(text, limit_list) {
  means <- c()
  
  for (limit in limit_list) {
    # Get tokens, count_types and count_letters
    tokens        <- TokenizeText(text)[1:limit]  # Get tokens up to i in limit_list 
    count_letters <- sum(nchar(tokens))
    
    mean <- round(count_letters/limit, digits=2)
    means <- c(means, mean)
  }
  return (means)
}

# Call get_means and assign it to means 
means <- get_means(content, max_list)

# Iterate each language and print average length, then plot the result
for (i in 1:length(max_list)){
  cat("For max tokens", max_list[i], ": Average length ==>", means[i], "\n")
}
plot(max_list, means)

