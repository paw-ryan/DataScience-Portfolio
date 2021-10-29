**<span class="underline">Case Study: SAS BRFSS 10 Categorical Table
3</span>**

This case study will build on last week’s introduction to adjusted
analyses with categorical variables and dive into the area of model
building. There are many ways in which analysts come to a final model
and we will explore some of them in this case study. The case study will
end with a more developed “Table 3”. Continue using data from the
Behavioral Health Needs Assessment Survey from 2010 to complete this
case study.

It is expected that all students have taken CITI training prior to
conducting these secondary data analysis case studies. Please go to
[<span class="underline">http://ohrc.nu.edu/</span>](http://ohrc.nu.edu/),
visit the tab “IRB”, and read about what an IRB is and the role of the
National University IRB. Then please make sure to visit the CITI link
and take the training.

Next, go to the NU Health Science Research Center
[<span class="underline">http://ohrc.nu.edu/</span>](http://ohrc.nu.edu/)
and go into “Data Sets”. From there go to
“**<span class="underline">Source</span>**:
[<span class="underline">government agency or
foundation</span>](about:blank)” then “[<span class="underline">Federal
(National)</span>](about:blank)”, and then
“[<span class="underline">Centers for Disease Control and Prevention
\[CDC\]</span>](about:blank)”. From there, you will see the link for
**Behavioral Risk Factor Surveillance System (BRFSS)**.

From this link find 2010 data and download the SAS zipped file and the
codebook.

The objective of this analysis is to investigate the association between
**diabetes** and **BMI** after controlling for **exercise, age,
education,** **general health**, and **sex**. The outcome variable is
**diabetes** and the variable of interest (exposure) is **BMI**.

Conduct a **<span class="underline">complete case analysis</span>** for
this objective following these guidelines:

1.  Use the raw variable categorization of BMI (\_BMI4CAT)

2.  Categorize gender (SEX) into a two-level variable (male=0, female=1)
    where male is category 1 of the raw variable and female is category
    2

3.  Categorize diabetes (DIABETE2) into a two-level variable (no=0,
    yes=1) where yes is category 1 of the raw variable and no is
    category 3

4.  Categorize exercise (EXERANY2) into a two-level variable (no=0,
    yes=1) where yes is category 1 of the raw variable and no is
    category 2

5.  Use the raw variable categorization of general health (GENHLTH)

6.  Categorize education (EDUCA) into a three-level variable: (raw
    categories 1 and 2 = 1), raw categories 3 and 4 = 2), (raw
    categories 5 and 6 = 3)

7.  Categorize age (AGE) into a three-level variable: (18\<=age\<=34 =
    1, 35\<=age\<=54 = 2, 55\<=age = 3)

8.  For the complete case analysis, restrict your sample based on the
    following conditions:
    
    1.  18\<=AGE\<=99
    
    2.  SEX: raw categories 1 and 2
    
    3.  DIABETE2: raw categories 1 and 3
    
    4.  EXERANY2: raw categories 1 and 2
    
    5.  Education (EDUCA): raw categories 1-6
    
    6.  \_BMI4CAT: raw categories 1,2 and 3
    
    7.  General health (GENHLTH): raw categories 1-5

<!-- end list -->

1)  (15 pts) Expand Table 2 to include the 3 new categorized variables
    age, education, and general health. Use the template below. Double
    check that the values in the pre-populated cells match your SAS
    output. **Note: use the following classifications for Education and
    General Health:**

If EDUCA 1 or 2 = “Elementary”

If EDUCA 3 or 4 = “HS”

If EDUCA 5 or 6 = “College”

If GENHLTH 1 = “Excellent”

If GENHLTH 2 or 3 = “Good”

IF GENHLTH 4 or 5 = “Poor”

