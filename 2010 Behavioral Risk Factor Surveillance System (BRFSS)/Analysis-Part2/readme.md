**<span class="underline">Case Study: SAS BRFSS 10 Categorical Table 2
and 3</span>**

This case study will continue your reintroduction to categorical
variables and how you may use statistical procedures to investigate
these types of data, display them in a “Table 2”, and develop a results
section describing your Table 2.

This case study will also introduce you to *adjusted* analysis of
categorical variables and how you may use statistical procedures to
investigate these types of data, display them in a “Table 3”, and
develop a results section describing your Table 3.

Continue using data from the Behavioral Health Needs Assessment Survey
from 2010 to complete this case study.

The objective of this analysis is to investigate the association between
**diabetes** and **BMI** after controlling for **exercise** and **sex**.
The outcome variable is **diabetes** and the variable of interest
(exposure) is **BMI**.

Conduct a **<span class="underline">complete case, case control
analysis</span>** for this objective following these guidelines:

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

5.  For the complete case analysis, restrict your sample based on the
    following conditions:
    
    1.  18\<=AGE\<=99
    
    2.  SEX: raw categories 1 and 2
    
    3.  DIABETE2: raw categories 1 and 3
    
    4.  EXERANY2: raw categories 1 and 2
    
    5.  Education (EDUCA): raw categories 1-6
    
    6.  \_BMI4CAT: raw categories 1,2 and 3
    
    7.  General health (GENHLTH): raw categories 1-5

<!-- end list -->

1)  (4 pts) Using PROC FREQ, show the simple frequency tables for sex,
    exercise, BMI, and diabetes.

2)  (15 pts) Create your “Table 2” for this objective. You can use this
    table template:

| Table 2. Characteristics of 413,748 BRFSS 2010 participants by presence of diabetes. |            |               |                |   |   |   |            |
| ------------------------------------------------------------------------------------ | ---------- | ------------- | -------------- | - | - | - | ---------- |
|                                                                                      | Population | Diabetes - No | Diabetes - Yes |   |   |   |            |
| Variable                                                                             | N          | %             | n              | % | n | % | p value \* |
|                                                                                      |            |               |                |   |   |   |            |
| **BMI**                                                                              |            |               |                |   |   |   |            |
| Normal                                                                               |            |               |                |   |   |   |            |
| Overweight                                                                           |            |               |                |   |   |   |            |
| Obese                                                                                |            |               |                |   |   |   |            |
| **Sex**                                                                              |            |               |                |   |   |   |            |
| Male                                                                                 |            |               |                |   |   |   |            |
| Female                                                                               |            |               |                |   |   |   |            |
| **Exercise**                                                                         |            |               |                |   |   |   |            |
| No                                                                                   |            |               |                |   |   |   |            |
| Yes                                                                                  |            |               |                |   |   |   |            |
| \* p values based on Pearson chi-square test of association                          |            |               |                |   |   |   |            |

3)  (21 pts) Write the results section for this “Table 2”.

4)  (15 pts) Based on the information in your Table 2,
    
    1.  Fill in Table 2B showing both the odds and probability of having
        diabetes:

| **TABLE2B. Odds and probabilities of having diabetes based on the characteristics of 413,748 BRFSS 2010 participants.** |                             |                                    |
| ----------------------------------------------------------------------------------------------------------------------- | --------------------------- | ---------------------------------- |
|                                                                                                                         | **Odds of Having Diabetes** | **Probability of Having Diabetes** |
| **Male**                                                                                                                |                             |                                    |
| **Female**                                                                                                              |                             |                                    |
| **Exerciser**                                                                                                           |                             |                                    |
| **Non-exercisers**                                                                                                      |                             |                                    |
| **Obese BMI**                                                                                                           |                             |                                    |
| **Overweight BMI**                                                                                                      |                             |                                    |
| **Normal BMI**                                                                                                          |                             |                                    |

2.  Based on the odds of having diabetes, fill in Table 2C showing the
    odds ratio (OR). Also interpret both the sign and magnitude of each
    odds ratio in the space given.

| **TABLE2C. Odds ratios of having diabetes based on the characteristics of 413,748 BRFSS 2010 participants.** |                      |                                       |
| ------------------------------------------------------------------------------------------------------------ | -------------------- | ------------------------------------- |
|                                                                                                              | **Odds Ratios (OR)** | **Interpretation of Odds Ratio (OR)** |
| **Female to male**                                                                                           |                      |                                       |
| **Exerciser to non-exerciser**                                                                               |                      |                                       |
| **Obese BMI to normal BMI**                                                                                  |                      |                                       |

