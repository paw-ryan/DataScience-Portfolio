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
| 18 to 34                                                                             |            |               |                |       |        |       |            |
| 35 to 54                                                                             |            |               |                |       |        |       |            |
| 55+                                                                                  |            |               |                |       |        |       |            |
| **Education**                                                                        |            |               |                |       |        |       |            |
| Elementary                                                                           |            |               |                |       |        |       |            |
| HS                                                                                   |            |               |                |       |        |       |            |
| College                                                                              |            |               |                |       |        |       |            |
| **General Health**                                                                   |            |               |                |       |        |       |            |
| Poor                                                                                 |            |               |                |       |        |       |            |
| Good                                                                                 |            |               |                |       |        |       |            |
| Excellent                                                                            |            |               |                |       |        |       |            |
| \* p values based on Pearson chi-square test of association                          |            |               |                |       |        |       |            |

2)  (20 pts) Amend your Homework \#2 results section for this expanded
    Table 2.

3)  (15 pts) Based on the data in the expanded Table 2, which are the
    top 3 categories in terms of the <span class="underline">unadjusted
    probability</span> of having diabetes? Use the template below.

| **Category** | **Odds of Having Diabetes** | **Probability of Having Diabetes** |
| ------------ | --------------------------- | ---------------------------------- |
| ** **        |                             |                                    |
| ** **        |                             |                                    |
| ** **        |                             |                                    |

4)  (5 pts) Write the proposed model for this objective.

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

2.  Interpret the OR value for AGE (remember AGE is a continuous
    variable). Show the relevant SAS output.

3.  Interpret the OR value for BMI.

<!-- end list -->

6)  (10 pts) Investigate whether multicollinearity exists among the
    variables using PROC REG (**switch to using the categorized version
    of AGE**). Which two variables have the highest VIF values and what
    does that mean? Is multicollinearity an issue with these variables?
    Show the relevant SAS output.

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
| **Remove exercise**       |                          |              |
| **Remove sex**            |                          |              |
| **Remove general health** |                          |              |
| **Remove age**            |                          |              |
| **Remove education**      |                          |              |

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
    
    1.  Since the estimated β’s for BMI are statistically different from
        zero, is this proof that the included control variables are not
        confounding the relationship between BMI and diabetes? Explain.

2.  Show the SAS output table which presents the adjusted ORs.

<!-- end list -->

1.  What are the top 3 categories in terms of the adjusted ORs?

2.  Do these top 3 categories match what you found above for the
    unadjusted ORs using Table 2? What accounts for the difference if
    there is any? Explain. Use the following table template to support
    your answer:

|                                     |                      |                          |
| ----------------------------------- | -------------------- | ------------------------ |
|                                     | **Odds Ratios (OR)** | **Adjusted Odds Ratios** |
| **Female to male**                  |                      |                          |
| **Exerciser to non-exerciser**      |                      |                          |
| **Overweight to normal BMI**        |                      |                          |
| **Obese to normal BMI**             |                      |                          |
| **Age 35-54 to 18-24**              |                      |                          |
| **Age 55+ to 18-24**                |                      |                          |
| **HS to elementary education**      |                      |                          |
| **College to elementary education** |                      |                          |
| **Good to poor health**             |                      |                          |
| **Excellent to poor health**        |                      |                          |

3.  So, what is your overall conclusion as to the relationship between
    BMI and diabetes? <span class="underline">Does your conclusion
    differ from what you found in Homework 2</span>? Even with the
    inclusion of additional control variables? Explain. Be specific in
    your answer using comparative analysis of estimated effects

<!-- end list -->

9)  (15 pts) Create your “Table 3” for this objective. You can use this
    table template:

| Table 3. Logistic regression analysis comparing the adjusted odds ratio of diabetes in 116,615 obese BRFSS 2010 participants when compared to participants with normal BMI after controlling for exercise, sex, age, education, and general health |               |                |      |        |  |  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | -------------- | ---- | ------ |  |  |
|                                                                                                                                                                                                                                                    | Diabetes - No | Diabetes - Yes | OR\* | 95% CI |  |  |
| Variable                                                                                                                                                                                                                                           | n             | %              | n    | %      |  |  |
|                                                                                                                                                                                                                                                    |               |                |      |        |  |  |
| **BMI**                                                                                                                                                                                                                                            |               |                |      |        |  |  |
| Normal                                                                                                                                                                                                                                             |               |                |      |        |  |  |
| Overweight                                                                                                                                                                                                                                         |               |                |      |        |  |  |
| Obese                                                                                                                                                                                                                                              |               |                |      |        |  |  |
| **Sex**                                                                                                                                                                                                                                            |               |                |      |        |  |  |
| Male                                                                                                                                                                                                                                               |               |                |      |        |  |  |
| Female                                                                                                                                                                                                                                             |               |                |      |        |  |  |
| **Exercise**                                                                                                                                                                                                                                       |               |                |      |        |  |  |
| No                                                                                                                                                                                                                                                 |               |                |      |        |  |  |
| Yes                                                                                                                                                                                                                                                |               |                |      |        |  |  |
| **Age**                                                                                                                                                                                                                                            |               |                |      |        |  |  |
| 18 to 34                                                                                                                                                                                                                                           |               |                |      |        |  |  |
| 35 to 54                                                                                                                                                                                                                                           |               |                |      |        |  |  |
| 55+                                                                                                                                                                                                                                                |               |                |      |        |  |  |
| **Education**                                                                                                                                                                                                                                      |               |                |      |        |  |  |
| Elementary                                                                                                                                                                                                                                         |               |                |      |        |  |  |
| HS                                                                                                                                                                                                                                                 |               |                |      |        |  |  |
| College                                                                                                                                                                                                                                            |               |                |      |        |  |  |
| **General Health**                                                                                                                                                                                                                                 |               |                |      |        |  |  |
| Poor                                                                                                                                                                                                                                               |               |                |      |        |  |  |
| Good                                                                                                                                                                                                                                               |               |                |      |        |  |  |
| Excellent                                                                                                                                                                                                                                          |               |                |      |        |  |  |
| \* 95% confidence intervals are for reported odds ratios.                                                                                                                                                                                          |               |                |      |        |  |  |

10) (20 pts) Write the Table 3 results section/interpretation.

> Extra Credit (15 pts)
> 
> Test for an interaction between SEX and the categorized AGE variable.

1.  What is your conclusion? Does a significant interaction exist?

2.  Show the MLE table and Type 3 Analysis of Effects (“Joint test”)
    output table to support your conclusion.

3.  Compute and interpret the OR for your interaction: SEX at AGECAT =
    1, AGECAT = 2 and AGECAT = 3.
