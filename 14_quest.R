# Quest 13 - Udpipe
#Create a script that...
#For a given directory, loads all text files and obtains:

#1-The number of tokens
#2-The number of types
#3-The average word length
#4-The average sentence length (using udpipe!)
#5-The total number of verbs (using udpipe!)
#6-The total number of nouns in the genitive case (using udpipe!)
#7-Calculates the entropy of words


# Load libraries
library(udpipe)
library(stringi)
library(stringr)

# Get functions
folder_path <- "./data/"
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get content
content <- GetFileContent("./data/multiple_texts")

# Download language model, set, annotate and get table
download_info    <- udpipe_download_model(language='czech')
udpipe_model     <- udpipe_load_model(file=download_info$file_model)
annotation       <- udpipe_annotate(udpipe_model, x=content)
annotation_table <- as.data.frame(annotation)
#View(annotation_table)
