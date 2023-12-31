#PREDICTION OF OBESITY
#Task1: Data cleaning, filtering, recoding and preparing for analysis
#TASK2: EDA and Data Visualization
#Task3: Correlation

#installing packages and opening libraries
install.packages(c('caret', 'skimr', 'RANN', 'randomForest', 'fastAdaboost', 'gbm', 'xgboost', 'caretEnsemble', 'C50', 'earth'))
install.packages("hrbrthemes")
install.packages("skimr")
install.packages("Hmisc")
install.packages("viridis")
install.packages("plotly")
install.packages("glue")
library(Hmisc)
library(skimr)
library(ggplot2)
library(dplyr)
library(datasets)
library(glue)
library(viridis)
library(plotly)
library(tidyverse)

#loading data set
OBESITY <- read_csv("Desktop/OBESITY.csv")
View(OBESITY)

#display first 5 rows
head(OBESITY, 5)
tail(OBESITY, 5)

#exploring OBESITY data set
str(OBESITY) #type of data
describe(OBESITY) 
summary(OBESITY) #summary statistics
skim(OBESITY) #perform skim to display summary statistics

#check for missing data
colSums(is.na(OBESITY))
#no missing data



#create new columns recoding variables as numeric
OBESITY$FAVC1 <- recode(OBESITY$FAVC, "yes" = "1",
                               "no" = "0")
OBESITY$FAVC1 <- as.numeric(OBESITY$FAVC1)

OBESITY$family_overweight <- recode(OBESITY$family_history_with_overweight, "yes" = "1",
                        "no" = "0")
OBESITY$family_overweight <- as.numeric(OBESITY$family_overweight)      # Convert to numeric

OBESITY$SMOKE1 <- recode(OBESITY$SMOKE, "yes" = "1",
                        "no" = "0")
OBESITY$SMOKE1 <- as.numeric(OBESITY$SMOKE1)      # Convert to numeric

OBESITY$Gender1 <- recode(OBESITY$Gender, "Female" = "1",
                         "Male" = "0")
OBESITY$Gender1 <- as.numeric(OBESITY$Gender1)

OBESITY$SCC1 <- recode(OBESITY$SCC, "yes" = "1",
                         "no" = "0")
OBESITY$SCC1 <- as.numeric(OBESITY$SCC1)      # Convert to numeric

table(OBESITY$CALC)

OBESITY$CALC1 <- recode(OBESITY$CALC, "Always" = "3",
                        "no" = "0", "Sometimes" = "1", "Frequently" = "2")

OBESITY$CALC1 <- as.numeric(OBESITY$CALC1)      # Convert to numeric


OBESITY$CAEC1 <- recode(OBESITY$CAEC, "Always" = "3",
                        "no" = "0", "Sometimes" = "1", "Frequently" = "2")

OBESITY$CAEC1 <- as.numeric(OBESITY$CAEC1)      # Convert to numeric
table(OBESITY$CAEC)


OBESITY$Obesity_Type <- recode(OBESITY$NObeyesdad, "Insufficient_Weight" = "1",
                               "Normal_Weight" = "2",
                               "Obesity_Type_I" = "3",
                               "Obesity_Type_II" = "4",
                               "Obesity_Type_III" = "5",
                               "Overweight_Level_I" = "6",
                               "Overweight_Level_II" = "7")
#Transforming obesity level into categories from 1 to 7

#Create BMI variable
OBESITY$BMI <- ((OBESITY$Weight)/(OBESITY$Height)**2)

#Convert values to factor for further analysis
table(OBESITY$NObeyesdad)
OBESITY$NObeyesdad <- as.factor(OBESITY$NObeyesdad)      
OBESITY$Gender <- as.factor(OBESITY$Gender)              
OBESITY$family_history_with_overweight <- as.factor(OBESITY$family_history_with_overweight) 
OBESITY$FAVC <- as.factor(OBESITY$FAVC)
OBESITY$CALC <- as.factor(OBESITY$CALC)
OBESITY$CAEC <- as.factor(OBESITY$CAEC)
OBESITY$SMOKE <- as.factor(OBESITY$SMOKE)
OBESITY$SCC <- as.factor(OBESITY$SCC)
OBESITY$FAF <- as.numeric(OBESITY$FAF)
OBESITY$MTRANS <- as.factor(OBESITY$MTRANS)
OBESITY$FCVC <- as.numeric(OBESITY$FCVC)


#TASK2 : Quick Data Visualization

#plot histograms for individual columns, with labels and colors, to see the actual breakdown which is important for the analysis
plot(OBESITY$NObeyesdad, col ="blue", xlab = "Type", ylab = "Frequency", main= "Obesity_Type frequency")
#most people are obese Type 1
plot(OBESITY$Gender, col ="blue", xlab = "Gender", ylab = "Frequency", main= "Gender Distibution")
#almost same number of women and men
plot(OBESITY$family_history_with_overweight, col ="blue", xlab = "family_history_with_overweight", ylab = "Frequency", main= "family_history_overweight")
#most have family with overweight
plot(OBESITY$SMOKE, col ="blue", xlab = "SMOKE", ylab = "Frequency")
#about 1% of people do smoke
plot(OBESITY$SCC, col ="blue", xlab = "SCC", ylab = "Frequency", main= "Calories Consumption Monitoring")
#about 5% of people do monitore the calories
plot(OBESITY$FAVC, col ="blue", xlab = "FAVC", ylab = "Frequency", main= "Consumption of high caloric food")
#most people consume high caloric food

