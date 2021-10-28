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
<td>&gt;= 48</td>
<td>196</td>
<td>1.01%</td>
</tr>
<tr class="even">
<td>IQR</td>
<td>3*IQR</td>
<td>&gt;= 45</td>
<td>237</td>
<td>1.22%</td>
</tr>
<tr class="odd">
<td>Clustering</td>
<td>pmin=.006</td>
<td>&gt;= 110</td>
<td><p>36 extremes total</p>
<p>13 extremes with count of 1</p></td>
<td><p>0.19%</p>
<p>0.07%</p></td>
</tr>
</tbody>
</table>

2.  In a written discussion, discuss (a) whether there are any extreme
    values (i.e. what single cutoff value do you recommend why); and (b)
    if so, recommend what should be done about them.

<!-- end list -->

1.  **There are potential extreme values for lifetime\_gift\_range
    ranging from \>= 45 to \>= 110. Lifetime\_gift\_range is defined as
    the maximum gift amount minus the minimum gift amount between 1976
    (first gift date) - 1998 (last gift date), which is 22 years.
    Clustering has a cutoff value of \>= 110, which is much higher
    cutoff value and counts 36 extreme values. 1-99% of all the values
    range between 0-48, and the Top/Bottom approach demonstrates this
    with a cutoff value of \>= 48.**

> **However, this dataset spans for 22 years, so it’s reasonable to say
> that a donor’s lifetime donation could range higher, since the
> timeline for this dataset is large. According LIFETIME\_GIFT\_COUNT,
> donor’s donate, on average, 8 times in this dataset.**
> 
> ![Table Description automatically generated](media/image1.png)
> 
> **According to LIFETIME\_AVG\_GIFT\_AMT, donor’s donate, on average,
> 11.2 every donation in this dataset.**
> 
> ![Table Description automatically generated](media/image2.png)
> 
> **So if donor’s donate, on average, 8 times multiplied by 11.2 (how
> much they donate on average), it’s possible that 89.6 (8 x 11.2 =
> 89.6) may not be that extreme since this dataset spans 22 years.
> Therefore, in order to model this sample to become more representative
> of the data, I recommend to have a cutoff value of \>= 90.**

2.  **If we have a cutoff value at \>= 90, I would recommend to
    implement a capping rule. I would create a new field called
    “outlier\_lifetime\_gift\_range” and flag values with a “1” if it
    exceeds \>= 90.**

> ![](media/image3.png)
> 
> **Based on that analysis, I can exclude or include suspected extreme
> values to see its effect.**

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

**Yes, my findings in Tableau confirms my findings in SAS; however
Tableau was able to get the same cutoff value with a smaller amount of
clusters. Tableau created the clusters and identified the same cutoff
value (110) (see yellow highlight in tables below) with 50 clusters
(like our SAS code). It was also able to produce the same 110 cutoff
value with a minimum of 35 clusters too (see table below).**

**Inputs for Clustering**

| **Variables:**       | Sum of Lifetime Gift Range |
| -------------------- | -------------------------- |
| **Level of Detail:** | Control Number             |
| **Scaling:**         | Normalized                 |
|                      |                            |

**Summary Diagnostics**

| **Number of Clusters:**           | 50        |
| --------------------------------- | --------- |
| **Number of Points:**             | 19372     |
| **Between-group Sum of Squares:** | 4.4444    |
| **Within-group Sum of Squares:**  | 0.0089706 |
| **Total Sum of Squares:**         | 4.4533    |
|                                   |           |

