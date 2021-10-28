**ANA 610 Homework \#4**

Fortune Corp, a maker of specialized laboratory equipment for the
pharmaceutical industry, began business in June 1980. Priding itself on
employee job satisfaction, the company is seeking to understand why
employees voluntarily leave the company.

Over the last 3 years, at the request of the SVP of Human Resources, the
HR department has been conducting an employee survey. The SVP wants
enough data collected so that a predictive model of employee voluntary
attrition can be built and tested. The objective is to use such a model
to find current employees who might be thinking of leaving, so proactive
steps can be taken to retain them.

The SVP now thinks there has been enough data collected. So, she has
requested that you, the lead data science team, take over and work your
magic\!

The qualifications for the target sample are having taken the survey.
This sample is broken into two segments:

1.  Employees who voluntarily attritioned (left the company)

2.  Employees who are still with the company

Assume the analysis is taking place June 1, 2018.

The following 5 data files have been created for your use by the IT
department:

  - (csv) Credit Bureau file: fortune\_credit.csv
    
      - FICO score (SVP thinks this might be predictive)

  - (SAS) Accounting file: fortune\_acct
    
      - Payroll data

  - (SAS) Attrition file: fortune\_attrition
    
      - Employees who have left the company over the 2015-2017 period

  - (SAS) HR file fortune\_hr
    
      - Background employee data

  - (SAS) Survey file fortune\_survey
    
      - Data collected from the employee survey

Unfortunately, there is no data-dictionary for these files. But most
fields should be self-explanatory.

The data files are available online at SAS Studio.

**Task \#1 (100 pts):** Generate a data audit report (using the audit
report template) to be shared with both the HR and IT department;
include a check of the available modeling sample size. Assemble all 5
data files into a single, modeling dataset.

**Task \#2 (20 pts):**

1.  Deduplicate your modeling dataset:
    
    1.  Show your SAS code

> ![Graphical user interface, text, application Description
> automatically generated](media/image1.png)

2.  Show the before and after observation (row) count

> **Before:**
> 
> ![A picture containing table Description automatically
> generated](media/image2.png)
> 
> **After (25 duplicate observations identified):**
> 
> ![A picture containing table Description automatically
> generated](media/image3.png)

2.  **Using your deduplicated dataset**, create two variables, one for
    AGE, employee age (in years), and one for TENURE, the length of time
    the employee has been with the company (in years). Assume on average
    each year has 365.25 days. Create AGE and TENURE for **all**
    employees in the dataset. **HINT**: how should TENURE be defined for
    those who left the company? Show your SAS code.

![Text Description automatically generated](media/image4.png)

3.  Using PROC UNIVARIATE, check AGE and TENURE for integrity issues.
    Specifically check for (a) missing values; (b) extreme values; and
    (c) extreme distribution. Discuss your findings. Show the relevant
    PROC UNIVARIATE charts and tables.

<!-- end list -->

1)  **Missing values:**

<table>
<tbody>
<tr class="odd">
<td><p><strong>Age is missing 270 values. This is because the Age variable was created by using “birth_dt” in Task 2, Question 2. Since “birth_dt” already had 270 missing values, Age will also have 270 missing values.</strong></p>
<p><img src="media/image5.png" style="width:2.48301in;height:0.99107in" alt="Table Description automatically generated" /></p></td>
<td><p><strong>Tenure has 0 missing values. This is because I created the Tenure variable using the “depart_dt” and “hire_dt” variables in Task 2, Question 2. Tenure, for an active employee, is defined as the period of time between our analysis date (6/1/2018) and their hire date. Tenure for an inactive employee is defined as the period of time between their depart date and their hire date. Since all employees are covered, Tenure should not have any missing values.</strong></p>
<p><img src="media/image6.png" style="width:2.97917in;height:0.65628in" alt="Table Description automatically generated" /></p></td>
</tr>
</tbody>
</table>

2)  **Extreme values:**