| Table 2. Characteristics of 413,748 BRFSS 2010 participants by presence of diabetes. |            |               |                |       |        |       |            |
| ------------------------------------------------------------------------------------ | ---------- | ------------- | -------------- | ----- | ------ | ----- | ---------- |
|                                                                                      | Population | Diabetes - No | Diabetes - Yes |       |        |       |            |
| Variable                                                                             | N          | %             | n              | %     | n      | %     | p value \* |
|                                                                                      | 413,748    | 100.0%        | 360,098        | 87.0% | 53,650 | 13.0% |            |
| **BMI**                                                                              |            |               |                |       |        |       |            |
| Normal                                                                               | 145,352    | 35.1%         | 137,163        | 38.1% | 8,189  | 15.3% |            |
| Overweight                                                                           | 151,781    | 36.7%         | 134,539        | 37.4% | 17,242 | 32.1% |            |
| Obese                                                                                | 116,615    | 28.2%         | 88,396         | 24.5% | 28,219 | 52.6% | \<0.0001   |
| **Sex**                                                                              |            |               |                |       |        |       |            |
| Male                                                                                 | 162,430    | 39.3%         | 139,820        | 38.8% | 22,610 | 42.1% |            |
| Female                                                                               | 251,318    | 60.7%         | 220,278        | 61.2% | 31,040 | 57.9% | \<0.0001   |
| **Exercise**                                                                         |            |               |                |       |        |       |            |
| Yes                                                                                  | 302,217    | 73.0%         | 270,225        | 75.0% | 31,992 | 59.6% |            |
| No                                                                                   | 111,531    | 27.0%         | 89,873         | 25.0% | 21,658 | 40.4% | \<0.0001   |
| **Age**                                                                              |            |               |                |       |        |       |            |
| 18 to 34                                                                             | 44,159     | 10.7%         | 43,260         | 12.0% | 899    | 1.7%  |            |
| 35 to 54                                                                             | 133,743    | 32.3%         | 124,039        | 34.5% | 9,704  | 18.1% |            |
| 55+                                                                                  | 235,846    | 57.0%         | 192,799        | 53.5% | 43,047 | 80.2% | \<0.0001   |
| **Education**                                                                        |            |               |                |       |        |       |            |
| Elementary                                                                           | 12,867     | 3.1%          | 9,549          | 2.7%  | 3,318  | 6.2%  |            |
| HS                                                                                   | 149,121    | 36.0%         | 125,304        | 34.8% | 23,817 | 44.4% |            |
| College                                                                              | 251,760    | 60.9%         | 225,245        | 62.6% | 26,515 | 49.4% | \<0.0001   |
| **General Health**                                                                   |            |               |                |       |        |       |            |
| Poor                                                                                 | 82,162     | 19.9%         | 57,115         | 15.9% | 25,047 | 46.7% |            |
| Good                                                                                 | 258,008    | 62.4%         | 231,036        | 64.2% | 26,972 | 50.3% |            |
| Excellent                                                                            | 73,578     | 17.8%         | 71,947         | 20.0% | 1,631  | 3.0%  | \<0.0001   |
| \* p values based on Pearson chi-square test of association                          |            |               |                |       |        |       |            |

2)  (20 pts) Amend your Homework \#2 results section for this expanded
    Table 2.

**The demographic characteristics of the BRFSS 2010 population are
compared in Table 2 with respect to the presence of diabetes. Overall,
13% of the entire population had a diagnosis of diabetes. There were
proportionately fewer people with a College education than expected
diagnosed with diabetes (49.4% vs. 60.9%; p\<0.0001) and proportionately
more people with a High School education than expected diagnosed with
diabetes (44.4% vs. 36.0%; p\<0.0001). With respect to General Health,
there proportionately fewer people with Excellent and Good health with
diabetes than expected (3.0% vs. 17.8% and 50.3% vs. 62.4%; p\<0.0001).
With respect to Age, there proportionately fewer people that were
between ages 18 to 34 with diabetes than expected (1.7% vs. 10.7%;
p\<0.0001).**

3)  (15 pts) Based on the data in the expanded Table 2, which are the
    top 3 categories in terms of the <span class="underline">unadjusted
    probability</span> of having diabetes? Use the template below.

| **Category**           | **Odds of Having Diabetes** | **Probability of Having Diabetes** |
| ---------------------- | --------------------------- | ---------------------------------- |
| **Male**               | 0.162                       | 13.92%                             |
| **Female**             | 0.141                       | 12.35%                             |
| **Exerciser**          | 0.118                       | 10.59%                             |
| **Non-exercisers**     | 0.241                       | 19.42%                             |
| **Normal**             | 0.060                       | 5.63%                              |
| **Obese BMI**          | 0.319                       | 24.20%                             |
| **Overweight BMI**     | 0.128                       | 11.36%                             |
| **Age 18-34**          | 0.021                       | 2.04%                              |
| **Age 35-54**          | 0.078                       | 7.26%                              |
| **Age 55+**            | 0.223                       | 18.25%                             |
| **Elementary**         | 0.347                       | 25.79%                             |
| **HS**                 | 0.190                       | 15.97%                             |
| **College**            | 0.118                       | 10.53%                             |
| **Health - Poor**      | 0.439                       | 30.48%                             |
| **Health - Good**      | 0.117                       | 10.45%                             |
| **Health - Excellent** | 0.023                       | 2.22%                              |