|                   |  |                     |  | **Centers**                    |  |  |  |  |
| ----------------- |  | ------------------- |  | ------------------------------ |  |  |  |  |
| **Clusters**      |  | **Number of Items** |  | **Sum of Lifetime Gift Range** |  |  |  |  |
| **Cluster 1**     |  | 3394                |  | 4.8881                         |  |  |  |  |
| **Cluster 2**     |  | 2623                |  | 0.28219                        |  |  |  |  |
| **Cluster 3**     |  | 3879                |  | 9.9852                         |  |  |  |  |
| **Cluster 4**     |  | 877                 |  | 16.988                         |  |  |  |  |
| **Cluster 5**     |  | 2206                |  | 14.883                         |  |  |  |  |
| **Cluster 6**     |  | 1490                |  | 20.4                           |  |  |  |  |
| **Cluster 7**     |  | 2081                |  | 7.3855                         |  |  |  |  |
| **Cluster 8**     |  | 1415                |  | 12.313                         |  |  |  |  |
| **Cluster 9**     |  | 124                 |  | 39.943                         |  |  |  |  |
| **Cluster 10**    |  | 106                 |  | 35.412                         |  |  |  |  |
| **Cluster 11**    |  | 23                  |  | 75.087                         |  |  |  |  |
| **Cluster 12**    |  | 563                 |  | 24.82                          |  |  |  |  |
| **Cluster 13**    |  | 172                 |  | 29.569                         |  |  |  |  |
| **Cluster 14**    |  | 17                  |  | 97.647                         |  |  |  |  |
| **Cluster 15**    |  | 140                 |  | 44.91                          |  |  |  |  |
| **Cluster 16**    |  | 11                  |  | 55.0                           |  |  |  |  |
| **Cluster 17**    |  | 45                  |  | 47.233                         |  |  |  |  |
| **Cluster 18**    |  | 26                  |  | 50.038                         |  |  |  |  |
| **Cluster 19**    |  | 71                  |  | 31.76                          |  |  |  |  |
| **Cluster 20**    |  | 18                  |  | 95.0                           |  |  |  |  |
| **Cluster 21**    |  | 11                  |  | 80.091                         |  |  |  |  |
| **Cluster 22**    |  | 11                  |  | 90.0                           |  |  |  |  |
| **Cluster 23**    |  | 2                   |  | 195.0                          |  |  |  |  |
| **Cluster 24**    |  | 7                   |  | 60.133                         |  |  |  |  |
| **Cluster 25**    |  | 1                   |  | 185.0                          |  |  |  |  |
| **Cluster 26**    |  | 3                   |  | 123.62                         |  |  |  |  |
| **Cluster 27**    |  | 4                   |  | 175.0                          |  |  |  |  |
| **Cluster 28**    |  | 12                  |  | 70.375                         |  |  |  |  |
| **Cluster 29**    |  | 2                   |  | 296.0                          |  |  |  |  |
| **Cluster 30**    |  | 1                   |  | 137.0                          |  |  |  |  |
| **Cluster 31**    |  | 7                   |  | 64.857                         |  |  |  |  |
| **Cluster 32**    |  | 1                   |  | 595.5                          |  |  |  |  |
| **Cluster 33**    |  | 3                   |  | 57.0                           |  |  |  |  |
| **Cluster 34**    |  | 1                   |  | 245.0                          |  |  |  |  |
| **Cluster 35**    |  | 1                   |  | 191.0                          |  |  |  |  |
| **Cluster 36**    |  | 4                   |  | 85.75                          |  |  |  |  |
| **Cluster 37**    |  | 3                   |  | 129.33                         |  |  |  |  |
| **Cluster 38**    |  | 3                   |  | 145.0                          |  |  |  |  |
| **Cluster 39**    |  | 2                   |  | 199.0                          |  |  |  |  |
| **Cluster 40**    |  | 2                   |  | 215.0                          |  |  |  |  |
| **Cluster 41**    |  | 1                   |  | 160.0                          |  |  |  |  |
| **Cluster 42**    |  | 1                   |  | 225.0                          |  |  |  |  |
| **Cluster 43**    |  | 1                   |  | 110.0                          |  |  |  |  |
| **Cluster 44**    |  | 1                   |  | 240.0                          |  |  |  |  |
| **Cluster 45**    |  | 1                   |  | 490.0                          |  |  |  |  |
| **Cluster 46**    |  | 1                   |  | 115.0                          |  |  |  |  |
| **Cluster 47**    |  | 1                   |  | 997.0                          |  |  |  |  |
| **Cluster 48**    |  | 1                   |  | 248.0                          |  |  |  |  |
| **Cluster 49**    |  | 1                   |  | 165.0                          |  |  |  |  |
| **Cluster 50**    |  | 1                   |  | 150.0                          |  |  |  |  |
| **Not Clustered** |  | 0                   |  |                                |  |  |  |  |

