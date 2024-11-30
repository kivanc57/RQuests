# Quest 13 - Udpipe
# Retrieve each noun in 3. case (Dative)
# Which nouns are the most common?
# How can you ensure statistically?
# Is it possible to apply t-test?
# (Which distribution leads to two absolute calculation?)
# Use substr(), 'xpos' column

# Load libraries
library(udpipe)
library(stringi)
library(stringr)

# Get functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get content
content <- GetFileContent("../data/foglar.txt")

# Download language model, set, annotate and get table
get_annotation_table <- function(language, text){
  download_info    <- udpipe_download_model(language=language)
  udpipe_model     <- udpipe_load_model(file=download_info$file_model)
  annotation       <- udpipe_annotate(udpipe_model, x=text)
  annotation_table <- as.data.frame(annotation)
  return(annotation_table)
}

filter_column <- function(column, ...) {
  # Combine all conditions passed as arguments
  conditions <- list(...)
  
  # If no conditions are provided, return the column as-is
  if (length(conditions) == 0) {
    return(column)
  }
  # Evaluate combined conditions using Reduce and logical AND
  combined_condition <- Reduce(`&`, conditions)

  # Filter the column based on the combined condition
  indexes <- which(combined_condition)
  filtered_column <- column[indexes]
  return(filtered_column)
}

annotation_table <- get_annotation_table('czech', content)
#View(annotation_table)

# Retrieve each noun in the 3rd case (Dative)
first_condition <- substr(annotation_table$xpos, 1, 2) == 'NN'
second_condition <- substr(annotation_table$xpos, 5, 5) == '3'
token_column <- annotation_table$token
filter_column(token_column, first_condition, second_condition)

# Retrieve most frequent case for nouns
filter_column(first_condition, annotation_table$xpos)
case_freqs <- substr(annotation_table$xpos, 5, 5)
sort(table(case_freqs)) # Most frequent is 1 stands for 'Nominative'

# Since the values are discrete, t-test is not applicable. Chi-squared test is applicable.
# The difference between two absolute values might be based on
# 'Poisson distribution' or 'Binomial' distribution depending on the event...