4)  (5 pts) Write the proposed model for this objective.

> **DIABETES = f (BMI, EXERCISE, SEX, AGE, EDUCATION, GENERAL HEALTH)**
> 
> **DIABETES = 0/1(No/Yes)**
> 
> **BMI = 1/2/3 (Normal BMI/Overweight BMI/Obese BMI)**
> 
> **EXERCISE = 0/1 (Non-exercisers/Exercisers)**
> 
> **SEX = 0/1 (Male/Female)**
> 
> **AGE = 1/2/3 (18 to 34, 35 to 54, 55+)**
> 
> **EDUCATION = 1/2/3 (Elementary/High School/College)**
> 
> **GENERAL HEALTH = 1/2/3 (Excellent Health/Good Health/Poor Health)**
> 
> **Our outcome variable is DIABETES, our exposure variable is BMI, and
> our control variables are SEX, EXERCISE, AGE, EDUCATION, GENERAL
> HEALTH.**

5)  (15 pts) Estimate a base logistic regression model.
    <span class="underline">Do not</span> use a CLASS statement
    specifying reference values for each variable. **Use the raw
    continuous variable AGE…not your categorized version.** (*Note – we
    have a continuous variable AGE from which we created a categorized
    version. We can use one or the other in our model. Here we are using
    the continuous version.*) Use the DESCENDING option to order your
    dependent variable diabetes from highest to lowest (1 to 0).

**proc** **logistic** data=work.tmp descending;

model diabetes = AGE var2 .... varN; **run**;

1.  Interpret the sign on the coefficient (β) of AGE. Show the relevant
    SAS output.

> **The raw coefficient values (betas) of the estimated logistic
> equation can be modeled as:**
> 
> **Log(pi/(1-pi) = α + β1BMI + β2EXERCISE + β3SEX + β4EDUCATION β5AGE +
> β6GENERALHEALTH**
> 
> **For AGE, the estimate is 0.0367 (β5) (see MLE table below). Since
> this is positive value, there is a positive relationship. This means
> older participants have a higher likelihood of having diabetes (since
> β5 \> 0).**
> 
> ![Table Description automatically generated](media/image1.png)

2.  Interpret the OR value for AGE (remember AGE is a continuous
    variable). Show the relevant SAS output.

> **Odds Ratio for AGE = 1.037**
> 
> **(1.037 – 1)\*100 = 3.7%**
> 
> **For every 1-year increase in AGE, the odds of having diabetes
> increase by 3.7%, after controlling exercise, BMI, sex, education, and
> general health (OR = 1.037; 95% CI = 1.037-1.038).**
> 
> ![Table Description automatically generated](media/image2.png)

3.  Interpret the OR value for BMI.

> **Odds Ratio for BMI = 2.312**
> 
> **(2.312 – 1)\*100 = 132.1%**
> 
> **The odds for people with an Obese BMI having diabetes are 132.1%
> higher than people with a Normal BMI, after controlling sex, exercise,
> education, age, and general health (OR = 2.312; 95% CI =
> 2.281-2.343).**

6)  (10 pts) Investigate whether multicollinearity exists among the
    variables using PROC REG (**switch to using the categorized version
    of AGE**). Which two variables have the highest VIF values and what
    does that mean? Is multicollinearity an issue with these variables?
    Show the relevant SAS output.

> **General Health and Education have the top 2 highest Variance
> Inflation Factors (VIF) values (1.17 and 1.10). These VIF values help
> measure how highly correlated each independent variable is with the
> other predictors in the model. When independent variables are
> correlated, it indicates that changes in one variable are associated
> with shifts in another variable. The stronger the correlation, the
> more difficult it is to change one variable without changing another.
> If the VIF value exceeds 5 or 10, this indicates a problematic amount
> of collinearity. In this case, there are no issues with
> multicollinearity because there is no VIF greater than 5.**