**LIFETIME\_GIFT\_RANGE - 50 Clusters**  
![Chart Description automatically generated](media/image4.png)

**Inputs for Clustering**

| **Variables:**       | Sum of Lifetime Gift Range |
| -------------------- | -------------------------- |
| **Level of Detail:** | Control Number             |
| **Scaling:**         | Normalized                 |
|                      |                            |

**Summary Diagnostics**

| **Number of Clusters:**           | 35       |
| --------------------------------- | -------- |
| **Number of Points:**             | 19372    |
| **Between-group Sum of Squares:** | 4.3942   |
| **Within-group Sum of Squares:**  | 0.059143 |
| **Total Sum of Squares:**         | 4.4533   |
|                                   |          |

|                   |  |                     |  | **Centers**                    |  |  |  |  |
| ----------------- |  | ------------------- |  | ------------------------------ |  |  |  |  |
| **Clusters**      |  | **Number of Items** |  | **Sum of Lifetime Gift Range** |  |  |  |  |
| **Cluster 1**     |  | 5109                |  | 6.0474                         |  |  |  |  |
| **Cluster 2**     |  | 2995                |  | 0.61976                        |  |  |  |  |
| **Cluster 3**     |  | 7489                |  | 11.865                         |  |  |  |  |
| **Cluster 4**     |  | 2370                |  | 19.126                         |  |  |  |  |
| **Cluster 5**     |  | 155                 |  | 39.301                         |  |  |  |  |
| **Cluster 6**     |  | 291                 |  | 31.615                         |  |  |  |  |
| **Cluster 7**     |  | 34                  |  | 76.706                         |  |  |  |  |
| **Cluster 8**     |  | 592                 |  | 24.957                         |  |  |  |  |
| **Cluster 9**     |  | 35                  |  | 96.286                         |  |  |  |  |
| **Cluster 10**    |  | 140                 |  | 44.91                          |  |  |  |  |
| **Cluster 11**    |  | 20                  |  | 56.746                         |  |  |  |  |
| **Cluster 12**    |  | 71                  |  | 48.261                         |  |  |  |  |
| **Cluster 13**    |  | 15                  |  | 88.867                         |  |  |  |  |
| **Cluster 14**    |  | 4                   |  | 197.0                          |  |  |  |  |
| **Cluster 15**    |  | 1                   |  | 185.0                          |  |  |  |  |
| **Cluster 16**    |  | 3                   |  | 123.62                         |  |  |  |  |
| **Cluster 17**    |  | 4                   |  | 175.0                          |  |  |  |  |
| **Cluster 18**    |  | 12                  |  | 70.375                         |  |  |  |  |
| **Cluster 19**    |  | 2                   |  | 296.0                          |  |  |  |  |
| **Cluster 20**    |  | 1                   |  | 137.0                          |  |  |  |  |
| **Cluster 21**    |  | 8                   |  | 64.5                           |  |  |  |  |
| **Cluster 22**    |  | 1                   |  | 595.5                          |  |  |  |  |
| **Cluster 23**    |  | 2                   |  | 246.5                          |  |  |  |  |
| **Cluster 24**    |  | 1                   |  | 191.0                          |  |  |  |  |
| **Cluster 25**    |  | 3                   |  | 129.33                         |  |  |  |  |
| **Cluster 26**    |  | 4                   |  | 146.25                         |  |  |  |  |
| **Cluster 27**    |  | 2                   |  | 215.0                          |  |  |  |  |
| **Cluster 28**    |  | 1                   |  | 160.0                          |  |  |  |  |
| **Cluster 29**    |  | 1                   |  | 225.0                          |  |  |  |  |
| **Cluster 30**    |  | 1                   |  | 110.0                          |  |  |  |  |
| **Cluster 31**    |  | 1                   |  | 240.0                          |  |  |  |  |
| **Cluster 32**    |  | 1                   |  | 490.0                          |  |  |  |  |
| **Cluster 33**    |  | 1                   |  | 115.0                          |  |  |  |  |
| **Cluster 34**    |  | 1                   |  | 997.0                          |  |  |  |  |
| **Cluster 35**    |  | 1                   |  | 165.0                          |  |  |  |  |
| **Not Clustered** |  | 0                   |  |                                |  |  |  |  |

