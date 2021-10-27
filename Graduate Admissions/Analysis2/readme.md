If you have questions about the following instructions or about your
assignment, please send me an email with a description of your question
and what you’ve tried in attempt to answer it. Be sure to include your
data file and R script. <span class="underline">Please do NOT submit
late assignments; they will not be accepted after answers are
posted.</span>

# Data Description

This data was downloaded from Kaggle.com, a site that houses open source
datasets. This

specific dataset is titled: “Graduate Admission 2.” From the Kaggle
website (below):

<https://www.kaggle.com/mohansacharya/graduate-admissions>

**Context**

This dataset is created for prediction of Graduate Admissions from an
Indian perspective. 

**Content**

The dataset contains several parameters which are considered important
during the application for Masters Programs. The parameters included are
: 1. GRE Scores ( out of 340 ) 2. TOEFL Scores ( out of 120 ) 3.
University Rating ( out of 5 ) 4. Statement of Purpose and Letter of
Recommendation Strength ( out of 5 ) 5. Undergraduate GPA ( out of 10 )
6. Research Experience ( either 0 or 1 ) 7. Chance of Admit ( ranging
from 0 to 1)

**Acknowledgements**

This dataset is inspired by the UCLA Graduate Dataset. The test scores
and GPA are in the older format. The dataset is owned by Mohan S
Acharya. 

**Inspiration**

This dataset was built with the purpose of helping students in
shortlisting universities with their profiles. The predicted output
gives them a fair idea about their chances for a particular university. 

**Citation**

Mohan S Acharya, Asfia Armaan, Aneeta S Antony : A Comparison of
Regression Models for Prediction of Graduate Admissions, IEEE
International Conference on Computational Intelligence in Data Science
2019

# Assignment Questions

1.  For each of the following variables contained in the below table,
    
    1.  Get the frequencies for each categorical variable and means/sd
        for each quantitative variable.

<table>
<thead>
<tr class="header">
<th>Variable</th>
<th><p>If quantitative, Mean</p>
<p>If categorical, Frequency group 0</p></th>
<th><p>If quantitative, SD</p>
<p>If categorical, Frequency group 1</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Research Experience</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Undergraduate GPA</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Letter of Recommendation (LOR)</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Statement of Purpose (SOP)</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

2.  Get correlations (and p-values) between the outcome, **chance of
    admit,** and explanatory variable. Put those values in the table
    below, labeled r (p).

3.  Perform a multiple regression analysis for the outcome variable,
    **chance of admit,** and fill in the rest of the table below.

Model Equation:

\(\text{Chanc}e_{i} = b_{0} + b_{1}*Research_{1i} + b_{2}*GPA_{2i} + b_{3}*LOR_{i3} + b_{4}*SOP_{i4} + e_{i}\)

PRE = F = df = p = b0 =

| Explanatory Variable           | r (p) | \(b_{1}\) (p) | Lower bound 95% CI | Upper bound 95% CI |
| ------------------------------ | ----- | ------------- | ------------------ | ------------------ |
| Research Experience            |       |               |                    |                    |
| Undergraduate GPA              |       |               |                    |                    |
| Letter of Recommendation (LOR) |       |               |                    |                    |
| Statement of Purpose (SOP)     |       |               |                    |                    |

2.  Interpretations of the values above.

When interpreting a <span class="underline">correlation between two
*quantitative* variables</span>, do not indicate that the coefficient is
positive or negative; rather, use a description of the variables
involved, like “A greater distance from home is associated with more
commuting time.”

When interpreting a <span class="underline">correlation between a
*categorical* and *quantitative* variable</span>, do not indicate that
the coefficient is positive or negative; rather, use a description of
the variables involved, like “Those who were in a romantic relationship
tended to have more absences from school than those who were not in a
romantic relationship.”

When interpreting \(b_{0}\) with multiple explanatory variables
(categorical and quantitative), describe what is the expected outcome,
for a person who have a **predicted score of 0 for all explanatory
variables.**

