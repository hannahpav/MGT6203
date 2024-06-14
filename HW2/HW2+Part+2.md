
# MGT6203 HW2 Part 2 

## Instructions:


**For Homework 2 Part 2, please use this Jupyter notebook in Vocareum to submit your solutions.** Vocareum is an educational cloud platform for programming in several languages; it is based on the Jupyter notebook environment. This platform allows us to move homework assignments to the cloud. The advantages are that all of you will be working in the same coding environment AND peer reviewers will be able to run your R code easily. This way we eliminate some issues we might encounter when working on an individual/local basis, such as library installations and Rstudio OS requirements; Jupyter notebooks work on mobile platforms and tablets.

With Jupyter notebooks, you will be learning a new way of presenting data analysis reports, that is neat and flexible, where formatted English text and R code can easily coexist on the same page. Notebooks can be also collaborative when needed. Think of Jupyter notebooks as interactive program-based Google docs or MS-Office 360 docs; these are gradually replacing local files on our computers. **For now, we are asking each of you to do your own homework.**

**Many of you are new to the Jupyter notebooks and Vocareum platforms. We will provide TA help in Piazza with specific code if you have questions. ** 

Here we list some important things to get you started. Please read carefully.



<ol>
<li>Even though we are moving from your local envrionment to the cloud, **our expectations from your homework will remain the same**. Same goes for the rubrics.</li>

<li>Vocareum has its own cloud based file system, the data files you will be using for the assignments will be stored in the cloud with path **"../resource/asnlib/publicdata/FILENAME.csv"**. You will be able to import them with the same method as you do in RStudio, simply substitute the path name to the one specified in the instructions. You won't be able to modify these data files.</li>

<li>You will be able to find the data files on Canvas/EdX if you would like to explore them offline.</li>

<li>**For coding questions, you will be graded on the R code as well as the output** in your submission.</li>

<li>**For interpretations or short response questions, please type the answers in the notebook's markdown cells**. To change a code cell to a markdown cell, click on the cell, and in the dropdown menu above, switch the type of the cell block from "code" to "markdown". **Adding print statements to code cells for short response/interpretation questions is also fine, as long as we can clearly see the output of your response**.</li>

<li>Optional: if you would like to learn more about how to format your markdown cells, visit the following site: https://www.earthdatascience.org/courses/intro-to-earth-data-science/file-formats/use-text-files/format-text-with-markdown-jupyter-notebook/. Jupyter notebook also supports LaTeX.</li>

<li>**Feel free to delete or add as many additional cells as you need**. But please try to keep your notebook clean and keep your solution directly under its respective question to avoid confusion.</li>

<li>You may delete the `#SOLUTION BEGINS/ENDS HERE` comments from the cell blocks, they are just pointers that indicate where to put your solutions.</li>

<li>**When you have finished the assignment, remember to rerun your notebook to check if it runs correctly.** You can do so by going to **`Kernel`-> `Restart & Run All`**. You may lose points if your solutions do not run successfully.</li>

<li>**Click the "`Submit`" button on the top right corner to turn in your assignment**. Your assignment will enter the next phase for peer review.</li>

<li>**You are allowed up to <u>2 submissions</u> for this assignment.** Please ensure your responses are carefully reviewed before submitting. You may resubmit your work anytime before the peer review period starts. Remember, only your most recent submission will be graded. If you submit twice, the second submission will be the one evaluated.
</li>

<li>**Please remember to finish the peer reviews after having submitted your assignment.** You are responsible for grading the work of three of your peers thoroughly, and in addherence to the rubrics. And you will be held accountable for peer grading. **There will be a <u>30% penalty</u> to your grade if you fail to complete one or more peer reviews properly.**</li>

<li>Feel free to address your questions, concerns, and provide any feedback on Piazza. We will continuously try to improve going forward.</li>

<li>Good Luck!</li>

</ol>

# About Package Installation:

Most of the packages (if not all) that you will need to complete this assignment are already installed in this environment. An easy way to check this is to run the command: `library(PackageName)`. If this command runs successfully then the package was already installed and has been successfully attached to the code. If the command gave an error saying the Package was not found then follow the steps below to successfully install the package and attach it to the code: 

- Use `installed.packages()` command to return a table of the packages that are preinstalled in the environment.

- To attach a preinstalled library in Vocareum, simply use `library(PackageName)`

