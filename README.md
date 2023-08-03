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
1. What kind of characteristics do people in this data set have? (Since it is important to know the distribution of each variable)
2. Can Obesity_Type be classified based on BMI (Is it the same?) - Since BMI will be better for interpreting results (it is numeric)
3. Most Important: Which eating habit and physical condition variables are most related to obesity levels?

## Predictions
My thoughts would be that: 
- family with obesity, alcohol consumption, frequent consumption of high caloric food, consumption of food between meals, female gender  would produce/have  more obesity
- more CH20, calories consumption monitoring, phyical activity frequency, more consumption of vegetables would be correlated whith lower BMI
- I would suggest that people that smoke have lower BMI and that people who walk or bike have lower BMI

## Analysis 
In order to do my analysis, I divided it into three tasks:




