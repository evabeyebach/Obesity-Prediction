# Obesity-Prediction
## Introduction
Nowadays, Obesity is one of the most important health-related issues in the world. Worldwide, more than 1 billion people have obesity and 19.7% of adolescents and children in the U.S (14.7 million individuals) have obesity. Due to this very reason, it is very crucial to analyze the issue deeply. This dataset include data for the estimation of obesity levels based on their eating habits and physical condition in individuals from the countries of Mexico, Peru and Colombia. I am interested in the relationship between body fat levels and lifestyle habits, and see if the findings can help people be more conscious about obesity.
## About the data set 
The data set includes data of 2111 individuals ages 14 to 61. 17 attributes and 2111 records.  The records are labeled with the class variable NObesity (Obesity Level), that allows classification of the data using the values of Insufficient Weight, Normal Weight, Overweight Level I, Overweight Level II, Obesity Type I, Obesity Type II and Obesity Type III. 
The dataset can be found here : https://archive-beta.ics.uci.edu/ml/datasets/estimation+of+obesity+levels+based+on+eating+habits+and+physical+condition


Columns Description :

Gender : Female/Male

Age : Numeric value

Height : Numeric value in meters

Weight : Numeric value in kilograms

Family History With Over Weight

FAVC : Frequent consumption of high caloric food

FCVC : Frequency of consumption of vegetables

NCP : Number of main meals

CAEC : Consumption of food between meals

CH20 : Consumption of water daily

CALC : Consumption of alcohol

SCC : Calories consumption monitoring

FAF : Physical activity frequency

TUE : Time using technology devices

MTRANS : Transportation used

## My Obejctive
Given these attributes, I approached this project with the goal of trying to find the answers to the following questions:
1. What kind of characteristics do people in this data set have? 
2. Can Obesity_Type be classified based on BMI (Is it the same?) - Since BMI will be better for interpreting results (it is numeric)
3. Most Important: Which eating habit and physical condition variables are most related to obesity levels?

## Predictions
I wanted to test if: 
- family with obesity, alcohol consumption, frequent consumption of high caloric food, consumption of food between meals would produce more obesity
- more CH20, calories consumption monitoring, phyical activity frequency, more consumption of vegetables would be correlated whith lower BMI
- people that smoke have lower BMI and that people who walk or bike have lower BMI

## Analysis 
In order to do my analysis, I divided it into three tasks:

#### 1. Data Quality Assesment
I imported the data, installed librariers, explored the data by performing str(), describe(), summary() and looked for missing values. 
I found out that not all of them where numeric and the ones that were categroical, I recoded them in new columns with numerical values.
Then I recoded many of them into factors, to make it easier for analysis.
I calculated a new BMI variable.

#### 2. Data Visualization
For categorical variables with yes or no answers I made histograms, to see if they had enough responses in some areas and to know the actual breakdown, which is important to consider for data analysis.
For example smokers accounted for 1% of the overall respondents and people with calorie consumption monitoring was less than 5%. Therefore the samples may not be respresentative.
Then I analyzed different variables to BMI, to see if they had relationship. I compared NObeyesdad, Gender, FAVC, CAEC, CALC, MTRANS, FAM.HIST, and FCVC.
Lastky I plotted weight, height and gender. I did the same with Age, BMI and Gender and another one with FAF, BMI and Gender.

#### 3.Data Correlation
With function cor() I compared each value to each other.
Cor() only takes quantitative data into account, so we are not able to compare the numbers from these variables to those of the qualitative and categorical variables

## Interpretation
1. - From the subplots of categorial variables we see that Smokers and Food intake monitoring might not be good samples for this analysis since they do not have enough data in some categories
   - Also a lot of them have families with overweight and do consume high caloric foods (they have enough data to use for further analysis)
2. - From the subplots comparing variables to BMI we see that BMI and Obesity_Type are correlated (BMI is a good measure)
   - Male and Females have the same median, however the weight in females is more spread out
   - With CAEC and family_with_overweight we see that they influence obesity in people
   - CALC, FCVC and CAEC do not have much relationship
   - In MTRANS people who bike or walk have lover BMI
3. - Positive linear relationship between weight, height variables as a function of a third variable, gender, through a regression. Weight and Height correlate to each other and the weight in females is more spread out
   - Postive relationship as well with age and BMI, meaning that the younger the poeple, the lower BMI they have
   - Negative correlation between FAF and BMI, meaning that the more exercicse they do, the lower BMI they have
4. - From the correlation we can observe that Weight, Age and FAF are the best predictors
#cor() only takes quantitative data into account, so we are not able to compare the numbers from these variables to those of the qualitative and categorical variables

## Conclusion
All in all my prediction  that People with family history overweight and high caloric food consumption tend to have higher BMI was right. Age also do influence BMI. Females tend to have wider ranges of weight, meaning that they coud be either more obese or skinny. I was also right on more physical activity and using transportation methods such as biking or walking would help have lower BMI. However alcohol, CH2O, CAEC, consumption of food between meals and consumption of vegetables vegetables did not predict BMI. I though that consuption of food between meals would rise BMI, but it does not correlate much and actually poeple consuming more food between meals tend to have lower BMI. I also thought CH20 would help with lower BMI, but it did not correlate. Smokers and Food intake monitoring might not be good samples for this analysis since they did not have enough data in some categories




