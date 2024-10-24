# Quest 9
# ...

# Define black_box1 to get a list with random function
black_box1 <- function(amount){
  rnorm(amount, 92, 2)
}

# Define blackbox2 to get a list with random function
blackbox2 <- function(amount){
  rgamma(amount, 2, 17)
}

# Create means vector for 1000 elements
means_1 <- numeric(1000)
means_2 <- numeric(1000)


DO THE SAME PROCESS FOR THE SECOND BLACkBOX



# Use blackbox1 to generate mean
# Append mean to means
for (i in 1:1000){
  sample <- black_box1(10)
  mean <- round(mean(sample), 2)
  means[i] <- mean
}

# Create histogram
hist(means)

# Create and print confidential invervals 
ci <- ( c(0.025, 0.975), mean(means), sd(means) )
cat("Confidence Interval Lower =", ci[1], ", Upper =", ci[2], "\n")

