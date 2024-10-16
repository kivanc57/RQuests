# Quest 3
# Get the average length of three different languages and make histograms

# Load the libraries
library(stringi)
library(stringr)

# Get the remote built-int functions
functions <- source("https://raw.githubusercontent.com/oltkkol/vmod/master/simplest_text.R")

# Get data for Afrikaans, Chinese and Czech
content_afr <- GetFileContent("../data/AFR.txt")
content_ch <- GetFileContent("../data/CH2.txt")
content_cz <- GetFileContent("../data/CZ1.txt")

# Get tokens, count_types and count_letters
# AFR
tokens        <- TokenizeText(content_afr)
count_tokens  <- length(tokens)
count_lengths <- nchar(tokens)
count_letters <- sum(count_lengths)

# Return average word length and round it
average_length <- round(count_letters/count_tokens, digits=2)
# Plot count_length
plot(table(count_lengths))


# CH
tokens        <- TokenizeText(content_ch)
count_tokens  <- length(tokens)
count_lengths <- nchar(tokens)
count_letters <- sum(count_lengths)

# Return average word length and round it
average_length <- round(count_letters/count_tokens, digits=2)
# Plot count_length
plot(table(count_lengths))


# CZ
tokens        <- TokenizeText(content_cz)
count_tokens  <- length(tokens)
count_lengths <- nchar(tokens)
count_letters <- sum(count_lengths)

# Return average word length and round it
average_length <- round(count_letters/count_tokens, digits=2)
# Plot count_length
plot(table(count_lengths))
