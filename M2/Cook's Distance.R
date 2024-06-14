# Load necessary library
library(stats)

# Set seed for reproducibility
set.seed(123)

# Generate data
x <- 1:100
y <- 2 * x + rnorm(100, sd = 10)  # Normally distributed errors

# Introduce an outlier at the 50th observation to simulate the effect of an influential point
y[50] <- y[50] + 100  

# Fit linear model
model_1 <- lm(y ~ x)

# Plot diagnostics: Cook's Distance
# Cook's Distance is used here to visualize and identify the influence of individual data points
# on the regression model, particularly focusing on how the outlier affects the model's estimates.
plot(model_1, which = 4)  # Plot number 4 is Cook's Distance

# Optionally, add a line to indicate a common threshold for influential points
# Points above this threshold are considered significantly influential and could potentially
# distort the regression analysis if not addressed.
abline(h = 0.05, col = "red", lty = 2)

