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
content <- GetFileContent("./data/foglar.txt")

# Download language model, set, annotate and get table
download_info    <- udpipe_download_model(language='czech')
udpipe_model     <- udpipe_load_model(file=download_info$file_model)
annotation       <- udpipe_annotate(udpipe_model, x=content)
annotation_table <- as.data.frame(annotation)
#View(annotation_table)

# Retrieve each noun in the 3rd case (Dative)
noun_position <- substr(annotation_table$xpos, 1, 2)
case_position <- substr(annotation_table$xpos, 5, 5)
indexes <- which(noun_position == 'NN' & dative_position == '3') # NN==noun, 3==3.case(Dative)
dative_nouns <- annotation_table$token[indexes]
dative_nouns

# Retrieve most frequent case for nouns
indexes <- which(noun_position == 'NN')
xposes <- annotation_table$xpos[indexes]
case_freqs <- substr(xposes, 5, 5)
sort(table(case_freqs)) # Most frequent is 1 stands for 'Nominative'
# Since the plots are discrete, t-test is not applicable. Chi-squared test is applicable.
# The difference between two absolute values might be based on
# 'Poisson distribution' or 'Binomial' distribution depending on the event...