![Table Description automatically generated](media/image3.png)

7)  (15 pts) Investigate whether any of the control variables are true
    confounding variables with respect to the exposure variable
    \_BMI4CAT using PROC LOGISTIC. <span class="underline">Do not</span>
    use a class statement specifying reference values for each variable.
    **<span class="underline">Continue using the categorized version of
    AGE for this question and all subsequent questions</span>.** Compute
    the % change in the OR for \_BMI4CAT when each of the variables are
    removed from the model. Use the following template. What is your
    conclusion? Is there a relationship between BMI and the presence of
    diabetes? Explain.

| ** **                     | **Exposure (\_BMI4CAT)** |              |
| ------------------------- | ------------------------ | ------------ |
| **Variable**              | **OR**                   | **% Chg OR** |
| **Remove exercise**       | 2.173                    | 0.65%        |
| **Remove sex**            | 2.166                    | 0.32%        |
| **Remove general health** | 2.325                    | 7.69%        |
| **Remove age**            | 2.039                    | \-5.89%      |
| **Remove education**      | 2.159                    | 0.00%        |

**My conclusion is that there are no true confounding variables with
respect to the exposure variable BMI. After removing each variable from
the model, I calculated the % change in the OR. Since none of the %
changes were \> 10%, this means there are no true confounding variables.
If we’re interested in the correct inference between BMI and Diabetes,
we do <span class="underline">not</span> have to include exercise, sex,
general health, age, and education in the analysis. If we did find a
confounding variable (% change \>10%), we would have to leave the
variable in the model. The association between BMI (exposure) and
Diabetes (outcome) is <span class="underline">not confounded</span> by
the relationship between any of our control variables (exercise, sex,
general health, age, education) and BMI.**

8)  (20 pts) Re-estimate your logistic model,
    <span class="underline">now using the CLASS statement</span> showing
    the reference categories for each variable. Use the following
    reference category for each variable:

Sex – male

Exercise – no exercise

BMI – normal

Age – 18 to 34

Education – elementary

General Health – poor

1.  Show the SAS output table which presents the model coefficients
    (β’s).

> ![Table Description automatically generated](media/image4.png)

1.  Since the estimated β’s for BMI are statistically different from
    zero, is this proof that the included control variables are not
    confounding the relationship between BMI and diabetes? Explain.

> **No, it is not proof that the included control variables are not
> confounding the relationship between BMI and Diabetes. A confounding
> variable is when the variable is associated with both the exposure
> (BMI) and Diabetes (outcome). The estimated β’s may be statistically
> different from zero (since β is at least twice the standard error),
> but to test the confounding relationship we need to compute the %
> change in the Odds Ratio for our exposure variable (BMI) when each of
> the variables are removed from the model (like what we did in the
> previous question).**

2.  Show the SAS output table which presents the adjusted ORs.

> ![Table Description automatically generated](media/image5.png)

1.  What are the top 3 categories in terms of the adjusted ORs?

| **Category**              | **Adjusted OR** |
| ------------------------- | --------------- |
| Ages 55+ vs. Ages 18-34   | 8.395           |
| Obese BMI vs. Normal BMI  | 4.497           |
| Ages 34-54 vs. Ages 18-34 | 3.080           |

2.  Do these top 3 categories match what you found above for the
    unadjusted ORs using Table 2? What accounts for the difference if
    there is any? Explain. Use the following table template to support
    your answer:

> **Yes, the top 3 categories from the unadjusted ORs are the same as
> the adjusted ORs. The highest OR category was Ages 55+ relative to
> Ages 18-34, the second highest category was Obese BMI relative to
> normal BMI , and the third highest was Ages 35-54 relative to Ages
> 18-34.**
> 
> **Regarding the *values* between unadjusted vs. adjusted ORs, there is
> a slight difference because the adjusted OR accounts for the control
> variables (Sex, Exercise, Age, Education, General Health), while the
> unadjusted OR does not.**

