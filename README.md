# Chennai Housing Sales Price Prediction Using Jupyter

## Overview

This repository contains code and data for predicting housing sales prices in Chennai. The project aims to develop a machine learning model that can predict the sales price of houses based on various features.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Data](#data)
- [Model](#model)
- [Results](#results)

## Overview

The goal of this project is to predict housing sales prices in Chennai using a machine learning model. The code provided includes data preprocessing, feature engineering, model training, and evaluation.

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/SamTamil007/Chennai-Housing-Sales-Price.git
   ```

2. Navigate to the project directory:

   ```bash
   cd Chennai-Housing-Sales-Price
   ```

3. Install the required dependencies:

   ```bash
   pip install -r requirements.txt
   ```

## Usage

1. Make sure you have the required Python packages installed.
2. Run the Jupyter Notebook `Chennai_Housing_Sales_Prediction.ipynb` to see the step-by-step process of data preprocessing, model training, and evaluation.
3. Modify the `new_data` dictionary in the notebook to make predictions for new data points.

## Data

The dataset used for this project is located in the `DataSet_SecondaryData` directory. It contains information about housing sales in Chennai, including features such as square footage, number of bedrooms and bathrooms, quality scores, and other relevant details.

## Model

We used a Linear Regression model for this prediction task. The model is trained on the provided dataset and is capable of predicting housing sales prices based on input features.

## Results

The model's performance is evaluated using cross-validation and the mean squared error metric. The results are discussed and presented in the Jupyter Notebook.

# Chennai Housing Price Prediction Using R

This repository contains R code to predict housing sales prices in Chennai using various regression models. The code covers the entire process, from data preprocessing to model selection and evaluation. It utilizes libraries like `readr`, `caret`, `randomForest`, and `kernlab` for the analysis.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Installation](#installation)
- [Data](#data)
- [Methodology](#methodology)
- [Results](#results)
- [Notes](#notes)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

Predicting housing prices is a critical task in the real estate market. This repository provides an end-to-end solution for predicting housing sales prices in Chennai, India. The R script included in this repository demonstrates the entire process, from data preprocessing to model selection and evaluation.

## Usage

To use the code in this repository, follow these steps:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/chennai-housing-prediction.git

   ```

2. Set up your R environment and ensure you have the required libraries installed.

3. Place the dataset named "Chennai Housing Sales Price.csv" in the `DataSet_SecondaryData` directory.

4. Open and run the R script named `chennai_housing_prediction.R`. This script performs the following steps:

   - Reads and preprocesses the dataset, including renaming areas and performing data imputation.
   - Identifies and removes outliers from the `N_BEDROOM` and `N_BATHROOM` columns using the IQR method.
   - Creates candidate regression models with various features and variables.
   - Performs k-fold cross-validation to evaluate each model's performance and selects the best model based on RMSE.
   - Trains the final model using the selected features.
   - Makes predictions on new data using the trained model.

5. Modify the `new_data` dataframe with your own input values for prediction.

6. Run the entire script to see the predicted housing prices for the new data.

## Notes

- The provided R code is for educational and demonstration purposes. Feel free to adapt and modify it for your specific use case.
- Ensure you have the required datasets and libraries installed before running the code.
- Remember to adjust paths and filenames as necessary to match your file locations.

## Data

- The dataset used for this analysis is named "Chennai Housing Sales Price.csv". Make sure to place this dataset in the `DataSet_SecondaryData` directory before running the analysis.

## Methodology

- The R script `chennai_housing_prediction.R` follows these main steps:

  1.  Data preprocessing, including renaming areas and performing data imputation.
  2.  Outlier removal from the `N_BEDROOM` and `N_BATHROOM` columns using the IQR method.
  3.  Creation of candidate regression models with various features and variables.
  4.  K-fold cross-validation to evaluate each model's performance and selection of the best model based on RMSE.
  5.  Training of the final model using the selected features.
  6.  Making predictions on new data using the trained model.

## Results

- The results of this housing price prediction analysis can be observed by running the `chennai_housing_prediction.R` script and examining the predicted housing prices for the new data provided.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or create a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

- For any questions or concerns, please open an issue or contact SAMTamil007 directly.

Happy predicting!
