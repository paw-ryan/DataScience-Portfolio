“Third factors” are variables that can affect the estimated relationship
between outcome and exposure by being ignored. In the parlance of
regression methodology, they are “omitted variables”. In health
analytics, they are “confounders”, in which all of the relationship
between outcome and exposure is due to their individual relationship
with this third variable, or are “modifiers”, in which the strength of
the relationship between outcome and exposure depends on this third
variable.

Using the dataset “Confounder Example.csv”, let us demonstrate how these
confounding effects can manifest themselves and how they can be
addressed at the analytical stage.

The dataset contains 1,000 patients and their diagnosis for
cardiovascular disease (CVD) (1 = yes; 0 = no). In addition, the dataset
contains the patient characteristics BMI (1 = obese; 0 = not obese) and
AGE\_GT50 (1 = yes; 0 = no).

> **proc** **import** datafile='/…/Confounding Example.csv' out=heart
> replace; **run**;
> 
> **proc** **format**;
> 
> value Hd\_DiagFmt **1**="Positive"
> 
> **0**="Negative";
> 
> value AgeFmt **1**="Age \>=50"
> 
> **0**="Age \< 50";
> 
> value BMIFmt **1**="Obese"
> 
> **0**="Not Obese"; **run**;

1.  **Using PROC FREQ**
    
    1.  **Determine the OR of a patient with an obese BMI being
        diagnosed with CVD.**

> **proc** **sort** data=heart; by descending cvd descending bmi;
> **run**;
> 
> **proc** **freq** data=heart order=data;
> 
> format bmi bmifmt. cvd hd\_diagfmt.;
> 
> tables bmi\*cvd / chisq relrisk nocol norow nopercent; **run**;

|                       |                       |
| --------------------- | --------------------- |
| ![](media/image1.png) | ![](media/image2.png) |

> We see that the odds of a patient with obese BMI being diagnosed with
> CVD are 1.9x higher (as compared to not obese BMI). Moreover, the 95%
> CI does not include 1.0 so we conclude the estimated relationship is
> statistically significant.

2.  **Determine the OR of a patient with an obese BMI being diagnosed
    with CVD by AGE strata.**

> **proc** **freq** data=heart order=data;
> 
> format bmi bmifmt. cvd hd\_diagfmt.;
> 
> tables age\_gt50\*bmi\*cvd / chisq relrisk nocol norow nopercent;
> **run**;

| **AGE\_GT50 = 0**     | **AGE\_GT50 = 1**     |
| --------------------- | --------------------- |
| ![](media/image3.png) | ![](media/image4.png) |
| ![](media/image5.png) | ![](media/image6.png) |

3.  **Based on your findings, does AGE seem to matter? Explain.**

> We see that the OR between BMI and CVD differs substantially when we
> account for AGE:
> 
> If \>=50, OR for obese BMI being diagnosed with CVD = 1.537
> 
> If \<50, OR for obese BMI being diagnosed with CVD = 1.476
> 
> These values differ from the overall OR of 1.932 =\> AGE may be a
> confounding variable.

2.  **Test for whether AGE is a confounding variable.**
    
    1.  **First, does AGE meet these 2 criteria for being a confounder?
        Support statistically where possible.**
        
        1.  **Is AGE related to CVD?**

> **proc** **sort** data=heart; by bmi; **run**;
> 
> **proc** **corr** data=heart; var age\_gt50 cvd; by BMI; **run**;

|                       |                                                                                                                 |
| --------------------- | --------------------------------------------------------------------------------------------------------------- |
| ![](media/image7.png) | Appears to be a positive relationship between AGE and CVD but the strength of the correlation is somewhat weak. |

2.  **Is AGE related to BMI?**

> **proc** **corr** data=heart; var age\_gt50 bmi; **run**;

|                       |                                                                                                 |
| --------------------- | ----------------------------------------------------------------------------------------------- |
| ![](media/image8.png) | Appears to be a positive relationship between AGE and BMI with a moderately strong correlation. |

> Note: Another test is whether AGE is an intermediate step in the
> casual relationship between BMI and CVD?
> 
> Theoretically, it does not appear that path from BMI to CVD is through
> AGE (i.e., BMI causes AGE which cause CVD). Rather, the evidence
> suggests that (i) both AGE and BMI affect CVD; and (ii) AGE affects
> BMI. Hence, AGE appears to be a confounding variable to the
> relationship between BMI and CVD:
> 
> ![](media/image9.png)

2.  **Second, using logistic regression, test for whether AGE is a
    confounder.**

