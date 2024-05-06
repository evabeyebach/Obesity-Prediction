# Obesity-Prediction
Obesity Prediction and Health Enhancement Forecast

## Background
Obesity is a chronic complex disease defined by excessive fat deposits that can impair health. Obesity can lead to increased risk of type 2 diabetes and heart disease, it can affect bone health and reproduction, it increases the risk of certain cancers. Obesity influences the quality of living, such as sleeping or moving. (WHO)
The diagnosis of overweight and obesity is made by measuring people’s weight and height and by calculating the body mass index (BMI): weight (kg)/height² (m²). Worldwide, adult obesity has more than doubled since 1990, and adolescent obesity has quadrupled. In 2022, 1 in 8 people in the world were living with obesity and in 2022, 2.5 billion adults were overweight. Children and youth living with obesity also have a higher risk of developing T2D as adults when compared with children
with reference range weight, which may contribute to increased cardiovascular risk. Having good sleep quality and enough sleep hours is also a good mitigator of cancer.
“Short sleep was linked to increased risk of colorectal cancer.
## Motivation
With this analysis, we want to draw recommendations to patients to help them reduce their BMI and have a healthier lifestyle. We want to prevent kids and adults from becoming obese and prevent them from having health related risks. We also want to improve the sleep quality and sleep disorders of patients to reduce cancer risks.
We will answer the following questions: 
1. Which variables are significant predictors of BMI and which variables could reduce obesity? Which is the best model to predict this?
2. Do obese people have sleep disorders?
3. How can we improve sleep quality?
4. Which variables influence high blood pressure or high heart rate?
5. Which other variables correlate with each other?

## Analysis
We will start of with some Data Preparation, Cleaning, handling missing values etc. The we will plot some graphs in order to understand the distributions. We will perform differnt anlysis, like Pruned **Random Forest**, Tuned **Decision Tree**, **Logistic Regression** and **Linear Regression**. After comparing the Accuracy, we will decide which model is better to predict obesity.
We will also do **Chi Square** and **T-test** to look at the relationship between variables.

## Findings and Results
1. 
- Random forest had the best Accuracy overall, when predicting BMI, with an Accuracy of 99%
- As BloodPressure, Age and Stress decreases, Weight descreases.
- As ActivityLevel and Steps Increase, Weight decreases.
- 67% of Females and 33% of Males have overweight.
- Some Occupations have more people with overweight, we found out thatGender played a significant role in that.

2.
- 88% of people with obesity have sleep disorders
- Overweight, high HeartRate, BloodPressure & StressLevel produce poor Sleep Quality & Sleep Disorders
- The lower the Age the better the sleep quality

3. 
- More Steps and ActivityLevel reduce HeartRate, BloodPressure & StressLevel.
- StressLevel and Heartrate & StressLevel and Blood pressure correlate with each other.

## Recommendations
We can conclude that BMI adversely affects health by elevating blood pressure and heart rate, as well as contributing to diminished sleep quality and the onset of sleep disorders. High stress levels corresponded with elevated heart rates. All this can lead to diseases, diabetes, sleeping disorders and poor health.

**We have the following recommendations to improve health:**
-More Steps
-More Activity
-Both variables reduced BMI and stress, which consecutively reduces heart rate, blood pressure and improves sleep quality and sleep duration, causing less sleep disorders.
-Trying to reduce Stress by meditating (for example) would help reduce heart rate, causing less heart diseases.










