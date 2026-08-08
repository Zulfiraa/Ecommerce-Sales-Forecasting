library(tidyverse)
library(lubridate)
library(forecast)
library(tseries)
library(ggplot2)
library(readr)
data <- read_csv("C:/Users/ASUS/Downloads/archive (1)/ecommerce_sales_analytics_5000.csv")
View(data)
head(data)
str(data)
summary(data)

#Data Cleaning
colSums(is.na(data))
sum(duplicated(data$order_id))
data$order_date <- as.Date(data$order_date, format = "%m/%d/%Y")

#EDA
#Revenue Harian
daily_sales <- data %>%
  group_by(order_date) %>%
  summarise(
    revenue = sum(revenue, na.rm = TRUE)
  )
ggplot(daily_sales, aes(x = order_date, y = revenue)) +
  geom_line() +
  labs(
    title = "Daily Revenue Trend",
    x = "Date",
    y = "Revenue"
  ) +
  theme_minimal()

#Revenue bulanan
monthly_sales <- data %>%
  mutate(month = floor_date(order_date, "month")) %>%
  group_by(month) %>%
  summarise(
    revenue = sum(revenue, na.rm = TRUE)
  )
head(monthly_sales)
ggplot(monthly_sales, aes(x = month, y = revenue)) +
  geom_line() +
  labs(
    title = "Monthly Revenue Trend",
    x = "Month",
    y = "Revenue"
  ) +
  theme_minimal()


#Revenue by category
category_revenue <- data %>%
  group_by(product_category) %>%
  summarise(
    revenue = sum(revenue, na.rm = TRUE),
    quantity = sum(quantity, na.rm = TRUE)
  ) %>%
  arrange(desc(revenue))

category_revenue

ggplot(category_revenue,
       aes(x = reorder(product_category, revenue),
           y = revenue)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Revenue by Product Category",
    x = "Product Category",
    y = "Revenue"
  ) +
  theme_minimal()
#Revenue by region
region_revenue <- data %>%
  group_by(region) %>%
  summarise(
    revenue = sum(revenue, na.rm = TRUE),
    quantity = sum(quantity, na.rm = TRUE)
  ) %>%
  arrange(desc(revenue))

region_revenue

ggplot(region_revenue,
       aes(x = reorder(region, revenue),
           y = revenue)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Revenue by Region",
    x = "Region",
    y = "Revenue"
  ) +
  theme_minimal()
#Revenue by category & region
category_region <- data %>%
  group_by(region, product_category) %>%
  summarise(
    revenue = sum(revenue, na.rm = TRUE),
    quantity = sum(quantity, na.rm = TRUE),
    .groups = "drop"
  )

category_region

ggplot(category_region,
       aes(x = product_category,
           y = revenue,
           fill = region)) +
  geom_col(position = "dodge") +
  labs(
    title = "Revenue by Product Category and Region",
    x = "Product Category",
    y = "Revenue"
  ) +
  theme_minimal()

#Time series
sales_ts <- ts(
  monthly_sales$revenue,
  start = c(2022, 1),
  frequency = 12
)
sales_ts

#Decomposition
decomp <- decompose(sales_ts)

plot(decomp)

#Testing & Ensuring Stationarity
adf.test(sales_ts)

#Forecasting Model
#1. Naive
model_naive <- naive(sales_ts, h = 6)

fc_naive<-forecast(model_naive)

#2. Exponential Smoothing
model_ets <- ets(sales_ts)

fc_ets <- forecast(
  model_ets,
  h = 6
)

plot(forecast_ets)

#3. ARIMA
model_arima <- auto.arima(sales_ts)

summary(model_arima)
fc_arima <- forecast(
  model_arima,
  h = 6
)

plot(forecast_arima)

#Bandingkan Model
acc_naive <- accuracy(fc_naive)
acc_ets <- accuracy(fc_ets)
acc_arima <- accuracy(fc_arima)

accuracy_table <- data.frame(
  Model = c("Naive", "ETS", "ARIMA"),
  ME = c(
    acc_naive[1, "ME"],
    acc_ets[1, "ME"],
    acc_arima[1, "ME"]
  ),
  RMSE = c(
    acc_naive[1, "RMSE"],
    acc_ets[1, "RMSE"],
    acc_arima[1, "RMSE"]
  ),
  MAE = c(
    acc_naive[1, "MAE"],
    acc_ets[1, "MAE"],
    acc_arima[1, "MAE"]
  ),
  MAPE = c(
    acc_naive[1, "MAPE"],
    acc_ets[1, "MAPE"],
    acc_arima[1, "MAPE"]
  ),
  MASE = c(
    acc_naive[1, "MASE"],
    acc_ets[1, "MASE"],
    acc_arima[1, "MASE"]
  )
)

accuracy_table

#Forecast final model
final_model <- auto.arima(sales_ts)

final_forecast <- forecast(
  final_model,
  h = 6
)

plot(final_forecast)
final_forecast

forecast_table <- data.frame(
  Month = time(final_forecast$mean),
  Forecast = as.numeric(final_forecast$mean),
  Lower_80 = as.numeric(final_forecast$lower[,1]),
  Upper_80 = as.numeric(final_forecast$upper[,1])
)

forecast_table
