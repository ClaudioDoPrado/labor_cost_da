
## IronHack Data Analytics Final Project

## Presentation

    https://docs.google.com/presentation/d/1RD8R0BUIan_Ss-fajyHUXQkGZCnehIbx425L0O_sUT8/edit?usp=sharing

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Python

# File : (labor_cost_da.ipynb)

# Labor Cost Data Analysis with Pandas, Seaborn, and Matplotlib

This file loads, cleans, visualizes, and analyzes labor cost data from a CSV file containing percentage wages per department over time.

# Data Loading and Initial Inspection
- Imported necessary libraries (`pandas`, `matplotlib`, `seaborn`, `numpy`, `scipy`)
- Loaded data from a CSV file
- Transposed and reformatted data for easier analysis
- Renamed columns for clarity (`service`, `kitchen`, `dishwasher`)
- Converted date strings to `datetime` objects and formatted as `DD/MM/YYYY`

# Data Cleaning
- Removed redundant rows (`Average`, `Last year`, `Cummulative`)
- Dropped unnecessary columns (`Facilitair`, `Management`, `Total`)
- Filtered out rows with negative or zero values (for numerical consistency)
- Saved cleaned data to `'labor_percentage.csv'`

# Exploratory Data Analysis
- Checked data types, null values, and unique value counts
- Summarized descriptive statistics (`mean`, `median`, `mode`, variance, std, min, max, quantiles)
- Visualized data distributions with:
  - Boxplots for each variable
  - Pairplots for comparative analysis
  - Histograms with KDE overlays

# Outlier Detection & Handling
- Used Z-scores (>3) to identify outliers
- Visualized outliers in scatter plots
- Replaced outliers with median + threshold (capping)
- Calculated IQR to identify outliers, reviewing specific outlier rows

# Correlation Analysis
- Calculated correlation matrix for numeric variables
- Visualized correlations via heatmap

# Derived Metrics
- Created a `'Total'` column by summing `service`, `kitchen`, and `dishwasher`
- Calculated measures of central tendency and dispersion for `'Total'`
- Assessed skewness and kurtosis
- Generated distribution histograms for `'Total'` and individual components
- Performed Q-Q plots to assess normality

# Notes
- The dataset spans from 2020 to 2025, with daily data points
- Outliers are handled both via Z-score thresholding and IQR methods
- Additional visualizations and statistical tests can be added for further insights

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## SQL

# File: (da_labor.sql)

This script performs data preparation in the `labor_da` database by renaming columns, changing data types, and creating a joined table `labor_da_join` from the `hours_department` and `labor_percentage` tables based on `date`. It calculates total hours (`total_hrs`) and total percentage (`total_per`) by summing relevant columns, ensuring data consistency with type adjustments. The process concludes with data verification steps, including checking for null values and confirming changes.

# Key steps:
- Select and modify `hours_department` and `labor_percentage` tables.
- Join both tables into `labor_da_join`.
- Add total columns and compute sums.
- Adjust data types for accuracy.
- Verify data integrity by inspecting sample rows and null values.

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Python 

# File : (labor_connecting_python_sql.ipynb)

# Labor Data Analysis

This project connects to a MySQL database to retrieve labor data from the `labor_da_join` table, and performs various data analysis tasks such as filtering by year and month, summarizing statistics, and preparing data for visualization.

## Setup and Database Connection

- Imports essential libraries: `pandas`, `numpy`, `pymysql`, `sqlalchemy`, `getpass`.
- Prompts securely for the database password.
- Creates a connection to the `labor_da` database using SQLAlchemy engine.

## Data Retrieval

- Executes a SQL query to fetch all records from `labor_da_join`.
- Loads the query results into a pandas DataFrame.

## Data Preprocessing

- Converts the `'date'` column to `datetime` format.
- Checks for missing data.
- Resets DataFrame index for proper handling.

## Data Analysis

- Displays descriptive statistics of the dataset.
- Filters data for specific years: 2020, 2021, 2022, 2023, 2024, 2025.

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Tableau

## Dashboard

    https://public.tableau.com/app/profile/claudio.do.prado/viz/Da_presentation/WageCostAnalysis?publish=yes


## This dashboard created using Tableau Public. It features a comprehensive Wage Cost Analysis with several charts and metrics:

## KPIs (Key Performance Indicators):

- Revenue in K: Displays revenue in thousands.
- Wage Cost in %: Shows the percentage of wage cost.
- Work Hours: Total work hours displayed prominently.
  
## Charts:

- Wage Cost by Department %: A bar chart highlighting wage cost distribution across various departments.
    - The red bars in the "Wage Cost by Department %" chart likely indicate departments where wage costs exceed a specific target line. This visual representation helps quickly identify areas where wage expenses may be higher than desired, allowing for targeted analysis and cost management. The presence of the target line provides a benchmark for performance evaluation.
      
- Sum of Hours by Period: A stacked bar chart showing the distribution of work hours among different roles like service, kitchen, management and dishwasher.

  
- Wage Cost vs Work Hours: A line chart comparing wage costs against work hours, highlighting trends and correlations.

  
## Additional Elements:

- Daily Worked Hours by Department: A detailed breakdown of worked hours per department on a daily basis.
  
- Time Filters: Start date filter for adjusting the time frame of data analysis.

- Revenue in K : Bar charts showing revenue by day in the time frame.

## This dashboard facilitates detailed analysis and visualization of wage costs, work hours, and revenue, providing meaningful insights into departmental performance and cost management.

## Author
   Claudio Do Prado

