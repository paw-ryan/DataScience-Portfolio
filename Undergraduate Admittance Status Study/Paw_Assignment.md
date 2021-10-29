The dataset “binary” contains data on the admittance status of 400
undergraduates to a graduate program at a select postgraduate
institution. In addition to the admittance status, data on the ranking
of the undergraduate school of the applicant is provided (1 to 4 with 1
= best). Also provided is the applicants GRE score and their GPA.

1)  **Using a contingency table analysis, determine whether there is an
    overall association between admittance status (outcome) and the rank
    of the undergraduate school (exposure).** **Which test should you
    use in this case? Explain.**

> **data** admit; set sasdata.binary; **run**;
> 
> **proc** **freq** data=admit;
> 
> tables rank\*admit / chisq norow nocol nopercent; **run**;

![](media/image1.png)

The Pearson chi-square statistic *X<sup>2</sup>* exceeds the 99%
critical value of 13.277 allowing us to reject the null hypothesis of
there being no association between RANK and ADMIT at a high level of
confidence.

However, in this case, both the rows and columns are ordinally measured.
In such cases, a more powerful test is the **Mantel-Haenzel**
correlation statistic, ***M<sup>2</sup>***. It is more powerful because
it requires only 1 dof, not the 3 in this case. So, if using
*X<sup>2</sup>* implies the H<sub>0</sub> cannot be rejected, using
*M<sup>2</sup>* may indicate there is enough evidence to reject the
H<sub>0</sub> of no association.

Using SAS, *M<sup>2</sup>* is obtained by using the CMH option to the
TABLES statement:

> **proc** **freq** data=admit;
> 
> tables rank\*admit / chisq norow nocol nopercent cmh;
> 
> **run**;

![](media/image2.png)

*M<sup>2</sup>* is given by the “Nonzero Correlation” which also
indicates that the H<sub>0</sub> of no association can be rejected. So,
in this case, both *X<sup>2</sup>* and *M<sup>2</sup>* yield the same
answer…but it may not always be the case.

> The eagle-eyed reader will see that the Mantel-Haenszel Chi-Square
> statistic produced by the CHISQ option matches the Nonzero Correlation
> CMH statistic produced by the CMH option. These should be the same
> when both the row and column variables are ordinally measured.
> 
> Finally, plotting the frequency data as a bar chart reveals obvious
> differences across the ADMIT categories, revealing a “trend”:
> 
> **proc** **freq** data=admit;
> 
> tables rank\*admit / chisq norow nocol nopercent cmh
> 
> plots=freqplot(groupby=column twoway=stacked scale=grouppct);
> 
> **run**;
> 
> ![](media/image3.png)

2)  **Calculate how much greater (?) are the odds of admittance having
    attended an undergraduate school with a ranking of “1” vs a ranking
    of “4”. Do the same for a rank of 2 vs 4 and 3 vs 4.**

Based on the contingency table produced in \#1, we can calculate the
odds and odds ratios as follows:

| **Variable** | **Odds**        | **Odds Ratio Relative to RANK = 4** |
| ------------ | --------------- | ----------------------------------- |
| RANK 1       | \=33/28 = 1.179 | \=1.179/0.218 = **5.408**           |
| RANK 2       | \=54/97 = 0.557 | \= 0.557/0.218 = **2.555**          |
| RANK 3       | \=28/93 = 0.301 | \= 0.301/0.218 = **1.381**          |
| RANK 4       | \=12/55 = 0.218 | \---------                          |

So, the odds of admittance having graduated from a school with a \#1
ranking are **5.4** times greater than having graduated from a school
ranked \#4. Likewise, the odds of admittance having graduated from a
school with a \#2 and \#3 ranking are **2.6** and **1.4** times greater
than having graduated from a school ranked \#4.

And, yes, the odds are all “greater” since the odds ratios are all \> 1.

3)  **Using PROC LOGISTIC, estimate the model admit = f(rank).
    Specifically, use the following:**

> **proc** **logistic** data=admit descending;
> 
> class rank / param=ref;
> 
> model admit = rank;
> 
> **run**;

The relevant output is shown below:

![](media/image4.png)

1.  **What does the DESCENDING option do?**

> This option orders the dependent variable from 1 to 0 and makes
> interpretation of the coefficient signs easier. Specifically, β \> 0
> means the variable is positively related to being admitted; β \< 0
> means the variable is negatively related.

2.  **As a group, is the variable RANK statistically significant?
    Explain.**

> The CLASS statement tells SAS to include n-1 categories of the CLASS
> variable in the model (in this case RANK 1,2 and 3). So, we can see
> the statistical association for each category and admittance. To see
> if the variable RANK overall (across all categories) is associated
> with admittance, we look at the table Type 3 Analysis of Effects. Here
> we see that RANK is indeed statistically associated with admittance at
> a high level of confidence (i.e. we can reject the null hypothesis of
> no association).

3.  **Interpret the coefficient on RANK 2.**

> The β on RANK 2 is 0.9367. Because we used a CLASS statement with the
> param=ref option, we are setting the reference category (by default =
> RANK = 4). Taking exp(0.9367) yields an OR of 2.552 which is the OR
> relative to RANK 4 as was saw above.
> 
> For more on the param=ref statement:
> <https://stats.idre.ucla.edu/sas/faq/in-proc-logistic-why-arent-the-coefficients-consistent-with-the-odds-ratios/>

4.  **Compare the odds ratios you calculated in \#2 with those produced
    by PROC LOGISTIC. Any differences?**

