library(ggplot2)
data <- read.csv("winequalityN.csv")
data_scaled <- scale(data[, c("pH", "alcohol", "sulphates", "total.sulfur.dioxide")])
k <- 3  # Number of clusters
pam_result <- pam(data_scaled, k)
data$cluster <- factor(pam_result$clustering)
plot_cluster <- ggplot(data, aes(x = pH, y = alcohol, color = cluster)) +
  geom_point() +
  labs(title = "PAM Clustering of Red Wine Quality",
       x = "pH",
       y = "alcohol")
print(plot_cluster)