<table>
<tbody>
<tr class="odd">
<td><p><strong>Age:</strong></p>
<p><strong>Using a Top/Bottom approach, the 1-99% of the data falls between 21-60. PROC UNIVARIATE identifies 19 as a low extreme and 61-62 high extreme. Comparing these values to the range of this dataset (19-62), I do not think there are extreme values for the Age variable. This is because the distribution of values are representative of the data.</strong></p>
<p><img src="media/image7.png" style="width:1.33276in;height:2.11291in" alt="A picture containing table Description automatically generated" /><img src="media/image8.png" style="width:1.14685in;height:2.12168in" alt="Table Description automatically generated" /></p></td>
<td><p><strong>Tenure</strong></p>
<p><strong>Using a Top/Bottom approach, the 1-99% of the data falls between 1-31. PROC UNIVARIATE identifies 0 as a low extreme and 38-42 high extreme. The company started in June 1, 1980, so the highest amount of Tenure an employee could have is 38 years (analysis date June 1, 2018). Since the tenure variable was created using hire_dt, any employee data that was hired before June 1, 1980 should be considered outliers (Count: 6 obs).</strong></p>
<p><img src="media/image9.png" style="width:1.5035in;height:2.29895in" alt="Table Description automatically generated" /><img src="media/image10.png" style="width:1.25833in;height:2.35372in" alt="Table Description automatically generated" /></p></td>
</tr>
</tbody>
</table>

3)  **Extreme distribution:**

**Age: The distribution for Age appears to be normal with a low,
positive skewness value (0.421). Since this skewness value is lower than
5, this distribution is not considered extreme.**

![Table Description automatically generated](media/image11.png)

![Chart, histogram Description automatically
generated](media/image12.png)

**Tenure: The distribution for Tenure appears to be skewed right with a
skewness value of (1.682). Since this skewness value is lower than 5,
this distribution is not considered extreme.**

![Table Description automatically generated](media/image13.png)

![Chart, histogram Description automatically
generated](media/image14.png)

4.  **Using your deduplicated dataset**, create a target variable,
    ATT\_Q, which takes on a value of 1 if an employee took the survey
    and voluntarily attritioned; or 0 if the employee took the survey
    and did not attrition. Show the relevant SAS output from PROC FREQ
    which shows how many employees fall in each segment.

> ![Table Description automatically generated](media/image15.png)

**Task \#3 (80 pts):**

> **Note: Use the deduplicated modeling dataset you created in Task
> \#2.**
> 
> Using PROC HPBIN and target-based enumeration,

1.  Fill in the following table template to analyze how many bins are
    appropriate for AGE and TENURE. Start with 10 bins. Then, using a
    threshold of 20 for <span class="underline">each segment</span> of
    the target variable, determine how many bins should be created
    (HINT: 10 is too many). If there are missing values, ignore the bin
    that captures these in your final bin count.

> **For each final bin count, I chose the bin size that yielded the most
> of number of bins that passed the threshold and also the best
> Information Value (IV). Ideally, I want my IV value to be between
> 0.3-0.5 to indicate a strong predictor power. I chose the bolded items
> in the table below for my final bin count.**
> 
> **\< 0.1 = Weak**
> 
> **0.1 - 0.3 = Medium**
> 
> **0.3 - 0.5 = Strong**
> 
> **0.5+ = Suspicious**
> 
> **For the Tenure variable, using the Equal Width binning type, Bins
> 1-10 were tested to see if all bins could meet the 20 segment
> threshold. However, after testing Bins 1-10, no bin size was able to
> have all the bins meet the 20 segment threshold. A bin size of 6
> yielded the most number of bins that passed the threshold and also had
> the best IV value.**