> /\* run logistic model using full model and capture OR on BMI \*/
> 
> **proc** **logistic** data=heart descending;
> 
> class cvd (ref='0') bmi (ref='0') age\_gt50 (ref='0') / param=ref;
> 
> model cvd = bmi age\_gt50 / rsq; **run**;
> 
> /\* Adjusted OR is 1.515 \*/
> 
> /\* run logistic model removing AGE and capture OR on BMI \*/
> 
> **proc** **logistic** data=heart descending;
> 
> class cvd (ref='0') bmi (ref='0’) / param=ref;
> 
> model cvd = bmi / rsq; **run**;
> 
> /\* Unadjusted OR is 1.932 \*/
> 
> /\* calculate the % change
> 
> (1.932 - 1.515) / 1.932 = .2158 or 21.58%
> 
> (1.932 - 1.515) / 1.515 = .2752 or 27.52%
> 
> Since both \> 10%, we conclude that AGE is a confounding variable.
> 
> \*/

3.  **Calculate the “adjusted OR” for BMI and CVD that accounts for
    AGE.**
    
    1.  **First, use the contingency table approach.**

> We have the data from the frequency tables in \#1 above to populate
> the following formatted tables:

| Age \< 50                                                     |               | **CVD** | **No CVD** | **Total** |
| ------------------------------------------------------------- | ------------- | ------- | ---------- | --------- |
|                                                               | **Obese**     | 10      | 90         | 100       |
|                                                               | **Not Obese** | 35      | 465        | 500       |
|                                                               | **Total**     | 45      | 555        | 600       |
|                                                               |               |         |            |           |
| The unadjusted OR of an obese subject age \< 50 having CVD is | 1.476         |         |            |           |

| Age \>= 50                                                    |               | **CVD** | **No CVD** | **Total** |
| ------------------------------------------------------------- | ------------- | ------- | ---------- | --------- |
|                                                               | **Obese**     | 36      | 164        | 200       |
|                                                               | **Not Obese** | 25      | 175        | 200       |
|                                                               | **Total**     | 61      | 339        | 400       |
|                                                               |               |         |            |           |
| The unadjusted OR of an obese subject age \< 50 having CVD is | 1.537         |         |            |           |

> The adjusted OR is effectively a weighted average of the OR from the
> two AGE strata. The Cochran-Mantel-Haenzel estimate is such an
> average:
> 
> ![](media/image10.png)

2.  **Second, use PROC FREQ with the CMH option.**

> **proc** **freq** data=work.heart order=data;
> 
> format bmi bmifmt. cvd hd\_diagfmt.;
> 
> tables age\_gt50\*bmi\*cvd / cmh;
> 
> **run**;
> 
> ![](media/image11.png)
> 
> Note that the CMH option also produces the Cochran-Mantel-Haenszel
> “general association” test statistic which considers the presence of
> a control variable in determining whether there is an association
> between CVD and BMI. As shown in the output below, we see that the
> test statistic is not significant at the 5% level of significance. So
> there appears to be no association between BMI and CVD after
> controlling for AGE.
> 
> ![](media/image12.png)

3.  **Third, use logistic regression.**

> **proc** **logistic** data=heart descending;
> 
> class cvd (ref='0') bmi (ref='0') age\_gt50 (ref='0') / param=ref;
> 
> model cvd = bmi age\_gt50 / rsq; **run**;
> 
> ![](media/image13.png)
> 
> So, we see that logistic regression yields the same adjusted OR (1.52)
> as the CMH/contingency table approach.
> 
> Note that the estimated model coefficients (β) are consistent with the
> CMH test performed in part (c). The β on BMI is not statistically
> different from 0 at the 5% significance level (95% confidence level).
> So, once we control for AGE, the apparent relationship between BMI and
> CVD disappears in this sample.
> 
> ![](media/image14.png)

4.  **Is AGE an “effect modifier”? Explain with the help of relevant SAS
    output.**

Above we found that AGE is a confounder of the relationship between BMI
and CVD. A related question is whether the relationship between BMI and
CVD differs across the strata of AGE. If the strata OR are homogeneous
(i.e., are roughly the same), then there likely is no interaction
between AGE and BMI and AGE is not an effect modifier.

![](media/image15.png)

The Breslow-Day test reveals that we cannot reject the H<sub>0</sub> of
homogeneity. The CMH option for PROC FREQ also produces this test
statistic. As shown, the p-value is quite large so we cannot reject the
H<sub>0</sub>.

We can also use PROC LOGISTIC to generate the deviance chi squared
statistic which indicates we cannot reject the H0 that the coefficients
on the interaction terms in a saturated model are jointly = 0.

![](media/image16.png)

**proc** **logistic** data=work.heart descending;

> class cvd (ref='0') bmi (ref='0') age\_gt50 (ref='0') / param=ref;
> 
> model cvd = bmi age\_gt50 / aggregate scale=none; **run**;
> 
> And we can estimate a fully saturated model as well which shows the
> interaction term as statistically insignificant:
> 
> **proc** **logistic** data=work.heart descending;
> 
> class cvd (ref='0') bmi (ref='0') age\_gt50 (ref='0') / param=ref;
> 
> model cvd = bmi age\_gt50 bmi\*age\_gt50/ rsq;
> 
> **run**;
> 
> ![](media/image17.png)

So, we conclude that AGE is a confounder but not an effect modifier.
