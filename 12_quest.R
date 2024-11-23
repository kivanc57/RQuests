# Quest 12 - Udpipe
# Retrieve each word with single character
# Get frequency table, POS, average word length
# Visualize how word length changes by the length of the text
# Get all the lemmas with „Švejk“, ensure the most frequent syntactical role

# Load libraries
library(udpipe)
library(stringi)
library(stringr)

# Get functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get content
content <- GetFileContent("./data/svejk.txt")

# Download language model, set, annotate and get table
download_info    <- udpipe_download_model(language='czech')
udpipe_model     <- udpipe_load_model(file=download_info$file_model)
annotation       <- udpipe_annotate(udpipe_model, x=content)
annotation_table <- as.data.frame(annotation)
#View(annotation_table)

# Get single characters
single_letter_condition <- grepl("[a-zA-Z]", annotation_table$token)
single_letter_vector    <- annotation_table[single_letter_condition, "token"]

# Get (frequency) table of lemma
sort(table(annotation_table$lemma), decreasing = T)

# Get (frequency) table of POS
sort(table(annotation_table$upos), decreasing = T)

# Get average length of text
id_vector <- as.vector(table(annotation_table$sentence_id))
mean <- mean(id_vector)
cat("Mean of text:", mean, "\n")

# Get plot of how mean changes by length of text
plot(id_vector, type="b")

# Get all the lemmas with „Švejk“
indexes <- which(annotation_table$lemma == "Švejk")
# Ensure the most frequent syntactical role
roles <- annotation_table$dep[indexes] #Check this again!!!!!
sort(table(roles), decreasing = T)
