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

**Task \#2 (20 pts) (SLIDES 1c-24):**

1.  Deduplicate your modeling dataset:
    
    1.  Show your SAS code
    
    2.  Show the before and after observation (row) count

2.  **Using your deduplicated dataset**, create two variables, one for
    AGE, employee age (in years), and one for TENURE, the length of time
    the employee has been with the company (in years). Assume on average
    each year has 365.25 days. Create AGE and TENURE for **all**
    employees in the dataset. **HINT**: how should TENURE be defined for
    those who left the company? Show your SAS code.

3.  Using PROC UNIVARIATE, check AGE and TENURE for integrity issues.
    Specifically check for (a) missing values; (b) extreme values; and
    (c) extreme distribution. Discuss your findings. Show the relevant
    PROC UNIVARIATE charts and tables.

4.  **Using your deduplicated dataset**, create a target variable,
    ATT\_Q, which takes on a value of 1 if an employee took the survey
    and voluntarily attritioned; or 0 if the employee took the survey
    and did not attrition. Show the relevant SAS output from PROC FREQ
    which shows how many employees fall in each segment.

**Task \#3 (80 pts) (SLIDES 4a-30):**

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

QUESTION: EQUAL HEIGHT = pseudo\_quantile? EQUAL WIDTH =
~~pseudo\_quantile?~~

| **Binning Type** |                    | **Number of Bins** | **Number of Bins which Pass Threshold** | **Variable-level Information Value (IV)** |
| ---------------- | ------------------ | ------------------ | --------------------------------------- | ----------------------------------------- |
| Equal Height     | Starting bin count |                    |                                         |                                           |
|                  | Final bin count    |                    |                                         |                                           |
|                  |                    |                    |                                         |                                           |
| Equal Width      | Starting bin count |                    |                                         |                                           |
|                  | Final bin count    |                    |                                         |                                           |

2.  For each variable AGE and Tenure, support your final bin count by
    showing the relevant PROC HPBIN output which displays the counts by
    bin/segment.

3.  For each variable AGE and TENURE, explain, if you had to pick one
    type of binning, which binning type (equal height or equal width)
    should be selected for your predictive model of attrition. Focus on
    the variable-level IV to support your selection.

4.  For each variable AGE and TENURE, create dummy variables for each
    bin for your selected binning type. The dummy variable names should
    show the relevant bin ranges. Using PROC MEANS and PROC TRANSPOSE,
    produce a “tall and skinny” output table for each variable which
    shows the bin dummy variables as rows with the sum for each bin by
    target variable segment as columns (so, N rows by 3 columns). Check
    that for each bin/segment the threshold is met and that the sum for
    each bin matches the output from your final PROC HPBIN run.

**Task \#4 (20 pts) (SLIDES 4b):**

Using PROC CORR and the bin dummy variables your created above for AGE
and TENURE:

1.  Identify which employee AGE range is most likely to attrition.
    Support your answer with output from PROC CORR.

2.  Identify which employee TENURE range is most likely to attrition.
    Support your answer with output from PROC CORR.

**Extra Credit (10 pts)**

There are 6 obvious extreme values in the variable hire\_dt. Can you
find them? Explain your logic and provide a table showing
employee\_number and hire\_dt for these 6 “outliers.”

**Homework deliverables:**

**Task \#1**

  - Neatly formatted, data audit report (see template) – Word doc

  - Merged SAS datafile (download from SAS Studio)

**Task \#2**

  - An additional Word doc with your analysis and discussion, including
    all tables and charts

  - A SAS program with all code used for this assignment (both Task 1
    and 2)
