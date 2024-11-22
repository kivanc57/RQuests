# Quest 11 (Humanities Quest)
# There are 5 people settled in a wagon
# 3 on the table side, 2 on the window side
# Those 2 on the window side are left-handed
# The given claim: It is COMMON
# Create a Stochastic simulation for the evidence
# NOTE: Approx. 10% of people are left-handed

# Create population
population <- c (rep("R", 90) , rep("L", 10))

# Create left_population with buffer 1000
left_population <- numeric()

# Create random of 5 and for 1000x times
# 1 person == 1 seat --- replace=FALSE
for (i in range(1:1000)){
  wagon <- sample(population, 5, replace=FALSE)
  left_instance  <- length(which(wagon == "L"))
  left_population <- c(left_population, left_instance)
}

# Get table
left_table <- table(left_population)

# Get length
left_length <- length(left_population)

# Create and save barplot
jpeg(filename="../results/left_barplot.jpeg", width=800, height=800)
barplot(left_table / left_length, 
        main = "Proportion of Left-Handed Individuals in Samples",
        xlab = "Number of Left-Handed Individuals",
        ylab = "Proportion",
        col = "blue")
dev.off()

# Get confidence interval and print
confidence_interval <- qnorm( c(0.025, 0.975), mean(left_population), sd(left_population))
print(confidence_interval)

####### TEST ########################
left_cumulated <- cumsum(left_table)
left_cumulated

barplot(left_table)
barplot(left_cumulated)

plot(left_table, type="b")			#„polygon četností“
plot(left_cumulated, type="b")	#„součtová křivka“
