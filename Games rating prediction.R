video_games=read.csv("video_games.csv")
attach(video_games)

names(video_games)

# Question 1 - i
#1A
summary(video_games$score)

#1B
boxplot(video_games$score, col = "blue", main = "Box Plot of Scores", xlab = "Score")

#1C
hist(video_games$score, breaks = 20, col = "blue", main = "Histogram of Scores", xlab = "Score")

# Question 1 - ii
#1D
summary(video_games$sales_global)

#1E
boxplot(video_games$sales_global, col = "green", main = "Box Plot of Sales Global")

#1F
hist(video_games$sales_global, breaks = 100, col = "green", main = "Histogram of Sales Global", xlab = "Sales Global")

# Question 1 - iii

#1G
summary(video_games$release_year)

#1H
boxplot(video_games$release_year, col = "orange", main = "Box Plot of Release Year")

#1I
hist(video_games$release_year, breaks = 25, col = "orange", main = "Histogram of Release Year", xlab = "Release Year")

# Question 1 - iv

#1K
summary(video_games$count_critic)

#1L
boxplot(video_games$count_critic, col = "purple", main = "Box Plot of Count Critic")


#1M
hist(video_games$count_critic, breaks = 10, col = "purple", main = "Histogram of Count Critic", xlab = "Count Critic")

#1N

# Create a 1x3 layout for three scatter plots
par(mfrow = c(1, 3))

# Convert the "genre" column to a numeric factor with unique colors
video_games$genre_factor <- as.numeric(factor(video_games$genre))

# Scatter plot 1: Sales Global vs. Score
plot(video_games$sales_global, video_games$score, main = "Sales Global vs. Score", xlab = "Sales Global (Millions)", ylab = "Score", col = video_games$genre_factor, pch = 20)

# Scatter plot 2: Release Year vs. Score
plot(video_games$release_year, video_games$score, main = "Release Year vs. Score", xlab = "Release Year", ylab = "Score", col = video_games$genre_factor, pch = 20)

# Scatter plot 3: Count Critic vs. Score
plot(video_games$count_critic, video_games$score, main = "Count Critic vs. Score", xlab = "Count Critic", ylab = "Score", col = video_games$genre_factor, pch = 20)

# Reset the layout to its default
legend("bottomright", legend = levels(factor(video_games$genre)), col = 1:7, pch = 20)
par(mfrow = c(1, 1))

# Question 2-A

# Fit a linear regression model
regression_model_sales <- lm(score ~ sales_global, data = video_games)

# Get the regression coefficients
bo_sales <- coef(regression_model_sales)[1]
b1_sales <- coef(regression_model_sales)[2]

# Get the summary of the regression model
summary_regression_sales <- summary(regression_model_sales)

# Extract R-squared
r_squared_sales <- summary_regression_sales$r.squared

# Extract the 95% confidence interval for b1
conf_interval_b1_sales <- confint(regression_model_sales)[2, ]

# Extract the t-test statistic for b1
t_test_statistic_sales <- summary_regression_sales$coefficients[2, "t value"]

# Calculate the probability that there is not a statistically significant relationship
# This is the p-value associated with the t-test for b1
p_value_sales <- summary_regression_sales$coefficients[2, "Pr(>|t|)"]

# Print the results
cat("bo:", bo_sales, "\n")
cat("b1:", b1_sales, "\n")
cat("R-squared:", r_squared_sales, "\n")
cat("95% Confidence interval for b1:", conf_interval_b1_sales, "\n")
cat("t-test statistic for b1:", t_test_statistic_sales, "\n")
cat("Probability of no statistically significant relationship:", p_value_sales, "\n")

# Create the scatterplot with the regression line and confidence intervals
install.packages("visreg")
library(visreg)

# Create a regression plot
plot(sales_global,score, ylab = "Score", xlab = "Sales Global", main = "Scatterplot: Score vs. Sales Global")

# Add the regression line with confidence intervals
visreg(regression_model_sales, scale = "linear", alpha = 0.05)  # 95% confidence interval



# Question 2-B
# Perform a simple linear regression
model_release_year <- lm(score ~ release_year, data = video_games)

# Extract regression coefficients
bo <- coef(model_release_year)[1]
b1 <- coef(model_release_year)[2]

# Calculate R-squared
r_squared <- summary(model_release_year)$r.squared

# Calculate 95% confidence interval for b1
conf_int <- confint(model_release_year)[2, ]

# Calculate t-test statistic
t_statistic <- summary(model_release_year)$coefficients[2, "t value"]

# Calculate the probability of no statistically significant relationship
p_value_release_year <- summary(model_release_year)$coefficients[2, "Pr(>|t|)"]

# Print the results
cat("bo:", bo, "\n")
cat("b1:", b1, "\n")
cat("R-squared:", r_squared, "\n")
cat("95% Confidence interval for b1:", conf_int, "\n")
cat("t-test statistic for b1:", t_statistic, "\n")
cat("Probability of no statistically significant relationship:", p_value_release_year, "\n")