> Except for rounding, the OR are the same. And they should be since we
> set the reference category.

5.  **How precise is the estimated OR for RANK 1 vs. 4 compared to RANK
    2 vs. 4 and RANK 3 vs. 4? Explain.**

> The 95% CI on RANK 1 vs. 4 is much wider than that for RANK 2 and RANK
> 3. Although the point estimate is 4.718, the lower bound is 2.080 and
> the upper bound is 10.701, a range of 8.621. The CI for RANK 2, for
> example, is much narrower (3.757) suggesting a more precise point
> estimate for RANK 2 compared with that for RANK 1.

4)  **Add the control variables GRE and GPA to your model:**
    
    1.  **What is your new model?**

> ADMIT = f(RANK (1,2,3,4), GRE, GPA)

2.  **Rerun PROC LOGISTIC adding these two control variables**

> **proc** **logistic** data=admit descending;
> 
> class rank / param=ref;
> 
> model admit = gre rank gpa;
> 
> oddsratio gre / cl=wald; /\* yields cool CI charts \*/
> 
> **run**;
> 
> ![](media/image5.png)

3.  **Are GRE and GPA statistically related to admittance status?
    Explain.**

> Based on the Wald chi-square statistics, both GRE and GPA are
> statistically related to admittance at the 95% confidence level. That
> is, we can reject the null hypothesis that there is no association
> with admittance (i.e., that β = 0).

4.  **Compare the odds ratios for RANK with those produced by PROC
    LOGISTIC in \#2. Any differences? If so, why?**

> We can see that by adding control variables, the ORs have been reduced
> with the RANK 1 OR relative to RANK 4 being reduced the most (13%).
> Adding control variables accounts for other variables that can affect
> admittance. To some extent by not including these, RANK was being
> attributed to having more of an effect on admittance than it really
> has. These ORs are called “adjusted” ORs.

| **Variable** | **No Control** | **With Control** |
| ------------ | -------------- | ---------------- |
| RANK 1       | 5.402          | 4.718            |
| RANK 2       | 2.552          | 2.401            |
| RANK 3       | 1.380          | 1.235            |
| RANK 4       | \-----         | \-----           |

5.  **Interpret the coefficient on GPA.**

> The β on GPA is 0.8040. Thus, for every 1-point increase in GPA, the
> log odds of admittance increase by 0.8040. Taking (exp(0.8040)-1)\*100
> leads us to conclude that every 1-point increase in GPA is associated
> with a 123% increase in the odds of admittance.

6.  **What is more important, GRE or GPA? Explain.**

> The β on GPA is 0.8040 and β on GRE is 0.0023. Both β’s differ
> statistically from 0 at the 95% level of confidence. But
> **practically**, GRE has very little association with admittance. We
> can see this by looking at the estimated odds ratio, which is
> calculated relative to the average GRE score. The OR is essentially 1.
> The ODDSRATIO statement produces this cool CI chart which supports
> this conclusion:
> 
> ![](media/image6.png)
> 
> ![](media/image7.png)

5)  **Using the model estimated in \#4 above, explain what each of the
    following tell us about how well the model fits the data:**
    
    1.  **Log likelihood/AIC**

> Answers the question, “Is this model better than some other model?”.
> There is no H<sub>0</sub>. Smaller values of -2LogL or the AIC
> indicate a better fitting model.
> 
> ![](media/image8.png)

2.  **Likelihood Ratio**

> Answers the question, “Is this model better than no model?”. That is,
> better than one with just an intercept. The H<sub>0</sub> is that all
> β on the current model = 0. In this case we can reject this
> H<sub>0</sub>.
> 
> ![](media/image9.png)

3.  **Deviance (use AGGREGATE SCALE=NONE option in MODEL statement)**

> Answers the question, “Is there a better model than this one?”
> Specifically, a saturated model (one with interactions). The
> H<sub>0</sub> is that the coefficients on the interaction terms are
> jointly are = 0. Here the evidence is mixed. The deviance says we can
> reject the H<sub>0,</sub> but the Pearson deviance does not. We should
> investigate interactions and see what we find.
> 
> However, with a continuous variable, we have many groupings or
> profiles.\[1\] In such cases the deviance test is questionable (the
> deviance test is more applicable when there is a limited number of
> profiles, as would occur if all variables were categorical), and the
> HL should be used.
> 
> ![](media/image10.png)

4.  **Hosmer-Lemeshow (HL) test (use LACKFIT option in MODEL
    statement)**

> Answers the same question as the deviance test, “Is there a better
> model than this one?” That is, one with interactions and
> non-linearities. The H<sub>0</sub> is that the current model fits the
> data well. Here we see that the HL test indicates that the
> H<sub>0</sub> cannot be rejected suggesting that a more complex model
> is not warranted.
> 
> ![](media/image11.png)
> 
> Note that we can always estimate a model using interactions. Here is
> one using all possible 2 and 3-way interactions. None are
> statistically significant at the 95% confidence level.
> 
> **proc** **logistic** data=admit descending;
> 
> class rank / param=ref;
> 
> model admit = gre gpa rank gpa\*gre gpa\*rank gre\*rank
> gre\*gpa\*rank;
> 
> **run**;
> 
> ![](media/image12.png)

1.  A model is fully saturated when there is 1 estimated parameter for
    each grouping or profile of the data. With a continuous variable,
    such a model is not possible. In this example we have 391 profiles.
