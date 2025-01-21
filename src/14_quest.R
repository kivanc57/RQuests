# Quest 14 - Udpipe --FINAL--
#Create a script that...
#For a given directory, loads all text files and obtains:

#1-The number of tokens
#2-The number of types
#3-The average word length
#4-The average sentence length (using udpipe!)
#5-The total number of verbs (using udpipe!)
#6-The total number of nouns in the genitive case (using udpipe!)
#7-Calculates the entropy of words
#8-Writes all the finding to a custom table

# Load libraries
library(udpipe)
library(stringi)
library(stringr)

# Get functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Declare get_mean
get_mean_count <- function(text, output_type, isType=FALSE){
  # Get tokens, count_tokens and count_letters
  words <- TokenizeText(text)
  if (isType == TRUE){
    words <- unique(words)
  }

  count_words <- length(words)
  if (tolower(output_type) == 'count'){
    return(count_words)
    
  } else if (tolower(output_type) == 'mean') {
    count_letters <- sum(nchar(words))
    mean <- round(count_letters / count_words, digits = 3)
    return(mean)

  } else {
    stop("Invalid 'output_type' value. Use 'count' or 'mean'.")
  }
}


# Declare_get_annotation_table
get_annotation_table <- function(language, text){
  # Download language model, set, annotate and get table
  download_info    <- udpipe_download_model(language=language)
  udpipe_model     <- udpipe_load_model(file=download_info$file_model)
  annotation       <- udpipe_annotate(udpipe_model, x=text)
  annotation_table <- as.data.frame(annotation)
  return(annotation_table)
}

# Declare get_column_mean
get_column_mean <- function(column){
  vector      <- as.vector(table(column))
  mean_sentences <- round(mean(vector), digits=3)
  return(mean_sentences)
}

# Declare get_column_length
get_column_length <- function(column, condition = NULL) {
  # Check if a condition is provided
  if (!is.null(condition)) {
    # Apply the condition to filter the column
    indexes <- which(condition)
    udpipe_amount_verbs <- length(indexes)
  } else {
    # If no condition, return the total length of the column
    udpipe_amount_verbs <- length(column)
  }
  return(udpipe_amount_verbs)
}

# Declare filter_column
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

# Declare get_entropy
get_entropy<- function(column){
  p <- table(column) / length(column)
  entropy <- -sum(p * log(p))
  return (entropy)
}

# main program
directory <- "../data/multiple_texts"
text_files <- list.files(directory, pattern = "\\.txt$", full.names = TRUE)

# Create results df
results <- data.frame()

# Loop through text files
for (i in 1:length(text_files)){
  file <- text_files[i]
  file_name <- basename(file)
  cat("Reading file: ", file_name, "\n")
  content <- GetFileContent(file)

  # Call oltkol functions
  oltkol_count_tokens <- get_mean_count(text=content, output_type='count', isType=FALSE)
  oltkol_count_types  <- get_mean_count(text=content, output_type='count', isType=TRUE)
  oltkol_mean_tokens  <- get_mean_count(text=content, output_type='mean', isType=FALSE)
  oltkol_mean_types   <- get_mean_count(text=content, output_type='mean', isType=TRUE)
  
  # Define annotation_table
  annotation_table <- get_annotation_table('czech', content)
  #View(annotation_table)
  
  # Define udpipe_mean_sentences
  udpipe_mean_sentences <- get_column_mean(annotation_table$sentence_id)
  
  # Define udpipe_amount_verbs
  udpipe_amount_verbs <- get_column_length(
    annotation_table$upos,
    annotation_table$upos == 'VERB'
  )
  
  # Define udpipe_genitive_nouns
  first_condition  <- substr(annotation_table$xpos, 1, 2) == 'NN'
  second_condition <- substr(annotation_table$xpos, 5, 5) == '2'
  udpipe_amount_gen_nouns <- length(
    filter_column(
      annotation_table$token, first_condition, second_condition
    )
  )
  
  # Define udpipe_entropy words
  udpipe_entropy_words <- get_entropy(annotation_table$token)

  # Create a properly named row
  doc_row <- c(
    i,
    file_name,
    oltkol_count_tokens,
    oltkol_count_types,
    oltkol_mean_tokens,
    oltkol_mean_types,
    udpipe_mean_sentences,
    udpipe_amount_verbs,
    udpipe_amount_gen_nouns,
    udpipe_entropy_words
  )
  
  # Append the row to the table
  results <- rbind(results, doc_row)

}

colnames(results) <- c(
  'doc_id',
  'file_name',
  'oltkol_count_tokens',
  'oltkol_count_types',
  'oltkol_mean_tokens',
  'oltkol_mean_types',
  'udpipe_mean_sentences',
  'udpipe_amount_verbs',
  'udpipe_amount_gen_nouns',
  'udpipe_entropy_words'
)

#View(results)
#print(results)