**LIFETIME\_GIFT\_RANGE - 35 Clusters**

![Graphical user interface, chart, application, scatter chart
Description automatically generated](media/image5.png)

**Task \#2 (26 pts):**

1.  Calculate the cardinality ratio for DONOR\_GENDER, URBANICITY and
    RECENCY\_STATUS\_ 96NK.

> **DONOR\_GENDER: 0.02%**
> 
> **URBANICITY: 0.03%**
> 
> **RECENCY\_STATUS\_ 96NK: 0.03%**

2.  Using non-macro code, show your SAS code for how you would recode
    DONOR\_GENDER, URBANICITY, and RECENCY\_STATUS\_ 96NK into “dummy”
    variables.

> ![A picture containing graphical user interface Description
> automatically generated](media/image6.png)

3.  Run PROC MEANS, show the output table including NMISS, MIN, MEAN,
    MAX and SUM.

> **DONOR\_GENDER**
> 
> ![Table Description automatically generated](media/image7.png)
> 
> **URBANICITY**
> 
> ![Table Description automatically generated](media/image8.png)
> 
> **RECENCY\_STATUS\_ 96NK**

![Table Description automatically generated](media/image9.png)

4.  Does the SUM for each of your dummy variables equals what you found
    in your data audit report? Discuss and support by including the
    relevant tables (or portions of) from your audit report.

> **Yes, the sum of the dummy variables match what I found in the data
> audit using PROC FREQ (see tables below). PROC FREQ shows us the
> frequency of each category in our DONOR\_GENDER, URBANICITY, and
> RECENCY\_STATUS\_96NK variables. The SUM for each of my dummy
> variables match the Frequency generated using PROC FREQ.**
> 
> ![Table Description automatically generated](media/image10.png)![Table
> Description automatically generated](media/image11.png)

5.  If all we are after is SUM, why is it useful to also show and review
    NMISS, MIN, MEAN and MAX in PROC MEANS? Explain what each statistic
    can tell you specifically <span class="underline">about your dummy
    variables</span>.

> **It is useful to show and review the NMISS, MIN, MEAN, and MAX in
> PROC MEANS because it ultimately helps us determine if the dummy
> variable is correct. NMISS value of 0 shows that there are no missing
> values and is an indicator that SAS created our dummy variable. MIN
> value of 0 and a MAX value of 1 makes sense because our dummy
> variables are either coded with a “0” or a “1” to create a flag for
> us. A “1” is flagged if there is an instance of a specific category,
> and a “0” is flagged if there is not. The MEAN shows us the percentage
> of that category within the variable. For example, for DONOR\_GENDER,
> our mean for Females is “0.53”, which is correlated to 53% of the
> DONOR\_GENDER values are Female.**

**Task \#3 (65 pts):**

1.  To avoid overfitting issues, threshold coding can result in fewer
    dummy variables.
    
    1.  Show your SAS code for how you would recode RECENT\_STAR\_STATUS
        into dummy variables considering a threshold value of 30.

![Graphical user interface, text, application, email Description
automatically generated](media/image12.png)

2.  Execute your code, run PROC MEANS and show the resulting output
    table including NMISS, MIN, MEAN, MAX and SUM. Check and show that
    SUM indeed is at least 30 for each dummy variable that passes the
    threshold test.

> **The resulting output table successfully shows that the SUM for each
> dummy variable is at least 30. The “Before” table shows the frequency
> before the 30 minimum of recent\_star\_status. The “After” table shows
> after when I applied the Threshold dummy variable coding of a minimum
> of 30. Dummy variables 3, 10, 16-23 did not meet the 30 minimum
> requirement, and were separated to “Other” (rstar\_oth).**
> 
> **Before:**
> 
> ![Table Description automatically generated](media/image13.png)
> 
> **After:**
> 
> ![Table Description automatically generated](media/image14.png)![Table
> Description automatically generated](media/image15.png)

2.  Now, the sum for each dummy variable you created in part (1) should
    be at least 30 <span class="underline">for each segment</span> in
    your analysis as well.
    
    1.  Check and show using SAS whether the sum for each dummy variable
        <span class="underline">you created in part (1)</span> is 30 for
        each segment of TARGET\_B, the target variable for a predictive
        model of likelihood to donate.

