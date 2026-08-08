# Ecommerce-Sales-Forecasting
The project analyzes historical sales data to identify trends, seasonal patterns, and fluctuations in demand. The analysis includes data cleaning, exploratory data analysis, time series decomposition, and sales forecasting using statistical models.
## Questions (KPIs)
- What are the historical sales trends and seasonal patterns?
- How much sales can be expected in the future?
- How accurate is the sales forecasting model?
- Which products and categories generate the most revenue?
- Which regions contribute the most sales?
- When are the peak and low-demand periods?
- How can forecasting improve inventory and business planning?
## Tools Used
- R/Rstudio: tidyverse, ggplot2, forecast, lubridate
- GitHub: repository management, version control (Git), project documentation (README), and portfolio publishing
## Dataset
The dataset used in this project including:
| Variable           | Keterangan        |
| ------------------ | ----------------- |
| `order_id`         | ID transaksi      |
| `order_date`       | Tanggal transaksi |
| `customer`         | ID customer       |
| `product_category` | Kategori produk   |
| `region`           | Wilayah           |
| `quantity`         | Jumlah produk     |
| `unit_price`       | Harga satuan      |
| `discount`         | Diskon            |
| `payment_method`   | Metode pembayaran |
| `delivery_days`    | Lama pengiriman   |
| `customer_rating`  | Rating customer   |
| `revenue`          | Pendapatan        |

## Process
- Review the dataset summary to understand data structure, variables, and key statistics
- Verify data for missing values, duplicate records, and anomalies, and clean the dataset
- Ensure data consistency with respect to data types, date formats, and sales values
- Aggregate monthly sales and analyze trends, seasonality, categories, and regions
- Build and compare forecasting models using historical sales data
- Evaluate model performance (Naive, Exponential smoothing, ARIMA) using ME, MAE, RMSE, and MAPE
- Generate future sales forecasts and visualize actual vs. forecasted sales
- Provide recommendations for inventory, promotional, and sales planning

**Code**: 

## Results
### Exploratory Data Analysis
**Monthly Sales**
- Revenue fluctuates significantly from month to month, ranging approximately from $21,000 to $42,000.
- There are several revenue peaks, particularly around mid-2022, early 2023, mid-2024, and late 2025, indicating periods of substantially higher sales compared with other months.
- Conversely, several sharp declines can be observed, particularly in early 2024, mid-2024, early 2025, and late 2025.
- No strong long-term upward trend is observed. Revenue at the beginning and end of the period remains within a relatively similar range.
- The recurring fluctuations indicate unstable demand, highlighting the importance of sales forecasting to estimate future revenue and support better business planning.

<img width="640" height="347" alt="image" src="https://github.com/user-attachments/assets/a076aceb-36a3-4025-8613-5a3842a8546f" />

**Revenue by Product Category & Region**
<p align="center">
  <img src="https://github.com/user-attachments/assets/3e5e0f71-556a-41e2-a425-e5c706fc6164" width="45%">
  <img src="https://github.com/user-attachments/assets/68536126-1689-4503-b26a-da2fa148e64f" width="45%">
</p>

<img width="640" height="347" alt="image" src="https://github.com/user-attachments/assets/9c8ce33e-2321-4362-a5a4-f14954210bc0" />

### Time Series Analysis