When interpreting \(b_{1}\) for *quantitative* explanatory variables,
describe whether the outcome variable is expected to increase or
decrease, and by how much, for each unit change in the explanatory
variable, **controlling for other variables in the model.**

When interpreting \(b_{1}\) for *categorical* explanatory variables,
describe whether there is a mean difference (direction and amount) in
the outcome variable, between the group coded 0 and the group coded 1
(use names for the groups; you must know the coding\!), **controlling
for other variables in the model.**

Model Parameters

| Parameter | supernova() Interpretations                                                                                                                                                                    |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PRE       | The proportion of error explained by our model using the Research, GPA, Letter of Recommendation, and Statement of Purpose variables is 78% This is a high PRE.                                |
| F         | The variance explained by the model is 364.798 times larger compared to the leftover variance unexplained by the model. This is a high F value.                                                |
| p-value   | Our p-value is 0.000, which shows that our model is statistical significant. The lower the value, the more significant it is. Since the p-value is \< 0.05, we can reject the null hypothesis. |

Correlations:

| Explanatory Variable           | Correlation Interpretations, r (p)                                                                                                                                                                                                                |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Research Experience            | More research experience is positively associated with a higher chance of admit. This value shows us that an increment of 0.55 standard deviations of Chance of Admit should be added on for every one standard deviation of Research Experience. |
| Undergraduate GPA              | Higher GPA Scores is positively associated with a higher chance of admit. This value shows us that an increment of 0.87 standard deviations of Chance of Admit should be added on for every one standard deviation of GPA Score.                  |
| Letter of Recommendation (LOR) | Letter of Recommendations (LOR) are positively associated with a higher chance of admit. This value shows us that an increment of 0.66 standard deviations of Chance of Admit should be added on for every one standard deviation of LOR.         |
| Statement of Purpose (SOP)     | Statement of Purposes (SOP) are positively associated with a higher chance of admit. This value shows us that an increment of 0.67 standard deviations of Chance of Admit should be added on for every one standard deviation of SOP.             |

Multiple Regression:

| Explanatory Variable           | Regression Weights Interpretations, \({b_{0}\text{\ and\ b}}_{1}\) (p) |
| ------------------------------ | ---------------------------------------------------------------------- |
| Intercept, \(b_{0}\)           |                                                                        |
| Research Experience            |                                                                        |
| Undergraduate GPA              |                                                                        |
| Letter of Recommendation (LOR) |                                                                        |
| Statement of Purpose (SOP)     |                                                                        |

3.  Fit a reduced model after removing explanatory variables that you
    believe do not contribute to the model. Revise the following model
    equation and fill in the table for the new model that has only those
    variables that were used (remove rows/terms as needed).

Model Equation:

\(\text{Chanc}e_{i} = b_{0} + b_{1}*Research_{1i} + b_{2}*GPA_{2i} + b_{3}*LOR_{i3} + b_{4}*SOP_{i4} + e_{i}\)

PRE = F = df = p = b0 =

| Explanatory Variable           | \(b_{1}\) (p) | Lower bound 95% CI | Upper bound 95% CI |
| ------------------------------ | ------------- | ------------------ | ------------------ |
| Research Experience            |               |                    |                    |
| Undergraduate GPA              |               |                    |                    |
| Letter of Recommendation (LOR) |               |                    |                    |

4.  Which model is best: the first model with four explanatory
    variables, or the reduced model with only those that contribute to
    the model? Why?

5.  How many parameters are in the multiple regression model in Q1?

6.  How many parameters are in the reduced model from Q3?

7.  How did the **parameter estimates** change as a result of removing
    explanatory variable(s)? Why do you believe this occurred?

8.  How did your **interpretations** change as a result of removing
    explanatory variable(s)? Why do you believe this occurred?

Extra credit:

EC1. What is the predicted chance of admit for respondent \#234, using
the multiple regression model from Q1?

EC2: What is the residual for respondent \#128, using the multiple
regression model from Q1?