> **The table generated below shows the SUM for each dummy variable
> created in Part 1 (with a minimum of 30) and how it explains each
> segment of TARGET\_B (“1” showing who is likely to donate during
> campaign and “0” showing who is not likely to donate).**
> 
> ![Table Description automatically generated](media/image16.png)

2.  Now, show your SAS code for how you would then create dummy
    variables <span class="underline">only if</span> the sum is at least
    30 in <span class="underline">both</span> TARGET\_B segments.

> ![Graphical user interface, text Description automatically
> generated](media/image17.png)

3.  Check and show that SUM of your dummies created in 2(b) is indeed at
    least 30 in <span class="underline">each</span> TARGET\_B segment.

> **The resulting output table successfully shows that the SUM for each
> dummy variable is at least 30 for both segments of TARGET\_B (“0” and
> “1”). The “Before” table shows the frequency of recent\_star\_status
> in each segment of TARGET\_B before the 30 minimum threshold. The
> “After” table shows after when I applied the Threshold dummy
> variable coding of a minimum of 30. Dummy variables 3, 7, 9-11, 13-23
> did not meet the 30 minimum requirement for each TARGET\_B segment,
> and were separated to “Other” (rstar\_oth).**
> 
> **Before:**
> 
> ![Table Description automatically generated](media/image18.png)![Table
> Description automatically generated](media/image19.png)
> 
> **After:**
> 
> ![Table Description automatically generated](media/image20.png)![Table
> Description automatically generated](media/image21.png)![Table
> Description automatically generated](media/image22.png)

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

> ![Table Description automatically generated](media/image23.png)

2.  Using your table from (1) and RECENT\_STAR\_STATUS “0” as an
    example, explain where the PROP value comes from for this level.
    Support with relevant tables and include numbers and calculations in
    your answer.

> **In my previous table, for RECENT\_STAR\_STATUS “0”, this shows that
> out of 13239 counts where RECENT\_STAR\_STATUS is “0”, 22.73% of the
> 13239 are associated with our TARGET\_B variable. (3009/13239)\*100 =
> 22.73%**
> 
> **We can code this by:**

![](media/image24.png)

> **Our output tables are:**
> 
> ![Table Description automatically generated](media/image25.png)![Table
> Description automatically generated](media/image26.png)
> 
> **To create this percentage, SAS counts the total of
> RECENT\_STAR\_STATUS (13239 observations) and then counts where
> TARGET\_B is “1” (3009 observations). After we divide these two
> numbers and multiply by 100, we create our PROP value: (3009 /
> 13239)\*100 = 22.73%**
> 
> ![](media/image27.png)

3.  Show the tree chart (dendrogram) and
    <span class="underline">indicate your guess at the number of
    clusters</span>. Circle your guesses on the tree chart. Explain your
    guess.

> **I guess 8 clusters because I counted 8 groups (circled in red below)
> at the bottom of the tree chart (dendrogram). Typically, clusters are
> at the ends of the long tree branches. Visually, it looks like there
> are 8 clusters of RECENT\_STAR\_STATUS branches.**
> 
> ![A picture containing graphical user interface Description
> automatically generated](media/image28.png)

4.  Determine the optimal number of clusters (i.e. what do the
    statistics say?) and show the plot of the log p-value.

> **The optimal number of clusters for RECENT\_STAR\_STATUS is 3. This
> is calculated by the minimum log p-value and can be visually
> represented on the plot at the tip of the “elbow”.**
> 
> ![Chart, scatter chart Description automatically
> generated](media/image29.png)
> 
> ![](media/image30.png)

5.  Show a table with the cluster assignments of the levels for
    RECENT\_STAR\_STATUS. Show <span class="underline">and
    discuss</span> why your guess of the number of clusters did or did
    not differ from the optimal number.

