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
<div align="center">
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
</div>

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
- Revenue fluctuates significantly from month to month
- There are several revenue peaks, particularly around mid-2022, early 2023, mid-2024, and late 2025, indicating periods of substantially higher sales compared with other months.
- Conversely, several sharp declines can be observed, particularly in early 2024, mid-2024, early 2025, and late 2025.
- No strong long-term upward trend is observed. Revenue at the beginning and end of the period remains within a relatively similar range.
- The recurring fluctuations indicate unstable demand, highlighting the importance of sales forecasting to estimate future revenue and support better business planning.

<p align="center">
<img width="80%" alt="image" src="https://github.com/user-attachments/assets/a076aceb-36a3-4025-8613-5a3842a8546f" />

**Revenue by Product Category & Region**
- Electronics generates the highest revenue across all regions, making it the strongest-performing product category. The North region records the highest Electronics revenue, at approximately $173,000.
- Regional performance varies by category. North performs particularly strongly in Electronics, West leads in Clothing and Home, and Beauty products generate the highest revenue in the East region

<p align="center">
  <img src="https://github.com/user-attachments/assets/3e5e0f71-556a-41e2-a425-e5c706fc6164" width="45%">
  <img src="https://github.com/user-attachments/assets/68536126-1689-4503-b26a-da2fa148e64f" width="45%">
</p>

<p align="center">
<img width="70%" alt="image" src="https://github.com/user-attachments/assets/9c8ce33e-2321-4362-a5a4-f14954210bc0" />

### Time Series Forecasting Models
The following presents the accuracy results of each forecasting model.
<div align="center">
| Model     |     ME |        RMSE |         MAE |      MAPE |     MASE |
| --------- | -----: | ----------: | ----------: | --------: | -------: |
| **Naive** | -66.19 |     6548.45 |     5146.79 |     17.46 |     1.24 |
| **ETS**   |  -1.61 |     4366.64 |     3341.97 |     11.43 |     0.80 |
| **ARIMA** | -47.18 |     3884.81 |     3084.84 |     10.53 |     0.74 |
</div>

**Best Model** : ARIMA was selected as the best-performing forecasting model, achieving the lowest RMSE, MAE, MAPE, and MASE compared with the Naive and ETS models.

### Forecast Future Sales
The forecasting results indicate that monthly sales are expected to fluctuate between approximately $27,888 and $32,246 from July to December 2026. Sales are forecasted to increase from $30,676 in July to $31,098 in August, followed by a gradual decline in September and October. The lowest forecasted sales occur in October 2026 at $27,888, while sales are expected to recover and reach the highest level of $32,246 in December 2026.
<div align="center">
| Month    | Forecast | Lower 80% | Upper 80% |
| -------- | -------: | --------: | --------: |
| Jul 2026 |   30,676 |    25,503 |    35,850 |
| Aug 2026 |   31,098 |    25,882 |    36,315 |
| Sep 2026 |   30,655 |    25,175 |    36,135 |
| Oct 2026 |   27,888 |    22,390 |    33,386 |
| Nov 2026 |   28,759 |    23,237 |    34,281 |
| Dec 2026 |   32,246 |    26,720 |    37,772 |
</div>

<p align="center">
<img width="80%"  alt="image" src="https://github.com/user-attachments/assets/f44f0f29-c1a4-40b9-8298-009286c31c19" />

## Business Recommendation
- **Inventory Planning** : Increase inventory levels for high performing products ahead of periods with higher projected revenue to reduce the risk of stockouts, such as on December 2026
- **Targeted Marketing** : Develop region specific marketing campaigns by prioritizing high performing product categories in each region. For example focusing electronic promotions in the north, Clothing and Home in the West, and Beauty in the East region
- **Promotional Calender** : Implement a promotional calendar that increases marketing activity during projected low revenue periods and maximizes demand during peak periods. Promotional activities can be adjusted according to the forecast patterns as follows:
  - September: Regular promotion
  - October: Increase promotional campaigns to boost sales
  - November: Start early holiday promotions
  - December: Maximize sales through holiday campaigns