#Some data such as Smokers and Calorie monitoring did not have enough values in some fields.
#For example people who smoked accounted for 1% of respondents and people who monitored calories for 5%.
#Therefore those samples may not be representative

#A lot of people have family with overweight and consume high caloric foods. Population tend to be more obese

#plots to compare values with BMI
plot(OBESITY$NObeyesdad, OBESITY$BMI, xlab = "Type", ylab = "BMI", main= "Type-BMI relationship")
#the higher the BMI, the more obese. BMI good measure to categorize weight types
plot(OBESITY$Gender, OBESITY$BMI, xlab = "Gender", ylab = "BMI", main= "Gender-BMI relationship")
#women tend to be either more obese, or more skinny but median is on average the same as men
plot(OBESITY$FAVC, OBESITY$BMI, xlab = "FAVC", ylab = "BMI", main= "Consumption High Caloric Food-BMI relationship")
#consumption of high caloric food = higher BMI
plot(OBESITY$CAEC, OBESITY$BMI, xlab = "CAEC", ylab = "BMI", main= "Consumption btw meals-BMI relationship")
#does not predict obesity as much. Actually people that have always or frequently food between meals had lower BMI
plot(OBESITY$CALC, OBESITY$BMI, xlab = "CALC", ylab = "BMI", main= "Alcohol-BMI relationship")
#little relationship between alcohol and BMI
plot(OBESITY$MTRANS, OBESITY$BMI, xlab = "MTRANS", ylab = "BMI", main= "Transportation used -BMI relationship")
#people Biking and Walking tend to have lower BMI
plot(OBESITY$family_history_with_overweight, OBESITY$BMI, xlab = "family with overweight", ylab = "BMI", main= "family with overweight-BMI relationship")
#people with family history overweight tend to be more obese
plot(OBESITY$FCVC, OBESITY$BMI, xlab = "MTRANS", ylab = "BMI", main= "Transportation used -BMI relationship")
#Consumption of vegetables do not predict Obesity

#Correlation Between Height and Weight in Gender
ggplot(data = OBESITY, mapping = aes(x = Weight, y = Height, col = Gender))+
  geom_point(aes(col = Gender))+
  geom_smooth(method=lm , color="black", se=FALSE, formula = y~x) +
  scale_fill_viridis(discrete = T, option = "C") +
  labs(title = list(text = paste0('Correlation of Height and Weight')),
       x = "Weight",
       y = "Height"
  ) +
  theme(legend.title = element_blank(),
        plot.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "#ffffff"),
        axis.line.y = element_line(colour = "grey"),
        axis.line.x = element_line())

#linear positive relationship between Weight and Height in Genders
#females tending to have wider ranges in terms of their weight

#correlation between age, BMI and Gender
ggplot(data = OBESITY, mapping = aes(x = Age, y = BMI, col = Gender))+
  geom_point(aes(col = Gender))+
  geom_smooth(method=lm , color="black", se=FALSE, formula = y~x) +
  scale_fill_viridis(discrete = T, option = "C") +
  labs(title = list(text = paste0('Correlation of Age and BMI')),
       x = "Age",
       y = "BMI"
  ) 
#skinniest people are younger

#Correlation Between Frequency Physical activity, BMI and Gender
ggplot(data = OBESITY, mapping = aes(x = FAF, y = BMI, col = Gender))+
  geom_point(aes(col = Gender))+
  geom_smooth(method=lm , color="black", se=FALSE, formula = y~x) +
  scale_fill_viridis(discrete = T, option = "C") +
  labs(title = list(text = paste0('Correlation Frequency Physical activity, BMI and Gender')),
       x = "FAF",
       y = "BMI"
  ) 
#The more exercise they do, less BMI they have. Correlation negatively skewed


#TASK3: Correlation between values

Obesity_Analysis <- OBESITY[, c(2,3,4,7,8,11,13,14,26)]
View(Obesity_Analysis)
cor(Obesity_Analysis)


#from the correlation we can observe that Weight, Age and FAF family are the best predictors
#cor() only takes quantitative data into account, so we are not able to compare the numbers from these variables to those of the qualitative and categorical variables

#Conclusion
#Data Analysis suggests that People with family history overweight and high caloric food consumption tend to have higher BMI.
#Age also do influence BMI. Younger people usually have lower BMI.
#Height and Weight are positively skewed, with females tending to have wider ranges in terms of their weight.
#More physical activity and using transportation methods such as hiking or walking help have lower BMI
#However alcohol, CH2O, CAEC consumption of food between meals and vegetables did not predict BMI
#Smokers and Food intake monitoring might not be good samples for this analysis since they did not have enough data in some categories