|                                     |                      |                          |
| ----------------------------------- | -------------------- | ------------------------ |
|                                     | **Odds Ratios (OR)** | **Adjusted Odds Ratios** |
| **Female to male**                  | 0.871                | 0.847                    |
| **Exerciser to non-exerciser**      | 0.491                | 0.869                    |
| **Overweight to normal BMI**        | 2.146                | 1.957                    |
| **Obese to normal BMI**             | 5.345                | 4.497                    |
| **Age 35-54 to 18-34**              | 3.760                | 3.080                    |
| **Age 55+ to 18-34**                | 10.731               | 8.395                    |
| **HS to elementary education**      | 0.547                | 0.842                    |
| **College to elementary education** | 0.339                | 0.747                    |
| **Good to poor health**             | 0.266                | 0.341                    |
| **Excellent to poor health**        | 0.052                | 0.095                    |

3.  So, what is your overall conclusion as to the relationship between
    BMI and diabetes? <span class="underline">Does your conclusion
    differ from what you found in Homework 2</span>? Even with the
    inclusion of additional control variables? Explain. Be specific in
    your answer using comparative analysis of estimated effects

> **Since Homework 2 did not include the additional control variables,
> our overall conclusion is different in this Homework. In Homework 2,
> Obese BMI to Normal BMI had the highest OR, which is different than
> this Homework. In this Homework, the odds of a person Ages 55+ having
> diabetes is 8.4 times higher compared to a younger person Ages
> 18-34.**
> 
> **In this Homework, the model included 5 control variables (Sex,
> Exercise, Age, Education, General Health). In Homework 2, the model
> only included 2 control variables (Sex and Exercise). In this
> Homework, the Age variable had the top 1 and 3 spot for highest ORs
> for Ages 55+ relative to Ages 18-34 (OR = 8.395; 95% CI = 7.844-8.986)
> and Age 35-54 relative to Ages 18-34 (OR = 3.080; 95% CI =
> 2.871-3.305), which were not control variables in Homework 2. In this
> Homework, the top 2 spot for the OR is Obese BMI relative to Normal
> BMI (OR = 4.497; 95% CI = 4.376-4.622).**

9)  (15 pts) Create your “Table 3” for this objective. You can use this
    table template:

| Table 3. Logistic regression analysis comparing the adjusted odds ratio of diabetes in 116,615 obese BRFSS 2010 participants when compared to participants with normal BMI after controlling for exercise, sex, age, education, and general health |               |                |        |        |       |               |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | -------------- | ------ | ------ | ----- | ------------- |
|                                                                                                                                                                                                                                                    | Diabetes - No | Diabetes - Yes | OR\*   | 95% CI |       |               |
| Variable                                                                                                                                                                                                                                           | n             | %              | n      | %      |       |               |
|                                                                                                                                                                                                                                                    | 360,098       | 87.0%          | 53,650 | 13.0%  | ----- | -----         |
| **BMI**                                                                                                                                                                                                                                            |               |                |        |        |       |               |
| Normal                                                                                                                                                                                                                                             | 137,163       | 38.1%          | 8,189  | 15.3%  | ----- | -----         |
| Overweight                                                                                                                                                                                                                                         | 134,539       | 37.4%          | 17,242 | 32.1%  | 1.957 | 1.902 - 2.014 |
| Obese                                                                                                                                                                                                                                              | 88,396        | 24.6%          | 28,219 | 52.6%  | 4.497 | 4.376 - 4.622 |
| **Sex**                                                                                                                                                                                                                                            |               |                |        |        |       |               |
| Male                                                                                                                                                                                                                                               | 139,820       | 38.8%          | 22,610 | 42.1%  | ----- | -----         |
| Female                                                                                                                                                                                                                                             | 220,278       | 61.2%          | 31,040 | 57.9%  | 0.847 | 0.830 - 0.865 |
| **Exercise**                                                                                                                                                                                                                                       |               |                |        |        |       |               |
| No                                                                                                                                                                                                                                                 | 89,873        | 25.0%          | 21,658 | 40.4%  | ----- | -----         |
| Yes                                                                                                                                                                                                                                                | 270,225       | 75.0%          | 31,992 | 59.6%  | 0.869 | 0.850 - 0.887 |
| **Age**                                                                                                                                                                                                                                            |               |                |        |        |       |               |
| 18 to 34                                                                                                                                                                                                                                           | 43,260        | 12.0%          | 899    | 1.7%   | ----- | -----         |
| 35 to 54                                                                                                                                                                                                                                           | 124,039       | 34.5%          | 9,704  | 18.1%  | 3.080 | 2.871 - 3.305 |
| 55+                                                                                                                                                                                                                                                | 192,799       | 53.5%          | 43,047 | 80.2%  | 8.395 | 7.844 - 8.986 |
| **Education**                                                                                                                                                                                                                                      |               |                |        |        |       |               |
| Elementary                                                                                                                                                                                                                                         | 9,549         | 2.7%           | 3,318  | 6.2%   | ----- | -----         |
| HS                                                                                                                                                                                                                                                 | 125,304       | 34.8%          | 23,817 | 44.4%  | 0.842 | 0.804 - 0.882 |
| College                                                                                                                                                                                                                                            | 225,245       | 62.6%          | 26,515 | 49.4%  | 0.747 | 0.714 - 0.783 |
| **General Health**                                                                                                                                                                                                                                 |               |                |        |        |       |               |
| Poor                                                                                                                                                                                                                                               | 57,115        | 15.9%          | 25,047 | 46.7%  | ----- | -----         |
| Good                                                                                                                                                                                                                                               | 231,036       | 64.2%          | 26,972 | 50.3%  | 0.341 | 0.334 - 0.349 |
| Excellent                                                                                                                                                                                                                                          | 71,947        | 20.0%          | 1,631  | 3.0%   | 0.095 | 0.090 - 0.100 |
| \* 95% confidence intervals are for reported odds ratios.                                                                                                                                                                                          |               |                |        |        |       |               |