> **The output table below identifies 3 clusters, which is different my
> guess of 8 clusters based off the tree chart. In my tree chart, I was
> visually looking at the very ends of the branches, which is why I
> guessed 8 clusters. SAS grouped 8, 16, 6, 2, 21, 7, 1 as one cluster
> (CL3), while I guessed based off the tree chart that it was three
> separate clusters. SAS grouped 4, 18, 20, 11, 12, 10, 3, 17, 5, 0 as a
> cluster (CL6), while I guessed it was also three separate clusters.
> SAS grouped 15, 9, 14, 13, 19 as a cluster (CL6), while I guessed it
> was two separate clusters.**
> 
> **SAS identified that the RECENT\_STAR\_STATUS category proportions
> are similar, which is why SAS grouped them as a cluster. By clustering
> these categorical variable levels, it minimizes the reduction of the
> overall chi-square and it helps preserve the difference in proportions
> across the clustered levels.**
> 
> ![Table Description automatically generated](media/image31.png)

6.  Show your SAS code for how you would create dummy variables for
    these cluster assignments.

> ![Text Description automatically generated](media/image32.png)

7.  Show a table with the frequencies of the new cluster dummy
    variables.

> **The output table below shows the frequencies for each of the 3
> cluster dummy variables created. The “Sum” is the number of
> occurrences SAS found for each cluster.**
> 
> ![Table Description automatically generated](media/image33.png)

8.  Check and show that for each cluster dummy variable, SUM is at least
    30 in each TARGET\_B segment.

> **The output table below shows that the SUM for each TARGET\_B segment
> (“0” and “1”) is at least 30. The SUM for each cluster is broken down
> if TARGET\_B was met (“1”), or not met (“0”). For TARGET\_B = “1”,
> rstar\_clus3, the 30 minimum was just barely met.**
> 
> ![Table Description automatically generated](media/image34.png)![Table
> Description automatically generated](media/image35.png)

2.  Using Tableau,
    
    1.  Determine the optimal number of clusters for
        RECENT\_STAR\_STATUS, allowing Tableau to set the number
        automatically. Explain what Tableau finds, supporting your
        discussion with Tableau’s “Describe Clusters” data
        <span class="underline">as well as a visual of the cluster
        assignment</span>.

> **According to Tableau, the optimal number of clusters for
> RECENT\_STAR\_STATUS is 3. Tableau groups RECENT\_STAR\_STATUS values
> of 0-8, 10-12, 16-18, and 20 as Cluster 1 (blue dots). Values 9,
> 13-15, and 19 are grouped as Cluster 2 (orange dots). Values 21 and 22
> are grouped as Cluster 3 (red dots).**
> 
> **Tableau’s “Describe Clusters” shows us the numbers of values in each
> Cluster (For example, Cluster 1 has 16 items) and also shows us the
> Centers for my Target B Prop variable, which is the proportion for
> each cluster ratio. Tableau’s “Analysis of Variance” generated a
> F-statistic of 8.889 and a p-value of 0.001729. The higher the
> F-statistic, the higher the statistical significance. A low p-value
> (\< 0.05) also shows statistical significance. This indicates that our
> F-statistic (8.889) and p-value (0.001729) is statistically
> significant.**
> 
> ![Table, timeline Description automatically
> generated](media/image36.png)![A picture containing logo Description
> automatically generated](media/image37.png)![Chart, scatter chart
> Description automatically generated](media/image38.png)

2.  Do the number of clusters differ from what you found above using
    SAS? Discuss and include an analysis of the
    <span class="underline">differences in cluster membership between
    Tableau and SAS</span>.

> **The number of clusters generated from Tableau (3 clusters) is the
> same amount of Clusters generated from SAS (3 Clusters); however the
> grouping of each cluster is different.**
> 
> **In SAS, “CL5” is grouped exactly the same as Tableau (15, 9, 14, 13,
> 19).**
> 
> **In SAS, “CL3” is grouped as: 8, 16, 6, 2, 21, 22, 7, 1. In Tableau,
> groups this as: 0-8, 10-12, 16-18, and 20.**
> 
> **In SAS “CL6” is grouped as: 4, 18, 20, 11, 12, 10, 3, 17, 5, 0. In
> Tableau, groups this as: 21 and 22.**
> 
> **Tableau’s method of using k-means (partitive clustering) to
> partition the data into k clusters is what likely caused the cluster
> membership to be different. It starts with k clusters, then splits and
> reassigns. Tableau finds the k, which maximizes the highest ratio of
> the between-cluster variance to the within-cluster variance.**
> 
> **SAS uses an agglomerative hierarchy, where all the data start in
> their own cluster, the nearest clusters are joined, and the clusters
> are hierarchically nested within clusters at earlier iterations.**
> 
> ![Table Description automatically generated](media/image31.png)