- **To install a package that does not come with the provided environment, please use the following steps:**
    
<ol>
<li>Install your desired package using the following code:</li>
     <ul>
         <li>`install.packages("PackageName", lib="../work/")`</li>
     </ul>
<li> Attach the library you just installed using the following code: </li>
    <ul>
        <li>`library(PackageName, lib.loc = "../work/")`</li>
        <li> **NOTE:** Make sure the file location is the same as the above code snippets `("../work/")` </li>
    </ul>
</ol>

## Question 1. Company ABC (24 Points Total)

Use the Dataset, `product_sales.csv` to  answer Question 1. This dataset tracks monthly sales for two similar products from company ABC, TechPad and ElectroTab. After observing initial sales, a major software update  was provided to "ElectroTab" product. The dataset has the folllowing columns:

- **`month`**: Number of months since the start of data collection..
- **`product`**: Indicates the product type ('TechPad' or 'ElectroTab').
- **`sales_volume`**: Number of units sold in the given month.
- **`post_update`**: Indicates whether the data is before (0) or after (1) a significant product update for 'ElectroTab'.

Our goal is to use the company's data to analyze the differences in monthly sales of these products before and after the software update.


### 1A.  Classify the sales into four groups (6 Points)

- Assign the corresponding group with the group title (A,B,C, and D) where the group titles are as follows: 

| |Before|After|
|------|------|------|
|TechPad (control group)|A|C|
|ElectroTab (treatment group)|B|D|

- **Note:** This is a theoretical question; you just need to identify each group with a short description of what the group is. Eg. what group does A represent?
- You **don’t** need to create a column categorizing the datapoints into groups.

###### SOLUTION BEGINS HERE

A:

B:

C:

D:


###### SOLUTION ENDS HERE

### 1B. Calculate the mean of the 'sales_volume' variable for each of the four groups. (6 Points)

- Print the result for each group. 
- Round your answers to two decimal places, for example, `XX.xx`.


```R
# Read the dataset
product_sales = read.csv("../resource/asnlib/publicdata/product_sales.csv")

# Load library
library(dplyr)
str(product_sales)
```

    
    Attaching package: ‘dplyr’
    
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    


    'data.frame':	48 obs. of  4 variables:
     $ month       : int  1 1 2 2 3 3 4 4 5 5 ...
     $ product     : chr  "TechPad" "ElectroTab" "TechPad" "ElectroTab" ...
     $ sales_volume: int  480 515 505 490 495 510 520 505 510 515 ...
     $ post_update : int  0 0 0 0 0 0 0 0 0 0 ...



```R
# SOLUTION BEGINS HERE

write.csv(product_sales,"product_sales.csv", row.names = FALSE)



# SOLUTION ENDS HERE
```

### 1C. Estimate Difference-in-Differences (DiD) (6 Points): 
- Assume `TechPad` represents the control group and `ElectroTab` represents the treatment group.
- Use the averages calculated in part 1B to estimate the value of DiD.
- Round your answers to two decimal places, for example, `XX.xx`.


```R
# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE
```

### 1D.  Estimate DiD with Linear Regression  (6 Points):

- Interpret the DiD in the context of this problem. 
- Round your answers to two decimal places, for example, `XX.xx`.
- **Hint:** Check with your answer from Part 1C; the two methods should reach the same DiD.


```R
# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE
```

## Question 2. Stock Returns (36 Points Total)

- Use the stock datasets below for Quesiton 2.

#### `stock_aapl.csv`, `stock_gm.csv`, `stock_tsla.csv`, and `stock_xom.csv` have the following columns:  

- **`Date`**: month end date.
- **`Close`**: closing price, which was already adjusted for stock split.
- **`Dividends`**: dividend in \$ to shareholders. Not every company gave dividends in sample period. 

#### `market_gspc.csv`
 - This dataset represents market return. 
 - **`Date`**: Month end date.
 - **`return_market`**: simple return for the month.
 
#### **Please note: loading essential libraries like "PerformanceAnalytics" might take a few minutes.**


```R
# Read data files
ticker_aapl <- read.csv("../resource/asnlib/publicdata/stock_aapl.csv", header = TRUE)
ticker_gm <- read.csv("../resource/asnlib/publicdata/stock_gm.csv", header = TRUE)
ticker_tsla <- read.csv("../resource/asnlib/publicdata/stock_tsla.csv", header = TRUE)
ticker_xom <- read.csv("../resource/asnlib/publicdata/stock_xom.csv", header = TRUE)
ticker_gspc <- read.csv("../resource/asnlib/publicdata/market_gspc.csv", header = TRUE)
```


