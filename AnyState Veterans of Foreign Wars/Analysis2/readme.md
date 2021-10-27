**ANA 610 Homework \#3**

Continuing our analysis of the Donor dataset (s\_pml\_donor\_hw\_v2),
refer to “Data Dictionary – Donor.pdf”” for data field definitions and
your data audit performed for Homework \#1.

**Task \#1 (68 pts):**

Using SAS, check the variable LIFETIME\_GIFT\_RANGE for extreme values
using the following three techniques: top/bottom X%, interquartile
range, and clustering.

1.  Summarize your findings from all 3 methods using the following table
    template. Use the shown Benchmark Parameters.

<table>
<thead>
<tr class="header">
<th><strong>Technique</strong></th>
<th><strong>Benchmark Parameter(s)</strong></th>
<th><strong>Extremes (cutoff value)</strong></th>
<th><p><strong>Extremes</strong></p>
<p><strong>(count)</strong></p></th>
<th><p><strong>Extremes</strong></p>
<p><strong>(% of file)</strong></p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Top/Bottom X%</td>
<td>1%</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>IQR</td>
<td>3*IQR</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Clustering</td>
<td>pmin=.006</td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

2.  In a written discussion, discuss (a) whether there are any extreme
    values (i.e. what single cutoff value do you recommend why); and (b)
    if so, recommend what should be done about them.

**NOTE:** After applying the 3 techniques, you will find extremes values
(we can always find extreme values by varying the benchmark parameter).
But, considering all 3 techniques jointly using the assigned benchmark
parameters, <span class="underline">together with how the variable is
defined</span>, what is your recommended cutoff value for an extreme
value of the variable (and why).

3.  Using Tableau, repeat the clustering approach for identifying
    extreme values for LIFETIME\_GIFT\_RANGE. Do your findings using
    Tableau confirm your findings using SAS? Explain. Support your
    explanation with charts and/or summary tables from Tableau.

**Task \#2 (26 pts):**

1.  Calculate the cardinality ratio for DONOR\_GENDER, URBANICITY and
    RECENCY\_STATUS\_ 96NK.

2.  Using non-macro code, show your SAS code for how you would recode
    DONOR\_GENDER, URBANICITY, and RECENCY\_STATUS\_ 96NK into “dummy”
    variables.

3.  Run PROC MEANS, show the output table including NMISS, MIN, MEAN,
    MAX and SUM.

4.  Does the SUM for each of your dummy variables equals what you found
    in your data audit report? Discuss and support by including the
    relevant tables (or portions of) from your audit report.

5.  If all we are after is SUM, why is it useful to also show and review
    NMISS, MIN, MEAN and MAX in PROC MEANS? Explain what each statistic
    can tell you specifically <span class="underline">about your dummy
    variables</span>.

**Task \#3 (65 pts):**

1.  To avoid overfitting issues, threshold coding can result in fewer
    dummy variables.
    
    1.  Show your SAS code for how you would recode RECENT\_STAR\_STATUS
        into dummy variables considering a threshold value of 30.
    
    2.  Execute your code, run PROC MEANS and show the resulting output
        table including NMISS, MIN, MEAN, MAX and SUM. Check and show
        that SUM indeed is at least 30 for each dummy variable that
        passes the threshold test.

2.  Now, the sum for each dummy variable you created in part (1) should
    be at least 30 <span class="underline">for each segment</span> in
    your analysis as well.
    
    1.  Check and show using SAS whether the sum for each dummy variable
        <span class="underline">you created in part (1)</span> is 30 for
        each segment of TARGET\_B, the target variable for a predictive
        model of likelihood to donate.
    
    2.  Now, show your SAS code for how you would then create dummy
        variables <span class="underline">only if</span> the sum is at
        least 30 in <span class="underline">both</span> TARGET\_B
        segments.
    
    3.  Check and show that SUM of your dummies created in 2(b) is
        indeed at least 30 in <span class="underline">each</span>
        TARGET\_B segment.

*NOTE: SAS arrays should start with “1”. Since RECENT\_STAR\_STATUS
starts with 0 and is a numeric, create RECENT\_STAR\_STATUS\_NUM =
RECENT\_STAR\_STATUS + 1 and use it as your analysis variable.*

**Task \#4 (61 pts):**

Another remedy for sparseness in the levels of categorical variables is
to collapse the levels. Ideally, subject-matter considerations should be
used to collapse levels. This is not always practical in predictive
modeling.

1.  Using PROC CLUSTER and the process presented in lecture, determine
    the optimal number of clusters for RECENT\_STAR\_STATUS and create
    dummy variables for these clusters.
    
    1.  Create and show the table with the RECENT\_STAR\_STATUS level
        proportions (PROP) that will be used in the clustering.
    
    2.  Using your table from (1) and RECENT\_STAR\_STATUS “0” as an
        example, explain where the PROP value comes from for this level.
        Support with relevant tables and include numbers and
        calculations in your answer.
    
    3.  Show the tree chart (dendrogram) and
        <span class="underline">indicate your guess at the number of
        clusters</span>. Circle your guesses on the tree chart. Explain
        your guess.
    
    4.  Determine the optimal number of clusters (i.e. what do the
        statistics say?) and show the plot of the log p-value.
    
    5.  Show a table with the cluster assignments of the levels for
        RECENT\_STAR\_STATUS. Show <span class="underline">and
        discuss</span> why your guess of the number of clusters did or
        did not differ from the optimal number.
    
    6.  Show your SAS code for how you would create dummy variables for
        these cluster assignments.
    
    7.  Show a table with the frequencies of the new cluster dummy
        variables.
    
    8.  Check and show that for each cluster dummy variable, SUM is at
        least 30 in each TARGET\_B segment.

2.  Using Tableau,
    
    1.  Determine the optimal number of clusters for
        RECENT\_STAR\_STATUS, allowing Tableau to set the number
        automatically. Explain what Tableau finds, supporting your
        discussion with Tableau’s “Describe Clusters” data
        <span class="underline">as well as a visual of the cluster
        assignment</span>.
    
    2.  Do the number of clusters differ from what you found above using
        SAS? Discuss and include an analysis of the
        <span class="underline">differences in cluster membership
        between Tableau and SAS</span>.
    
    3.  Create a visual showing cluster 1,2,…N on the horizontal axis,
        PROP on the vertical axis and the number of records in each
        cluster indicated by the size of the chart mark.

**Extra Credit (20 pts):**

1.  We can create another variable from our categorical variables by
    enumerating them, using the Weight of Evidence (WOE).

<!-- end list -->

1.  Using the SAS code provided in lecture, calculate the WOE and
    information value (IV) for each level of RECENT\_STAR\_STATUS and
    summarize in a frequency table. Your table should have 8 columns,
    just like the one from lecture: RECENT\_START\_STATUS, \_FREQ\_,
    events, non-events, pct\_events, pct\_non\_events, WOE and the IV.

2.  Your table should show that there are 346 occurrences of
    RECENT\_STAR\_STATUS = 3. Explain, <span class="underline">using
    numbers and calculations</span>, how the values in each of the
    following columns are derived for that row in your table:
    
    1.  “Events”
    
    2.  “Non-events”
    
    3.  “Pct\_events”
    
    4.  “Pct\_non\_events”
    
    5.  WOE
    
    6.  IV

3.  Also calculate the <span class="underline">variable-level</span>
    Information Value (IV) and interpret as to the likely predictive
    power of this variable in a model explaining TARGET\_B.

**Homework deliverables:**

  - Word doc with your analysis and discussion, including all tables and
    charts

  - A SAS program with all code used for this assignment
