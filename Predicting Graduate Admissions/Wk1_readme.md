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

| Explanatory Variable | r    | \[b_{0}\] | \[b_{1}\] | df | SS Model | SS Total | PRE  | F       |
| -------------------- | ---- | --------- | --------- | -- | -------- | -------- | ---- | ------- |
| Research Experience  | 0.55 | 0.64      | 0.16      | 1  | 2.48     | 8.11     | 0.31 | 175.51  |
| Undergraduate GPA    | 0.87 | \-1.07    | 0.21      | 1  | 6.19     | 8.12     | 0.76 | 1278.73 |
| GRE Scores           | 0.80 | \-2.44    | 0.01      | 1  | 5.23     | 8.12     | 0.64 | 720.55  |
| TOEFL Scores         | 0.79 | \-1.27    | 0.02      | 1  | 5.09     | 8.12     | 0.63 | 667.94  |

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

| Explanatory Variable | Term      | Interpretation                                                                                                                                                                                                                           |
| -------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Research Experience  | r         | More experience is positively associated with a higher chance of admit. This value shows us that an increment of 0.55 standard deviations of Chance of Admit should be added on for every one standard deviation of Research Experience. |
|                      | \[b_{0}\] | Research experience is expected to have an outcome of 0.64 for students who have a predicted score of 0.                                                                                                                                 |
|                      | \[b_{1}\] | Our outcome variable, Research Experience, is expected to increase. An increment of 0.16 to add on for each unit of Research experience.                                                                                                 |
|                      | PRE       | This is the proportion of error explained by the Research model compared to the empty model (0.31).                                                                                                                                      |
| GRE Scores           | r         | Higher GRE Scores is positively associated with a higher chance of admit. This value shows us that an increment of 0.80 standard deviations of Chance of Admit should be added on for every one standard deviation of GRE Score.         |
|                      | \[b_{0}\] | GRE Scores is expected to have an outcome of -2.44 for students who have a predicted score of 0.                                                                                                                                         |
|                      | \[b_{1}\] | Our outcome variable, GRE Score, is expected to increase An increment of 0.01 to add on for each unit of GRE Score.                                                                                                                      |
|                      | PRE       | This is the proportion of error explained by the GRE model compared to the empty model (0.64).                                                                                                                                           |

3.  Which model is the best, according to PRE? Why?

4.  Which model is best, according to the F Ratio? Why?

5.  Which model explains more variation, per df used? Why?

6.  Obtain predictions for the following respondents for each of the
    explanatory variables below. Based on your analyses, who do you
    believe has the best chance of getting admitted? Why?

| Explanatory Variable | Respondent \#40 | Respondent \#56 | Respondent \#78 | Respondent \#93 |
| -------------------- | --------------- | --------------- | --------------- | --------------- |
| Research Experience  | 0.64            | 0.64            | 0.64            | 0.64            |
| Undergraduate GPA    | 0.54            | 0.54            | 0.65            | 0.61            |
| GRE Scores           | 0.63            | 0.76            | 0.57            | 0.54            |
| TOEFL Scores         | 0.74            | 0.64            | 0.57            | 0.55            |

7.  For the best model that predicts the outcome variable per df used
    (see Q5), edit the following equation (see GLM notation) with
    inputted values that you would use to make predictions with.

\[Y_{i} = b_{0} + b_{1}X_{i} + e_{i}\]

Extra Credit: Input the values (those subscripted by \(i\) in the model
equation) for respondent \(i\) = 100 into the equation you edited in Q7.

\[Y_{i} = b_{0} + b_{1}X_{i} + e_{i}\]
