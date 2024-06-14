library(foreign)
mydata <- read.dta("https://dss.princeton.edu/training/Panel101.dta")
head(mydata, 10)
#Reads a Stata data file from a URL using read.dta from the foreign package and assigns it to mydata. 
#This dataset is used for the DiD analysis.


#Create a dummy variable to indicate the time when the treatment started. 
#Lets assume that treatment started in 1994. 
#In this case, years before 1994 will have a value of 0 and 1994+ 1.
head(mydata, 10)
mydata$time=ifelse(mydata$year>=1994,1,0)
table(mydata$time)

# Creates a new variable time within mydata. 
# It uses ifelse to assign a value of 1 for observations from the year 1994 onwards (considered the post-treatment period) 
# and 0 for earlier years (pre-treatment period).

mydata$treated = ifelse(mydata$country == "E" | mydata$country == "F" | mydata$country == "G", 1, 0)



table(mydata$treated)

#2-20
# Manual Calculation of DiD
a = sapply(subset(mydata, treated == 0 & time == 0, select=y), mean)
b = sapply(subset(mydata, treated  == 1 & time== 0, select=y), mean)
c = sapply(subset(mydata, treated  == 0 & time == 1, select=y), mean)
d = sapply(subset(mydata, treated  == 1 & time == 1, select=y),mean)
DID = (d-b)-(c-a)
DID

#Manual Calculation of DiD

head(mydata$treated,100)

#Generates a new variable treated in mydata. It assigns a value of 1 to observations from countries E, F, and G, 
#indicating these are the treated groups, and 0 to others, indicating control groups.

mydata$did = mydata$time * mydata$treated
head(mydata$did,100)
# Estimating the DID estimator (method 1: generate the interaction)

didreg = lm(y ~ treated + time + did, data = mydata)
summary(didreg)

# Estimating the DID estimator (method 2: using the multiplication)

didreg1 = lm(y ~ treated*time, data = mydata)
summary(didreg1)

