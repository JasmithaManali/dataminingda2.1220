library(ggplot2)
library(cluster)

# Load and preprocess the data
data <- read.csv("winequalityN.csv")
data_scaled <- scale(data[, c("pH", "alcohol", "sulphates", "total.sulfur.dioxide")])

# Perform k-medoids clustering
k <- 3  # Number of clusters
kmedoids_result <- pam(data_scaled, k)

# Add cluster labels to the dataset
data$cluster <- factor(kmedoids_result$clustering)

# Plot the values in the k-medoids clusters
plot_cluster <- ggplot(data, aes(x = pH, y = alcohol, color = cluster)) +
  geom_point() +
  labs(title = "K-medoids Clustering of Red Wine Quality",
       x = "pH",
       y = "alcohol")
print(plot_cluster)
