# Telecom Churn Prediction
## Predicting Telecom Churn using machine learning process using R programming
The Telecom Churn Prediction project is a data science project implemented in R programming language, aimed at developing a predictive model to forecast the churn of telecom based on various features and attributes. This project utilizes machine learning algorithms and statistical techniques to analyze historical data on television sales and characteristics, and to build a model capable of predicting future prices.

**Basic understanding of code**
* Collect historical data on telecom, including features such as total_day_charges, total_eve_charges, churn etc
* Churn is the categorical data (dependable_varibale/output_variable)
* Since its categorical we can use two test in this namely- anova & chi square
* Anova for categorical(dependent_varible) & categorical(independent_variable)
* Chi Square for categorical(dependent_varible) & continous(independent_variable) 
* Perform all necessary Data Cleaning - remove/fill missing values, change data types
* Find correlation between attributes - remove non correlated attributes(columns)
* Build and train the model on the currect existing prices along with other attributes
* Using the model find the churn predicted of the telecom services

**Dependencies**
* R Programming Language
* Libraries: corrr, dplyr, caTools

**Data Sources**
* Historical sales data from retailers or online platforms
* Publicly available datasets on television specifications and prices