<table>
<thead>
<tr class="header">
<th><strong>Binning Type</strong></th>
<th></th>
<th><strong>Number of Bins</strong></th>
<th><strong>Number of Bins which Pass Threshold</strong></th>
<th><strong>Variable-level Information Value (IV)</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Equal Height</td>
<td>Starting bin count</td>
<td><p>Age: 10</p>
<p>Tenure: 10</p></td>
<td><p>Age: 4</p>
<p>Tenure: 3</p></td>
<td><p>Age: 0.283</p>
<p>Tenure: 0.946</p></td>
</tr>
<tr class="even">
<td></td>
<td>Final bin count</td>
<td><p>Age: 6</p>
<p><strong>Age: 5</strong></p>
<p>Age: 4</p>
<p>Tenure: 3</p>
<p><strong>Tenure: 2</strong></p></td>
<td><p>Age: 6</p>
<p><strong>Age: 5</strong></p>
<p>Age: 4</p>
<p>Tenure: 3</p>
<p><strong>Tenure: 2</strong></p></td>
<td><p>Age: 0.262</p>
<p><strong>Age: 0.265</strong></p>
<p>Age: 0.250</p>
<p>Tenure: 0.567</p>
<p><strong>Tenure: 0.260</strong></p></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>Equal Width</td>
<td>Starting bin count</td>
<td><p>Age: 10</p>
<p>Tenure: 10</p></td>
<td><p>Age: 5</p>
<p>Tenure: 3</p></td>
<td><p>Age: 0.309</p>
<p>Tenure: 0.591</p></td>
</tr>
<tr class="odd">
<td></td>
<td>Final bin count</td>
<td><p><strong>Age: 3</strong></p>
<p>Age: 2</p>
<p>Tenure: 9</p>
<p><strong>Tenure: 6</strong></p>
<p>Tenure: 4</p></td>
<td><p><strong>Age: 3</strong></p>
<p>Age: 2</p>
<p>Tenure: 3</p>
<p><strong>Tenure: 2</strong></p>
<p>Tenure: 1</p></td>
<td><p><strong>Age: 0.217</strong></p>
<p>Age: 0.105</p>
<p>Tenure: 0.581</p>
<p><strong>Tenure: 0.388</strong></p>
<p>Tenure: 0.340</p></td>
</tr>
</tbody>
</table>

2.  For each variable AGE and Tenure, support your final bin count by
    showing the relevant PROC HPBIN output which displays the counts by
    bin/segment.

**Equal Height / Age / Final Bin Count: 5**

![Table Description automatically generated](media/image16.png)

**Equal Height / Tenure / Final Bin Count: 2**

![Graphical user interface, application, Word Description automatically
generated](media/image17.png)

**Equal Width / Age / Final Bin Count: 3**

![Graphical user interface, application, Word Description automatically
generated](media/image18.png)

**Equal Width / Tenure / Final Bin Count: 6**

![Graphical user interface, table Description automatically
generated](media/image19.png)

3.  For each variable AGE and TENURE, explain, if you had to pick one
    type of binning, which binning type (equal height or equal width)
    should be selected for your predictive model of attrition. Focus on
    the variable-level IV to support your selection.

> **I would choose equal height as my binning type for both variables,
> Age and Tenure. In the final bin count, the variable-level IV for Age
> and Tenure is 0.265 and 0.260, respectively. Both of these IV values
> are considered a “Medium” predictive power. Equal height’s “Medium”
> predictive powers were also on the higher side of the “Medium” tier
> (closer to 0.3, which is the beginning of the “Strong” predictive
> tier).**
> 
> **\< 0.1 = Weak**
> 
> **0.1 - 0.3 = Medium**
> 
> **0.3 - 0.5 = Strong**
> 
> **0.5+ = Suspicious**
> 
> **Equal width, in comparison, has a similar predictive power for Age
> and Tenure, and it produced a variable-level IV for Age and Tenure is
> 0.217 and 0.388, respectively. The Age IV value would be a considered
> a “Medium” predictive power and the “Tenure” predictive power would be
> considered a “Strong” predictive power. However, in the final bin
> count for Tenure, all the bins could not cohesively meet the 20
> segment threshold.**