5)  (5 pts) This study furthers our investigation by conducting a
    logistic regression explaining the presence of diabetes. Write the
    proposed model for this analysis.

6)  (57 pts) Using SAS PROC LOGISTIC, run a logistic regression that
    estimates your model using a CLASS statement which specifies the
    reference category for each variable. As reference categories, use
    the following: DIABETES = 0; EXERCISE = 0; SEX = 0

\_BMI4CAT = 1.

1.  Show the Analysis of Maximum Likelihood Estimates (MLEs) output
    table.
    
    1.  Explain both the sign and magnitude of the coefficient
        “estimate” for **EXERCISE.**

2.  Show the Odds Ratio Estimates output table.
    
    1.  Explain both the sign and magnitude of the odds ratio “point
        estimate” for **EXERCISE.**

3.  Show how the odds ratio for **EXERCISE** is calculated using the
    coefficient estimates shown in the Analysis of MLEs table.

4.  For each of the following goodness of fit tests, explain: (1) What
    question the test is attempting to answer; (2) what is the null
    hypothesis H<sub>0</sub>; and (3) What the test statistic shows in
    this case supporting your answer with the relevant SAS output table.
    
    1.  Log likelihood/AIC
    
    2.  Global chi-squared
    
    3.  Deviance chi-squared
    
    4.  Hosmer and Lemeshow chi-squared

5.  Compare the *unadjusted* OR from Table 2C above and the *adjusted*
    OR from your logistic regression:
    
    1.  Fill in the table below with these odds ratios

|                                | **Unadjusted Odds Ratios (OR)** | **Adjusted Odds Ratios (OR)** |
| ------------------------------ | ------------------------------- | ----------------------------- |
| **Female to male**             |                                 |                               |
| **Exerciser to non-exerciser** |                                 |                               |
| **Obese BMI to normal BMI**    |                                 |                               |

2.  In what sense are the ORs obtained from the logistic regression
    “adjusted”? Does this account for the differences between the
    unadjusted and adjusted ORs? Explain.

<!-- end list -->

7)  (12 pts) Create your “Table 3” for this objective. You can use this
    table template:

| Table 3. Logistic regression analysis comparing the adjusted odds ratio of diabetes in 116,615 obese BRFSS 2010 participants when compared to participants with normal BMI after controlling for exercise and sex. |               |                |      |        |        |        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------- | -------------- | ---- | ------ | ------ | ------ |
|                                                                                                                                                                                                                    | Diabetes - No | Diabetes - Yes | OR\* | 95% CI |        |        |
| Variable                                                                                                                                                                                                           | n             | %              | n    | %      |        |        |
|                                                                                                                                                                                                                    |               |                |      |        | \----- | \----- |
| **BMI**                                                                                                                                                                                                            |               |                |      |        |        |        |
| Normal                                                                                                                                                                                                             |               |                |      |        | \----- | \----- |
| Overweight                                                                                                                                                                                                         |               |                |      |        |        |        |
| Obese                                                                                                                                                                                                              |               |                |      |        |        |        |
| **Sex**                                                                                                                                                                                                            |               |                |      |        |        |        |
| Male                                                                                                                                                                                                               |               |                |      |        | \----- | \----- |
| Female                                                                                                                                                                                                             |               |                |      |        |        |        |
| **Exercise**                                                                                                                                                                                                       |               |                |      |        |        |        |
| No                                                                                                                                                                                                                 |               |                |      |        | \----- | \----- |
| Yes                                                                                                                                                                                                                |               |                |      |        |        |        |
| \* 95% confidence intervals are for reported odds ratios.                                                                                                                                                          |               |                |      |        |        |        |

8)  (21 pts) Write the Table 3 results section/interpretation.

Extra Credit (15 pts)

Estimate a fully saturated logistic model.

1.  Show the MLE table for this regression.

2.  Show the deviance output table for this regression. Does the
    estimated deviance statistic make sense? Explain.

3.  Identify which interactions should be removed.

4.  Estimate the final model and show the MLE table.

5.  Show the final model deviance output table. Explain what the
    deviance statistic now shows.
