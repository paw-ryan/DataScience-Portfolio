**ANA 610 Homework \#2**

**Task \#1 (90 pts):**

In examining the Donor dataset (s\_pml\_donor\_hw\_v2), you realize that
there are no dates. Yet you know that you will be asked to generate
reports based on the following dates: date when individual was entered
into the file (“origination date”), date of an individual’s first gift
(“first gift date”; and date of an individual’s last gift (“last gift
date”).

1.  Using SAS, create these fields on the dataset, giving them a format
    of MM/DD/YYYY (HINT – assume you are conducting this analysis on
    August 1, 1998 and each month has, on average, 30.4 days)).
    
    1.  What is the date of the last file entry?
    
    2.  What is the date of the first gift?
    
    3.  What is the date of the last gift?
    
    4.  What is median length of time (in months) between the first and
        last gift?

2.  Using SAS, create 3 new fields, showing the YEAR (in YYYY format)
    for last file entry, first gift and last gift.
    
    1.  In which year were the fewest number of individuals added to the
        file?
    
    2.  Which year had the lowest average LAST\_GIFT\_AMT?
    
    3.  Over the years, what has been the trend in the number of people
        donating (use LAST\_GIFT\_AMT)?
    
    4.  In which STATE and YEAR was the average LAST\_GIFT\_AMT $17.963?

3.  Using PROC SGPLOT,
    
    1.  create and show the boxplot for the date when an individual was
        first entered into the file (origination date)
    
    2.  From this boxplot, in years, what is the IQR?
    
    3.  From this boxplot, what is the approximate median origination
        date in years?
    
    4.  From this boxplot, what can you conclude about the skewness of
        the distribution of origination date?

4.  Using PROC UNIVARIATE,
    
    1.  Calculate the mean and median origination date in years from the
        “Basic Statistical Measures” output table. (Hint: use 365.25 to
        convert days into years.)
    
    2.  Calculate the IQR from the “Quantiles” output table.
    
    3.  Do your calculated median and IQR match what you found above in
        \#3? Explain
    
    4.  Does the Skewness number produced by PROC UNIVARIATE match your
        conclusion on skewness from the boxplot? Explain

5.  Using Tableau, create a bar chart showing the average
    LIFETIME\_AVG\_GIFT\_AMT for female vs. male donors. Which gender
    has the higher average LIFETIME\_AVG\_GIFT\_AMT? Label your bar
    charts to show these average values.

Continuing our analysis of the Donor dataset, refer to “Data Dictionary
– Donor.pdf” for data field definitions and your data audit performed
in HW \#1.

**Task \#2 (135 pts):**

1.  DONOR\_AGE probably is an important variable in explaining whether
    an individual donated. However, it appears to have many missing
    values.
    
    1.  Should these records be removed from the modeling dataset? Why
        or why not?
    
    2.  Using SAS, perform a **median-value imputation**, a
        **median-value segmentation imputation** using 12 groups of
        MEDIAN\_HOUSHOLD\_INCOME, a **hot-deck imputation** using as
        additional variables MEDIAN\_HOUSEHOLD\_INCOME,
        MEDIAN\_HOME\_VALUE and MONTHS\_SINCE\_ORIGIN, and a
        **stochastic regression imputation** using the same additional
        variables (as used for hot-deck) as regressors.
        
        1.  Report the findings of your imputations in the following
            table (report out to 3 decimal places):

| **Technique**             | **Seed value** | **Mean** | **Median** | **Mode** | **STD** |
| ------------------------- | -------------- | -------- | ---------- | -------- | ------- |
| Observed values           | N/A            |          |            |          |         |
| Median-value              | N/A            |          |            |          |         |
| Median-value segmentation | N/A            |          |            |          |         |
| Hot-deck                  | 12345          |          |            |          |         |
| Stochastic regression     | 12345          |          |            |          |         |

2.  For each imputation, show the “overlaid histogram” produced by PROC
    SGPLOT (imputed variable vs. observed variable). Make sure that the
    variable labels used by SGPLOT clearly differentiate between the
    observed and imputed variables. Use binwidth = 5 and transparency =
    .5.

<!-- end list -->

3.  Based on the 4 imputations, which one do you recommend be used?
    Explain.

4.  What should you always do when you impute missing values regardless
    of the technique? Explain.

<!-- end list -->

2.  Imputing missing values for categorical variables, such as
    WEALTH\_RATING, is not necessarily as straight forward as for
    continuous variables.
    
    1.  Using SAS, replace the missing values in WEALTH\_RATING with the
        mode value and show the resulting:
        
        1.  “overlaid histogram” produced by PROC SGPLOT (imputed
            variable vs. observed variable). Make sure that the variable
            labels used by SGPLOT clearly differentiate between the
            observed and imputed variables. Use binwidth = 1 and
            transparency = .5.
        
        2.  frequency of categories using PROC FREQ, both observed and
            imputes values.
    
    2.  Based on your SGPLOT histogram, would you recommend mode-value
        imputation for WEALTH\_RATING? Explain.
    
    3.  Show SAS code for a simple alternative for dealing with
        categorical variable missing values.

> **NOTE – WEALTH\_RATING is already machine numeric. So, you do NOT
> need to create a numeric version as shown in the lecture slides and
> can proceed directly to the mode calculation and imputation stages.**

**Extra Credit (20 pts)**

Variables with extreme or non-normal distributions make hypothesis
testing difficult and can adversely affect model fit, depending on the
algorithm employed.

1.  Is the distribution of the variable LIFETIME\_GIFT\_AMOUNT extreme?
    Explain. Upon what statistic are you basing your analysis?

2.  If it is extreme, identify the single transformation which yields
    the lowest (absolute value) skewness statistic (try square, square
    root, inverse, inverse of square root, inverse of square and log).
    Show the before and after histogram from PROC UNIVARIATE as well as
    the before and after skewness statistic.

3.  Using Tableau and Tableau’s default bin size:
    
    1.  create and show histograms for LIFETIME\_GIFT\_AMOUNT;
    
    2.  create the appropriate transformation used above. Show the
        histogram for this transformed field next to the untransformed
        histogram.

**Homework deliverables:**

  - Tasks 1 – 2 plus extra credit:
    
      - separate Word doc with your analysis and discussion, including
        all tables and charts
    
      - SAS program (as a .sas file) with all code used for Tasks 1 – 2
        plus extra credit