# Create a regression plot
plot(score, release_year, xlab = "Score", ylab = "Release Year", main = "Scatterplot: Score vs. Release Year")

# Add the regression line with confidence intervals
visreg(model_release_year, scale = "linear", alpha = 0.05)  # 95% confidence interval


# Question 2C - 

# Perform a simple linear regression
model_count_critic <- lm(score ~ count_critic, data = video_games)

# Extract regression coefficients
bo <- coef(model_count_critic)[1]
b1 <- coef(model_count_critic)[2]

# Calculate R-squared
r_squared <- summary(model_count_critic)$r.squared

# Calculate 95% confidence interval for b1
conf_int <- confint(model_count_critic)[2, ]

# Calculate t-test statistic
t_statistic <- summary(model_count_critic)$coefficients[2, "t value"]

# Calculate the probability of no statistically significant relationship
p_value_count_critic <- summary(model_count_critic)$coefficients[2, "Pr(>|t|)"]

# Print the results
cat("bo:", bo, "\n")
cat("b1:", b1, "\n")
cat("R-squared:", r_squared, "\n")
cat("95% Confidence interval for b1:", conf_int, "\n")
cat("t-test statistic for b1:", t_statistic, "\n")
cat("Probability of no statistically significant relationship:", p_value_count_critic, "\n")

# Create a regression plot
plot(score, count_critic, xlab = "Score", ylab = "Release Year", main = "Scatterplot: Score vs. Release Year")

# Add the regression line with confidence intervals
visreg(model_count_critic, scale = "linear", alpha = 0.05)  # 95% confidence interval

# Question 3 - 

# 3 - A
# Coefficients
bo_sales <- coef(regression_model_sales)[1]
b1_sales <- coef(regression_model_sales)[2]


# New sales global value
sales_global_new <- .75

# Calculate the predicted score
predicted_score <- bo_sales + b1_sales * sales_global_new

cat("Predicted Score for 750,000 Sales Global:", predicted_score, "\n")

# 3 - B

# Coefficients for the release_year regression
bo_release_year <- coef(model_release_year)[1]
b1_release_year <- coef(model_release_year)[2]

# Release year for prediction
release_year_new <- 2009

# Calculate the predicted score
predicted_score_release_year <- bo_release_year + b1_release_year * release_year_new

cat("Predicted Score for a Video Game Released in 2009:", predicted_score_release_year, "\n")

# 3-C

# Coefficients for the count_critic regression
bo_count_critic <- coef(model_count_critic)[1]
b1_count_critic <- coef(model_count_critic)[2]

# Number of critics for prediction
count_critic_new <- 80

# Calculate the predicted score
predicted_score_count_critic <- bo_count_critic + b1_count_critic * count_critic_new

cat("Predicted Score for a Video Game Reviewed by 80 Critics:", predicted_score_count_critic, "\n")

#4B
mreg=lm(score~sales_global + release_year + count_critic)
summary(mreg)

#4C
new_df <- data.frame(sales_global = 0.75, release_year = 2009, count_critic = 80)
score4 <- predict(mreg, new_df)
score4


#5A
video_games$Nintendo <- ifelse(video_games$publisher == "Nintendo", 1, 0)
attach(video_games)

mreg=lm(score~release_year+Nintendo)
summary(mreg)

b0 = coef(mreg)[1]
b1 = coef(mreg)[2]
b2 = coef(mreg)[3]
cat("b0 =", b0)
cat("b1 =", b1)
cat("b2 =", b2)


#5C
plot(release_year, score , col=ifelse(Nintendo=="1", "green", "blue"), pch = 0)

abline(b0+b2,b1, col = "green" , lwd = 2, lty = 2)
abline(b0,b1, col = "blue" , lwd = 2, lty = 2)

legend("topleft", pch=1, col=c( "green", "blue" ), c( "Nintendo = 1", "Nintendo = 0"))



#6A
length(unique(video_games$genre))
table(genre)

#6B
video_games$genre=relevel(as.factor(video_games$genre), ref = "Racing")
attach(video_games)

mreg2=lm(score~genre)
summary(mreg2)


#7A
video_games$strategy <- ifelse(video_games$genre == "Strategy", 1, 0)
attach(video_games)

mreg3 = lm(score ~ strategy + Nintendo + Nintendo*strategy)
summary(mreg3)


#7C
mreg4 = lm(score ~ release_year + Nintendo + Nintendo*release_year)
summary(mreg4)

b0 = coef(mreg4)[1]
b1 = coef(mreg4)[2]
b2 = coef(mreg4)[3]
b3 = coef(mreg4)[4]

plot(release_year, score , col=ifelse(Nintendo=="1", "green", "blue"), pch = 17, xlim = c(1985, 2025))

abline(b0+b2,b1+b3, col = "green" , lwd = 2, lty = 2)
abline(b0,b1, col = "blue" , lwd = 2, lty = 2)
legend("bottomleft", pch=17, col=c( "green", "blue" ), c( "Nintendo = 1", "Nintendo = 0"))