3.  Create a visual showing cluster 1,2,…N on the horizontal axis, PROP
    on the vertical axis and the number of records in each cluster
    indicated by the size of the chart mark.

![Chart, bubble chart Description automatically
generated](media/image39.png)

**Extra Credit (20 pts):**

1.  We can create another variable from our categorical variables by
    enumerating them, using the Weight of Evidence (WOE).

<!-- end list -->

1.  Using the SAS code provided in lecture, calculate the WOE and
    information value (IV) for each level of RECENT\_STAR\_STATUS and
    summarize in a frequency table. Your table should have 8 columns,
    just like the one from lecture: RECENT\_START\_STATUS, \_FREQ\_,
    events, non-events, pct\_events, pct\_non\_events, WOE and the IV.

> ![Table Description automatically generated](media/image40.png)

2.  Your table should show that there are 346 occurrences of
    RECENT\_STAR\_STATUS = 3. Explain, <span class="underline">using
    numbers and calculations</span>, how the values in each of the
    following columns are derived for that row in your table:
    
    1.  “Events”
        
        1.  **“Events” are the number of events where TARGET\_B = 1 when
            RECENT\_STAR\_STAUS = 3. Out of 346 occurrences of when
            RECENT\_STAR\_STATUS = 3, here were 75 events where
            TARGET\_B = 1.**
    
    2.  “Non-events”
        
        1.  **“Non-events” are the number of events where TARGET\_B = 0
            when RECENT\_STAR\_STAUS = 3. Out of 346 occurrences of when
            RECENT\_STAR\_STATUS = 3, here were 271 events where
            TARGET\_B = 1. We can also check this by subtracting the
            total count (346) minus the “Events” (75), which equals our
            “Non-events” (271).**
    
    3.  “Pct\_events”
        
        1.  **“Percent of events” is calculated by the number of
            “Events” divided by the total sum of “Events”. When
            RECENT\_STAR\_STAUS = 3, this is calculated by 75 (Events)
            divided by 4843 (total sum of “Events”), which equals
            0.01549.**
    
    4.  “Pct\_non\_events”
        
        1.  **“Percent of non-events” is calculated by the number of
            “Non-events” divided by the total sum of “Non-Events”.
            When RECENT\_STAR\_STAUS = 3, this is calculated by 271
            (Events) divided by 14529 (total sum of “Non-events”), which
            equals 0.01865.**
    
    5.  WOE
        
        1.  **“Weight of evidence” (WOE) is the measure of the
            separation of TARGET\_B= 1 from TARGET\_B=0 in a particular
            group (RECENT\_STAR\_STATUS).**

> **“Weight of evidence” is calculated by: ln((events/total
> events)/(non-events/total non-events))**
> 
> **When RECENT\_STAR\_STAUS = 3, WOE is calculated by:**
> 
> **ln((75/4843)/(271/14529)) = -0.18602**

6.  IV
    
    1.  **“Information value” (IV) is calculated by: (% events -
        %non-events)\*WOE.**

> **When RECENT\_STAR\_STAUS = 3, IV is calculated by:**
> 
> **(0.01549 – 0.01865) \* -0.18602 = 0.000589**

3.  Also calculate the <span class="underline">variable-level</span>
    Information Value (IV) and interpret as to the likely predictive
    power of this variable in a model explaining TARGET\_B.

> **The variable-level IV can be calculated by taking the sum of all the
> RECENT\_STAR\_STATUS levels. The calculated variable-level IV is
> 0.055087, which is considered a weak predictive power (\< 0.1). This
> shows that RECENT\_STAR\_STATUS is unlikely to be predictive of
> whether donors fit TARGET\_B.**
> 
> ![](media/image41.png)

**Homework deliverables:**

  - Word doc with your analysis and discussion, including all tables and
    charts

  - A SAS program with all code used for this assignment
