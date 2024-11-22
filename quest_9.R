# Quest 9
# Get random list functions
# Create random lists with them
# Create histogram
# Create confidential intervals

# Define black_box1 to get a list with random function
black_box1 <- function(amount){
  rnorm(amount, 92, 2)
}

# Define black_box2 to get a list with random function
black_box2 <- function(amount){
  rgamma(amount, 2, 17)
}

# Create means vector for 1000 elements
means_1 <- numeric(1000)
means_2 <- numeric(1000)

#### black_box1 ##########################################################################
# Use black_box1 to generate mean
# Append mean to means
for (i in 1:1000){
  sample <- black_box1(10)
  mean <- round(mean(sample), 2)
  means_1[i] <- mean
}

# Create histogram
hist(means_1)

# Create and print confidential invtervals 
ci_1 <- qnorm( c(0.025, 0.975), mean(means_1), sd(means_1) )
cat("Confidence Interval Lower =", ci_1[1], ", Upper =", ci_1[2], "\n")



#### black_box2 ##########################################################################
# Use black_box2 to generate mean
# Append mean to means
for (j in 1:1000){
  sample <- black_box2(10)
  mean <- round(mean(sample), 2)
  means_2[j] <- mean
}

# Create histogram
hist(means_2)

# Create and print confidential intervals 
ci_2 <- qnorm( c(0.025, 0.975), mean(means_2), sd(means_2) )
cat("Confidence Interval Lower =", ci_2[1], ", Upper =", ci_2[2], "\n")
