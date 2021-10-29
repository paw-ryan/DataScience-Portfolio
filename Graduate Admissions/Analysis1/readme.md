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

# Name: 

# Assignment Questions

1.  For each of the following explanatory variables, fit a separate
    regression and correlation for the outcome variable, **chance of
    admit**. Fill in the following cell with the appropriate value for
    each element of the model.

| Explanatory Variable | r | \[b_{0}\] | \[b_{1}\] | df | SS Model | SS Total | PRE | F |
| -------------------- | - | --------- | --------- | -- | -------- | -------- | --- | - |
| Research Experience  |   |           |           |    |          |          |     |   |
| Undergraduate GPA    |   |           |           |    |          |          |     |   |
| GRE Scores           |   |           |           |    |          |          |     |   |
| TOEFL Scores         |   |           |           |    |          |          |     |   |

2.  Interpret the values above.

When interpreting a <span class="underline">correlation between two
*quantitative* variables</span>, do not indicate that the coefficient is
positive or negative; rather, use a description of the variables
involved, like “A greater distance from home is
**positively/negatively** associated with more commuting time.”

When interpreting a <span class="underline">correlation between a
*categorical* and *quantitative* variable</span>, do not indicate that
the coefficient is positive or negative; rather, use a description of
the variables involved, like “Those who were in a romantic relationship
tended to have more absences from school than those who were not in a
romantic relationship.”

When interpreting \(b_{1}\) for *quantitative* explanatory variables,
describe whether the outcome variable is expected to increase or
decrease, and by how much, for each unit change in the explanatory
variable.

When interpreting \(b_{1}\) for *categorical* explanatory variables,
describe whether there is a mean difference (direction and amount) in
the outcome variable, between the group coded 0 and the group coded 1
(use names for the groups; you must know the coding\!).

When interpreting \(b_{0}\) for *quantitative* explanatory variables,
describe what is the expected outcome for those in the group coded 0
(use names for the groups; you must know the coding\!).

When interpreting \(b_{0}\) for *categorical* explanatory variables,
describe what is the expected outcome for those who have a predicted
score of 0.

| Explanatory Variable | Term      | Interpretation |
| -------------------- | --------- | -------------- |
| Research Experience  | r         |                |
|                      | \[b_{0}\] |                |
|                      | \[b_{1}\] |                |
|                      | PRE       |                |
| GRE Scores           | r         |                |
|                      | \[b_{0}\] |                |
|                      | \[b_{1}\] |                |
|                      | PRE       |                |

3.  Which model is the best, according to PRE? Why?

4.  Which model is best, according to the F Ratio? Why?

5.  Which model explains more variation, per df used? Why?

6.  Obtain predictions for the following respondents for each of the
    explanatory variables below. Based on your analyses, who do you
    believe has the best chance of getting admitted? Why?

| Explanatory Variable | Respondent \#40 | Respondent \#56 | Respondent \#78 | Respondent \#93 |
| -------------------- | --------------- | --------------- | --------------- | --------------- |
| Research Experience  |                 |                 |                 |                 |
| Undergraduate GPA    |                 |                 |                 |                 |
| GRE Scores           |                 |                 |                 |                 |
| TOEFL Scores         |                 |                 |                 |                 |

7.  For the best model that predicts the outcome variable per df used
    (see Q5), edit the following equation (see GLM notation) with
    inputted values that you would use to make predictions with.

\[Y_{i} = b_{0} + b_{1}X_{i} + e_{i}\]

Extra Credit: Input the values (those subscripted by \(i\) in the model
equation) for respondent \(i\) = 100 into the equation you edited in Q7.

\[Y_{i} = b_{0} + b_{1}X_{i} + e_{i}\]
