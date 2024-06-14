# Example data
data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02')),
  Close = c(100, 105),  # Adjusted closing prices
  Dividend = c(0, 2)    # Dividends paid out
)

# Calculating simple return
data$SimpleReturn <- with(data, (Close + Dividend) / lag(Close)-1)
# Viewing the results
print(data)

