# Load the required libraries
library(cluster)
# Install the ggplot2 package
install.packages("ggplot2")

# Load the ggplot2 library
library(ggplot2)

# Your remaining code for k-means clustering and plotting
# ...

library(ggplot2)

# Load and preprocess the red wine quality dataset
data <- read.csv("winequalityN.csv")

# Remove rows with missing values
data <- na.omit(data)

# Standardize the variables
data_scaled <- scale(data[, c("pH", "alcohol", "sulphates", "total.sulfur.dioxide")])

# Determine the optimal value of k using the elbow method
wss <- sapply(1:10, function(k) kmeans(data_scaled, centers = k)$tot.withinss)
plot(1:10, wss, type = "b", xlab = "Number of Clusters (k)", ylab = "Within-cluster Sum of Squares (wss)")

# Perform k-means clustering with the optimal value of k
k <- 3  # Replace with the optimal value of k
kmeans_result <- kmeans(data_scaled, centers = k)

# Add cluster labels to the dataset
data$cluster <- factor(kmeans_result$cluster)

# Plot the values in the k-means clusters
ggplot(data, aes(x = pH, y = alcohol, color = cluster)) +
  geom_point() +
  labs(title = "K-means Clustering of Red Wine Quality",
       x = "pH",
       y = "alcohol")
