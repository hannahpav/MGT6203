
# Read the dataset
product_sales = read.csv("../resource/asnlib/publicdata/product_sales.csv")

# Load library
library(dplyr)
str(product_sales)

# SOLUTION BEGINS HERE

write.csv(product_sales,"product_sales.csv", row.names = FALSE)
convert
HW2 Part 2.ipynb


# SOLUTION ENDS HERE

# SOLUTION BEGINS HERE

install.packages('rmarkdown')



# SOLUTION ENDS HERE

# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE

# Read data files
ticker_aapl <- read.csv("../resource/asnlib/publicdata/stock_aapl.csv", header = TRUE)
ticker_gm <- read.csv("../resource/asnlib/publicdata/stock_gm.csv", header = TRUE)
ticker_tsla <- read.csv("../resource/asnlib/publicdata/stock_tsla.csv", header = TRUE)
ticker_xom <- read.csv("../resource/asnlib/publicdata/stock_xom.csv", header = TRUE)
ticker_gspc <- read.csv("../resource/asnlib/publicdata/market_gspc.csv", header = TRUE)

# Install necessary libraries 
# After the initial installation, you may comment this block out the second time, and simply load the library without reinstalling it.
# Please note: loading essential libraries like "PerformanceAnalytics" might take a few minutes.
suppressWarnings({
install.packages("PerformanceAnalytics", lib="../work/")
install.packages("xts", lib="../work/")
install.packages("lubridate", lib="../work/")
install.packages("tidyverse", lib="../work/")
if(!require(data.table)) install.packages("data.table", lib="../work/")})

# Load necessary libraries 
# Please note: loading essential libraries like "PerformanceAnalytics" might take a few minutes.
library(PerformanceAnalytics, lib.loc="../work/")
library(xts, lib.loc="../work/")
library(lubridate, lib.loc="../work/")
library(tidyverse, lib.loc="../work/")
library(data.table, lib.loc="../work/")


# SOLUTION BEGINS HERE
# For example: TSLA stock
# Converting dates to standard YYYY-MM-DD format
# Sorting data by dates




# SOLUTION ENDS HERE

# SOLUTION BEGINS HERE
# For example: XOM Stock
# Converting dates to standard YYYY-MM-DD format
# Sorting data by dates




# SOLUTION ENDS HERE

# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE

# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE

# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE

# SOLUTION BEGINS HERE
# calculating cumulative return




# SOLUTION ENDS HERE

#### SOLUTION BEGINS HERE








#### SOLUTION ENDS HERE

# SOLUTION BEGINS HERE
# creating a dataframe





# chart

# SOLUTION ENDS HERE

# SOLUTION BEGINS HERE
## Drawdown (charts & table)




# SOLUTION ENDS HERE
