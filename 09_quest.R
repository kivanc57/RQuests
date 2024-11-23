# Quest 9
# Prepare two functions with random distribution methods
# Generate vectors
# Calculate means, create histograms and get confidence intervals of both

# Declare black_box1 to get a list with random function
black_box1 <- function(amount=10){
  return (rnorm(amount, 92, 2))
}

# Declare black_box2 to get a list with random function
black_box2 <- function(amount=10){
  return (rgamma(amount, 2, 17))
}

# Declare get_means
get_means <- function(input_function, limit=1000){
  means <- c()
  for (i in 1:limit){
    values <- input_function()  # Call the function to get random values
    mean_value <- round(mean(values), digits=2)
    means <- c(means, mean_value)
  }
  return(means)
}

# Declare get_histogram
get_histogram <- function(vector){
  hist(
    vector,
    main="Histogram of Means",
    col="lightblue",
    border="black",
    xlab="Mean Values"
  )
}

# Declare get_confidence_intervals
get_confidence_intervals <- function(vector, min=0.025, max=0.975) {
  return (qnorm(c(min, max), mean(vector), sd(vector)))
}

##############################################################################

# black_box1
means_black_box1 <- get_means(black_box1, 1000)
get_histogram(means_black_box1)
confidence_interval1 <- get_confidence_intervals(means_black_box1)
cat("-----Confidence Intervals for Black Box 1-----\n",
    "Lowest Value  ==>", confidence_interval1[1], "\n",
    "Highest Value ==>", confidence_interval1[2], "\n")

# black_box2
means_black_box2 <- get_means(black_box2, 1000)
get_histogram(means_black_box2)
confidence_interval2 <- get_confidence_intervals(means_black_box2)
cat("-----Confidence Intervals for Black Box 2-----\n",
    "Lowest Value  ==>", confidence_interval2[1], "\n",
    "Highest Value ==>", confidence_interval2[2], "\n")
