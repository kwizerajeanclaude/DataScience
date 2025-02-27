#### Read-in the StartSalary.csv

salary.df <- read.csv("StartSalary.csv", header = TRUE)  # load data
dim(salary.df)  # find the dimension of data frame
head(salary.df)  # show the first six rows
View(salary.df)  # show all the data in a new tab
names(salary.df)  # print a list of variables to the screen.

summary(salary.df)  # find summary statistics for each column

library(psych) # R is case-sensitive! No capital L!
describe(salary.df)


#### Read-in the Audit.csv

audit.df <- read.csv("Audit.csv", header = TRUE)
names(audit.df)
hist(audit.df$Audit.Time); #Simple
hist(audit.df$Audit.Time,
main="Histogram for Audit Days",
xlab="Time in days",
border="blue",
col= " green ",
xlim=c(0,35),
las=1,
breaks=5)

#### Read-in the Stereo.csv
stereo.df <- read.csv("Stereo.csv", header = TRUE)
names(stereo.df)
attach(stereo.df)
plot(No.of.Commercials,Sales.Volume, main="Stereo Sales Scatterplot",
xlab="Number of Comercials",
ylab="Stereo Sales in dollars", pch=13 )

# Add fit lines

abline(lm(Sales.Volume~No.of.Commercials, data=stereo.df), col="red") 
# regression line (y~x)
lines(lowess(No.of.Commercials,Sales.Volume ), col="blue") # lowess line (x,y)




#### Read-in the rwanda data
data.df <- read.csv("Rwanda_startup.csv", header = TRUE)  # load data
dim(data.df)  # find the dimension of data frame
#head(data.df)  # show the first six rows
#names(data.df)  # print a list of variables to the screen.
summary(data.df)

library(dplyr)
library(ggplot2)

#### Plotting: histogram
library(car)
hist(log(data.df$CB.Rank..Company.))
hist(log(data.df$Last.Funding.Amount.Currency..in.USD.))


# Simple scatterplot
attach(data.df)
plot(log(data.df$Last.Funding.Amount.Currency..in.USD.), log(data.df$CB.Rank..Company.), main="CB Rank w.r.t. Funding Amount",
   xlab="Last.Funding.Amount.Currency..in.US", ylab="CB.Rank..Company.", pch=13)

# Add fit lines
abline(lm(log(data.df$CB.Rank..Company.)~log(data.df$Last.Funding.Amount.Currency..in.USD.), ), col="red") # regression line (y~x)

#BoxPlot
ggplot(data.df, aes(y = log(data.df$Total.Funding.Amount.Currency..in.USD.))) +
  geom_boxplot() +
  labs(title = "Box Plot of TotalFunding Amount in USD",
       y = "logTotalFundingAmountUSD")

#BoxPlot
ggplot(data.df, aes(y = data.df$CB.Rank..Company.)) +
  geom_boxplot() +
  labs(title = "Box Plot of Last Funding Amount in USD",
       y = "CBRankCompany")

#Density Plot
ggplot(data.df, aes(x =log(data.df$Total.Funding.Amount.Currency..in.USD.))) +
  geom_density(fill = "lightblue", alpha = 0.7) +
  labs(title = "Density Plot of logTotalFundingAmountUSD",
       x = "LogTotalFundingAmountUSD",
       y = "Density")

#Density Plot
ggplot(data.df, aes(x =data.df$Total.Funding.Amount.Currency..in.USD.)) +
  geom_density(fill = "lightblue", alpha = 0.7) +
  labs(title = "Density Plot of TotalFundingAmountUSD",
       x = "FundingAmountUSD",
       y = "Density")

# Simple Linear regression
simple.fit=lm(Total.Funding.Amount.Currency..in.USD.~Estimated.Revenue.Range+Number.of.Funding.Rounds+Number.of.Employees
, data=data.df)
summary(simple.fit)


#### Discrete Random Variables: Poisson distribution
par(mfrow=c(3,1))
### When mu=3
my_poisson <-function(y=NULL,mu=3){
  (mu^y)*exp(-mu)/factorial(y)}
y<-seq(1,20,by=0.01)
plot(y,my_poisson(y=y),type="l")

### When mu=5
my_poisson1 <-function(y=NULL,mu=5){
  (mu^y)*exp(-mu)/factorial(y)}
y<-seq(1,20,by=0.01)
plot(y,my_poisson1(y=y),type="l")

### When mu=10
my_poisson2 <-function(y=NULL,mu=10){
  (mu^y)*exp(-mu)/factorial(y)}
y<-seq(1,20,by=0.01)
plot(y,my_poisson2(y=y),type="l")

#### Continuous Random Variables: Normal distribution
par(mfrow=c(3,1))
#### when mu=100, sigma=10
my_normal<-function(y=NULL,mu=100,sigma=10){
  (1/sqrt(2*pi*sigma^2))*exp(-(y-mu)^2/(2*sigma^2)) }
y<-seq(1,200,by=0.01)
plot(y,my_normal(y=y),type="l", col="red")

#### when mu=100, sigma=30
my_normal2<-function(y=NULL,mu=100,sigma=30){
  (1/sqrt(2*pi*sigma^2))*exp(-(y-mu)^2/(2*sigma^2)) }
y<-seq(1,200,by=0.01)
plot(y,my_normal2(y=y),type="l",col="blue")

#### when mu=100, sigma=50
my_normal3<-function(y=NULL,mu=100,sigma=50){
  (1/sqrt(2*pi*sigma^2))*exp(-(y-mu)^2/(2*sigma^2)) }
y<-seq(1,200,by=0.01)
plot(y,my_normal3(y=y),type="l")


#### Continuous Random Variables: Exponential distribution
par(mfrow=c(3,1))
#### mu=3, simga=1
my_exponential <-function(y=NULL,mu=3,sigma=1){
  (1/mu)*exp(-y/mu)  }
y<-seq(1,30,by=0.01)
plot(y,my_exponential(y=y),type="l",col="red")

#### mu=5, simga=1
my_exponential2 <-function(y=NULL,mu=5,sigma=1){
  (1/mu)*exp(-y/mu)   }
y<-seq(1,30,by=0.01)
plot(y,my_exponential2(y=y),type="l",col="blue")

#### mu=10, simga=1
my_exponential3 <-function(y=NULL,mu=10,sigma=1){
  (1/mu)*exp(-y/mu)  }
y<-seq(1,30,by=0.01)
plot(y,my_exponential3(y=y),type="l")




