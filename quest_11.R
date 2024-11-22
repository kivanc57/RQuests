# Quest 11 (Humanities Quest)
# There are 5 people settled in a wagon
# 3 on the table side, 2 on the window side
# Those 2 on the window side are left-handed
# The given claim: It is COMMON
# Create a Stochastic simulation for the evidence
# NOTE: Approx. 10% of people are left-handed

# Create population
population <- c (rep("R", 90) , rep("L", 10))

# Create left-handed counts in 1000 simulations
get_left_population <- function(wagon_size = 5, range_limit = 1000) {
  left_population <- c()
  
  for (i in 1:range_limit) {
    wagon           <- sample(population, wagon_size, replace = FALSE)  # Random selection
    left_instance   <- length(which(wagon == "L"))  # Count left-handed individuals
    left_population <- c(left_population, left_instance)
  }
  
  return(left_population)
}

# Declare get_confidence_intervals
get_confidence_intervals <- function(vector, min=0.025, max=0.975) {
  return (qnorm(c(min, max), mean(vector), sd(vector)))
}

# Declare get_barplot
get_barplot <- function(table){
  # Create and save barplot
  barplot(
    table, 
    main = "Proportion of Left-Handed Individuals in Samples",
    xlab = "Number of Left-Handed Individuals",
    ylab = "Proportion",
    col = "blue")
}

# Call get_left_population and get_barplot
left_population <- get_left_population()

# Get left_table
left_table <- table(left_population) / length(left_population)

# Call get_barplot
get_barplot(left_table)

# Call get_confidence_interval and print
confidence_interval <- get_confidence_intervals(left_population)
cat("-----Confidence Interval for Left Population of 5-person Wagons-----\n",
    "Lowest Value  ==>", confidence_interval[1], "\n",
    "Highest Value ==>", confidence_interval[2], "\n")

# Get left_cumulated 
left_cumulated <- cumsum(left_table)
left_cumulated

# Get barplot for left_table and left_cumulated
barplot(left_table)
barplot(left_cumulated)

# Get plot for left_table and left_cumulated
plot(left_table, type="b")			#„polygon četností“
plot(left_cumulated, type="b")	#„součtová křivka“