10) (20 pts) Write the Table 3 results section/interpretation.

> **Table 3 presents the adjusted odds ratios for the study on the
> association between BMI and the diagnosis of diabetes in the BRFSS
> 2010 population. Females had slightly lower odds (15%) relative to
> males of being diagnosed with diabetes, after controlling for
> exercise, BMI, age, education, and general health (OR = 0.847; 95% CI
> = 0.830-0.865). Those who reported exercising had 13% fewer odds of
> being diagnosed with diabetes than those who reported they did not
> exercise, after controlling for sex, BMI, age, education, and general
> health (OR = 0.869; 95% CI = 0.850 - 0.887). Those with a BMI rated as
> “obese” had greater odds (350%) of being diagnosed with diabetes as
> compared to those with a BMI rates as “normal”, after controlling for
> sex, exercise, age, education, and general health (OR = 4.497; 95% CI
> = 4.376 - 4.622). Older participants who were Ages 55+ had even higher
> odds (740%) of being diagnosed with diabetes as compared to younger
> participants who were Ages 18-34, after controlling for sex, exercise,
> BMI, education, and general health (OR = 8.395; 95% CI = 7.844 -
> 8.986). Those with a High School education had slightly lower odds
> (16%) of being diagnosed with diabetes relative to those with a
> Elementary education, after controlling for sex, exercise, BMI, age,
> and general health (OR = 0.842; 95% CI = 0.804 - 0.882). Those with
> Excellent health had substantially lower odds (91%) of being diagnosed
> with diabetes relative to participants with a Poor health, after
> controlling for sex, exercise, BMI, age, and education (OR = 0.095;
> 95% CI = 0.090 - 0.100).**
> 
> Extra Credit (15 pts)
> 
> Test for an interaction between SEX and the categorized AGE variable.

1.  What is your conclusion? Does a significant interaction exist?

> **Yes, a significant interaction exists. In the MLE and joint test
> tables below, SEX\*AGECAT have a p-value of \<0.0001, which shows that
> the interaction is statistically significant. Moreover, in the MLE
> table, the estimate (β) is at least twice the standard error which
> shows that it is statistically different from 0.**

2.  Show the MLE table and Type 3 Analysis of Effects (“Joint test”)
    output table to support your conclusion.

![Table Description automatically generated](media/image6.png)

![Table Description automatically generated](media/image7.png)

3.  Compute and interpret the OR for your interaction: SEX at AGECAT =
    1, AGECAT = 2 and AGECAT = 3.

![Table Description automatically generated](media/image8.png)

> **For participants Ages 18-34, the odds of a male having diabetes are
> 14.7% higher relative to females. (OR = 1.147; 95% CI = 1.067 -
> 1.232).**
> 
> **For participants Ages 35-54, the odds of a male having diabetes are
> 3.7% lower relative to females. (OR = 0.963; 95% CI = 0.930 -
> 0.998).**
> 
> **For participants Ages 55+, the odds of males having diabetes are
> 19.1% times lower relative to females. (OR = 0.809; 95% CI = 0.792 -
> 0.826).**
