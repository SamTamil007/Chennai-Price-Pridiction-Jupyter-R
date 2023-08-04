# Load the required libraries
library(readr)
library(caret)
library(randomForest)
library(kernlab)

# Read the data and preprocess it
Chennai_Housing_Sales_Price <- read_csv("E:/Project_2/DataSet_SecondaryData/Chennai Housing Sales Price.csv",
                                        col_types = cols(DATE_SALE = col_date(format = "%d-%m-%Y"),
                                                         DATE_BUILD = col_date(format = "%d-%m-%Y")))
df1 <- Chennai_Housing_Sales_Price
unique(Chennai_Housing_Sales_Price$AREA)
# Data preprocessing (rename areas)
df1$AREA[df1$AREA == "Velchery"] <- "Velachery"
df1$AREA[df1$AREA %in% c( "Chrompt", "Chrmpet", "Chormpet")] <- "Chormpet"
df1$AREA[df1$AREA == "TNagar"] <- "T Nagar"
df1$AREA[df1$AREA == "KKNagar"] <- "KK Nagar"
df1$AREA[df1$AREA == "Karapakam"] <- "Karapakkam"
df1$AREA[df1$AREA %in% c("Ann Nagar", "Ana Nagar")] <- "Anna Nagar"
df1$AREA[df1$AREA == "Adyr"] <- "Adyar"

# Perform data imputation (omit rows with missing values)
df2 <- na.omit(df1)

# Convert df2 to a data frame and name it df3
df3 <- as.data.frame(df2)
boxplot(df3$N_BEDROOM,horizontal = TRUE)

# Identify and remove outliers from N_BEDROOM and N_BATHROOM columns
outlier_threshold <- 1.5  # Adjust this value to control the sensitivity of outlier detection

# Function to remove outliers based on IQR method
remove_outliers <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR_val <- Q3 - Q1
  lower_bound <- Q1 - outlier_threshold * IQR_val
  upper_bound <- Q3 + outlier_threshold * IQR_val
  x[which(x < lower_bound | x > upper_bound)] <- NA
  return(x)
}

# Apply the remove_outliers function to N_BEDROOM and N_BATHROOM columns
df3$N_BEDROOM <- remove_outliers(df3$N_BEDROOM)
df3$N_BATHROOM <- remove_outliers(df3$N_BATHROOM)

# Remove rows with NA values after outlier removal
df3 <- na.omit(df3)

# Create candidate models with a variety of regression methods
candidate_models <- list(
  #  model1 = SALES_PRICE ~ N_BEDROOM,
  #  model2 = SALES_PRICE ~ N_BEDROOM + N_BATHROOM,
  #  model3 = SALES_PRICE ~ N_BEDROOM + N_BATHROOM + AREA,
  #  model4 = SALES_PRICE ~ poly(N_BEDROOM, 2),
  #  model5 = SALES_PRICE ~ N_BEDROOM + factor(AREA),
  #  model6 = SALES_PRICE ~ N_BEDROOM + N_BATHROOM + factor(AREA),
  model7 = SALES_PRICE ~ N_BEDROOM + N_BATHROOM + factor(AREA) + INT_SQFT +factor(SALE_COND)+factor(PARK_FACIL)+factor(BUILDTYPE)+factor(UTILITY_AVAIL)+factor(STREET)+factor(QS_ROOMS)+REG_FEE+COMMIS
)

# Number of cross-validation folds
num_folds <- 5

# Set a random seed for reproducibility
set.seed(123)

# Perform cross-validation and store the results in cv_results
cv_results <- lapply(candidate_models, function(formula) {
  model <- train(formula, data = df3, method = "lm", trControl = trainControl(method = "cv", number = num_folds))
  return(model)
})

# Extract the RMSE values from the cross-validation results (you can use other metrics too)
evaluation_metrics <- sapply(cv_results, function(model) {
  predictions <- predict(model, newdata = df3)
  true_values <- df3$SALES_PRICE
  return(sqrt(mean((true_values - predictions)^2))) # RMSE used for evaluation
})

# Find the index of the best model based on the lowest RMSE value
best_model_index <- which.min(evaluation_metrics)

# Retrieve the best model formula based on the index
best_model <- candidate_models[[best_model_index]]

# Convert the formula to a character string
best_model_formula <- as.character(formula(best_model))

# Print the best model's formula and RMSE value
cat("Best model formula:", best_model_formula, "\n")
cat("Best model RMSE:", evaluation_metrics[best_model_index], "\n")

final_model <- train(best_model, data = df3, method = "lm")

# Print the final model summary (optional)
print(summary(final_model$finalModel))

# Create the example new data as a data frame
new_data <- data.frame(
  N_BEDROOM = c(1, 2, 1),
  N_BATHROOM = c(1, 1, 1),
  AREA = c("Karapakkam", "Anna Nagar", "Adyar"),
  INT_SQFT = c(1004,1986,909),
  DIST_MAINROAD = c(131,26,70),
  SALE_COND=c("AbNormal","AbNormal","AbNormal"),
  PARK_FACIL=c("Yes","No","Yes"),
  BUILDTYPE=c("Commercial","Commercial","Commercial"),
  UTILITY_AVAIL=c("AllPub","AllPub","ELO"),
  STREET=c("Paved","Gravel","Gravel"),
  QS_ROOMS=c(4.0,4.9,4.1),
  REG_FEE=c(380000,760122,421094),
  COMMIS=c(144400,304049,92114)
)

# Make predictions on new_data using the trained model
predictions <- predict(final_model, newdata = new_data)

# Display the predictions
print(predictions)

# Create a new boxplot after outlier removal
boxplot(df3$N_BEDROOM, df3$N_BATHROOM, horizontal = TRUE)