4.  For each variable AGE and TENURE, create dummy variables for each
    bin for your selected binning type. The dummy variable names should
    show the relevant bin ranges. Using PROC MEANS and PROC TRANSPOSE,
    produce a “tall and skinny” output table for each variable which
    shows the bin dummy variables as rows with the sum for each bin by
    target variable segment as columns (so, N rows by 3 columns). Check
    that for each bin/segment the threshold is met and that the sum for
    each bin matches the output from your final PROC HPBIN run.

> **Dummy variables for Age and Tenure was created using equal height
> binning type.**
> 
> **Age (5 bins) and Tenure (2 bins).**
> 
> ![Graphical user interface, text, application Description
> automatically generated](media/image20.png)
> 
> ![Table Description automatically generated](media/image21.png)
> 
> ![Table Description automatically generated](media/image22.png)
> 
> **Transpose - “Tall and skinny”:**
> 
> ![A picture containing timeline Description automatically
> generated](media/image23.png)
> 
> **“Tall and skinny” output – Age**
> 
> ![Table Description automatically generated](media/image24.png)
> 
> **“Tall and skinny” output – Tenure**
> 
> ![Graphical user interface, table Description automatically
> generated](media/image25.png)
> 
> **Check - The frequency of PROC HPBIN matches the sums for each dummy
> variable bin for Age and Tenure. The left side shows the side-by-side
> comparison for Age. The right side shows the side-by-side comparison
> for Tenure.**
> 
> **For the Age variable, during my dummy variable creation, I created a
> bin for the missing Age values (age\_miss\_dum) (270 values). PROC
> HPBIN did not separate a bin for the missing values and it added the
> 270 missing values to the “age \< 31.0013” bin. This explains why “age
> \< 13.0013” in PROC HPBIN has a frequency of 1076, compared to the
> dummy “age \< 13.0013” with a sum of 1346. The 270 value difference is
> the missing values that PROC HPBIN did not have a separate bin for.**

![Table, Word Description automatically
generated](media/image26.png)![Table Description automatically
generated](media/image27.png)

![Table Description automatically generated](media/image21.png)![Table
Description automatically generated](media/image22.png)

**Task \#4 (20 pts):**

Using PROC CORR and the bin dummy variables your created above for AGE
and TENURE:

1.  Identify which employee AGE range is most likely to attrition.
    Support your answer with output from PROC CORR.

> **Ages 1-31 are more likely to attrition. The correlation coefficient
> for the Age 1-31 bin was calculated to be 0.15690, which is the
> highest in comparison to the other bins. However, 0.15690 is still
> considered to be a weak, positive correlation because it’s far from
> 1.0.**
> 
> ![Table Description automatically generated](media/image28.png)![Table
> Description automatically generated](media/image29.png)

2.  Identify which employee TENURE range is most likely to attrition.
    Support your answer with output from PROC CORR.

> **Employees with a Tenure of 7+ years are more likely to attrition.
> The correlation coefficient for the Tenure 7+ bin was calculated to be
> 0.17807, which is the highest in comparison to the other bins.
> However, 0.17807 is still considered to be a weak, positive
> correlation because it’s far from 1.0.**

![Table Description automatically generated](media/image30.png)

**Extra Credit (10 pts)**

There are 6 obvious extreme values in the variable hire\_dt. Can you
find them? Explain your logic and provide a table showing
employee\_number and hire\_dt for these 6 “outliers.”

**Fortune Corp. started its business in June 1980; therefore any hire
date before when the company started are obvious outliers. There are 6
“hire\_dt” dates that are prior to when the company existed.**

**Employee\_no 153573, 211407, 605506, 239944, 601229, and 51481 are the
6 outliers.**

![Table Description automatically generated](media/image31.png)

**Homework deliverables:**

**Task \#1**

  - Neatly formatted, data audit report (see template) – Word doc

  - Merged SAS datafile (download from SAS Studio)

**Task \#2**

  - An additional Word doc with your analysis and discussion, including
    all tables and charts

  - A SAS program with all code used for this assignment (both Task 1
    and 2)