```R
# Install necessary libraries 
# After the initial installation, you may comment this block out the second time, and simply load the library without reinstalling it.
# Please note: loading essential libraries like "PerformanceAnalytics" might take a few minutes.
suppressWarnings({
install.packages("PerformanceAnalytics", lib="../work/")
install.packages("xts", lib="../work/")
install.packages("lubridate", lib="../work/")
install.packages("tidyverse", lib="../work/")
if(!require(data.table)) install.packages("data.table", lib="../work/")})
```


```R
# Load necessary libraries 
# Please note: loading essential libraries like "PerformanceAnalytics" might take a few minutes.
library(PerformanceAnalytics, lib.loc="../work/")
library(xts, lib.loc="../work/")
library(lubridate, lib.loc="../work/")
library(tidyverse, lib.loc="../work/")
library(data.table, lib.loc="../work/")

```

### 2A. Please calculate simple returns of TSLA and XOM stocks for all months of 2015, 2016 and 2017, and report the month and year in which each stock gave its maximum and minimum simpe returen. (8 points):

- In case of a tie, report the earliest month.
- Do not forget to **remove NA values**.
- **Hint:** The `shift()` function may help in calculating simple return, but you are free to choose any method/function in R.
- Here is a quick reference: https://www.rdocumentation.org/packages/data.table/versions/1.11.4/topics/shift 


```R
# SOLUTION BEGINS HERE
# For example: TSLA stock
# Converting dates to standard YYYY-MM-DD format
# Sorting data by dates




# SOLUTION ENDS HERE
```


```R
# SOLUTION BEGINS HERE
# For example: XOM Stock
# Converting dates to standard YYYY-MM-DD format
# Sorting data by dates




# SOLUTION ENDS HERE
```

### 2B. Among the four stocks, which one is the least risky and which one is the most risky based on their standard deviation? (5 points)
- For TSLA and XOM, you will need to use the monthly simple returns calculated in 2A. 
- For AAPL and GM, use `stock_aapl.csv`, `stock_gm.csv` to calculate their returns.
- **Note:** you will need to calculate monthly simple returns for AAPL and GM as you did for TSLA and XOM in Q2A.




```R
# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE
```

### 2C. Report average return over the sample period of each stock (4 points):

- Report return as percent not in decimals. 
- Use arithmetic average.  
- Round your answers to two decimal places, for example,  X.xx%


```R
# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE
```

### 2D. `AAPL` vs Market (4 points):
- Based on the monthly arithmetic average return, has AAPL stock underperformed/overperformed the market? 
- By what percentage? 
- Round your answers to two decimal places, for example, X.xx%  


```R
# SOLUTION BEGINS HERE





# SOLUTION ENDS HERE
```

### 2E. What is the cumulative return of each stock in percent?  (4 points)

- Round your answers to two decimal places, for example, X.xx% 


```R
# SOLUTION BEGINS HERE
# calculating cumulative return




# SOLUTION ENDS HERE
```

### 2F. To determine which stock is the most risky based on beta, we need to look at the beta values for TSLA (Tesla), XOM (ExxonMobil), AAPL (Apple), and GM (General Motors).  Based on beta values, which stock is the most risky: TSLA, XOM, AAPL, or GM?   (6 points)

- Comment on the adjusted $R^2$ of this stock. 
- Do you think this stock is related to overall market?


```R
#### SOLUTION BEGINS HERE








#### SOLUTION ENDS HERE
```

### 2G.  Plot cumulative returns of all four stocks in one graph. (3 points)


```R
# SOLUTION BEGINS HERE
# creating a dataframe





# chart

# SOLUTION ENDS HERE
```

### 2H. Based on top 3 drawdowns, how long was GM stock’s longest recovery time? (2 points)

- Use the `table.Drawdown( )` function to find drawdowns for stocks. 
- Refer to the documentation here: https://www.rdocumentation.org/packages/PerformanceAnalytics/versions/2.0.4/topics/table.Drawdowns


```R
# SOLUTION BEGINS HERE
## Drawdown (charts & table)




# SOLUTION ENDS HERE
```
