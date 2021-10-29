**<span class="underline">Case Study: SAS BRFSS 10 Categorical Table
1</span>**

This case study will reintroduce you to categorical variables and how
you may use statistical procedures to investigate these types of data,
display them in a “Table 1”, and develop a results section describing
your Table 1. Use data from the Behavioral Health Needs Assessment
Survey from 2010 to complete this case study.

It is expected that all students have taken CITI training prior to
conducting these secondary data analysis case studies. Please go to
<http://ohrc.nu.edu/>, visit the tab “IRB”, and read about what an IRB
is and the role of the National University IRB. Then please make sure to
visit the CITI link and take the training.

Next, go to the NU Health Science Research Center <http://ohrc.nu.edu/>
and go into “Data Sets”. From there go to
“**<span class="underline">Source</span>**: [government agency or
foundation](javascript:toggle_visibility\('sect-source'\);)” then
“[Federal (National)](javascript:toggle_visibility\('national'\);)”,
and then “[Centers for Disease Control and Prevention
\[CDC\]](javascript:toggle_visibility\('center-for-disease-control'\);%20toggle_visibility\('center-for-disease'\);)”.
From there, you will see the link for **Behavioral Risk Factor
Surveillance System (BRFSS)**.

From this link find 2010 data and download the SAS zipped file and the
codebook.

The objective of this analysis is to investigate the association between
**diabetes** and **BMI** after controlling for **exercise** and
**gender**. The outcome variable is **diabetes** and the variable of
interest (exposure) is **BMI**.

Conduct a **<span class="underline">complete case analysis</span>** for
this objective following these guidelines:

1.  Use the raw variable categorization of BMI (\_BMI4CAT)

2.  Categorize gender (SEX) into a two-level variable (male=0, female=1)
    where male is category 1 of the raw variable and female is category
    2

3.  Categorize diabetes (DIABETE2) into a two-level variable (no=0,
    yes=1) where yes is category 1 of the raw variable and no is
    category 3

4.  Categorize exercise (EXERANY2) into a two-level variable (no=0,
    yes=1) where yes is category 1 of the raw variable and no is
    category 2

5.  For the complete case analysis, restrict your sample based on the
    following conditions:
    
    1.  18\<=AGE\<=99
    
    2.  SEX: raw categories 1 and 2
    
    3.  DIABETE2: raw categories 1 and 3
    
    4.  EXERANY2: raw categories 1 and 2
    
    5.  Education (EDUCA): raw categories 1-6
    
    6.  \_BMI4CAT: raw categories 1,2 and 3
    
    7.  General health (GENHLTH): raw categories 1-5

<!-- end list -->

1)  (10 pts) Using PROC FREQ, show the simple frequency tables for
    gender, exercise, and BMI

![Table Description automatically generated](media/image1.png)

2)  (20 pts) Using PROC FREQ, create a 2x2 contingency table for
    exercise by gender.
    
    1.  Show the PROC FREQ output **which shows only the counts in each
        cell**

> ![Table Description automatically generated](media/image2.png)

2.  Show your hand calculation of the chi-square statistic for testing
    whether there is an association between gender and exercise.

> <span class="underline">Proportion (P)</span>
> 
> P<sub>yes</sub> = 302217 / 413748 = 0.7304374 P<sub>yes+male</sub> =
> (0.7304374)(0.392582) = 0.2867565
> 
> P<sub>no</sub> = 111531 / 413748 = 0.2695626 P<sub>yes+female</sub> =
> (0.7304374)(0.607418) = 0.4436808
> 
> P<sub>male</sub> = 162430 / 413748 = 0.392582 P<sub>no+male</sub> =
> (0.2695626)(0.392582) = 0.1058254
> 
> P<sub>female</sub> = 251318 / 413748 = 0.607418 P<sub>no+female</sub>
> = (0.2695626)(0.607418) = 0.1637372
> 
> <span class="underline">Expected Count (E)</span>
> 
> E<sub>yes+male</sub> = (0.2867565)(413748) = 118644.94
> 
> E<sub>yes+female</sub> = (0.4436808)(413748) = 183572.06
> 
> E<sub>no+male</sub> = (0.1058254)(413748) = 43785.058
> 
> E<sub>no+female</sub> = (0.1637372)(413748) = 67745.942
> 
> <span class="underline">Observed (O)</span>
> 
> O<sub>yes+male</sub> = 123006
> 
> O<sub>yes+female</sub> = 179211
> 
> O<sub>no+male</sub> = 39424
> 
> O<sub>no+female</sub> = 72107
> 
> ![Text Description automatically generated with low
> confidence](media/image3.png)

|                   | yes+male       | yes+female  | no+male     | no+female  |
| ----------------- | -------------- | ----------- | ----------- | ---------- |
| **O**             | 123006         | 179211      | 39424       | 72107      |
| **E**             | 118644.942     | 183572.058  | 43785.0584  | 67745.9416 |
| **O - E**         | 4361.05837     | \-4361.0584 | \-4361.0584 | 4361.05837 |
| **(O - E)^2**     | 19018830.1     | 19018830.1  | 19018830.1  | 19018830.1 |
| **(O - E)^2 / E** | 160.300387     | 103.604166  | 434.368043  | 280.737556 |
| **∑**             | **979.010153** |             |             |            |
| **χ^2**           | **979.010153** |             |             |            |

3.  Based on your calculated chi-square value, is there an association
    between gender and exercise? Explain
    
    1.  What is your null hypothesis?

> **My null hypothesis is that there is no association between Body Mass
> Index (BMI) after controlling for exercise and gender.**

2.  What significance level are use assuming?

> **0.05**

3.  What is the critical chi-square value?

> **3.841**

4.  Show that your (1) hand calculated chi-square statistic, and (2)
    conclusion on the presence of an association matches that produced
    by PROC FREQ. Include the relevant PROC FREQ output in your answer.

> **My hand calculated chi-squared statistic is the same value as the
> PROC FREQ chi-squared output (979.0102). The critical chi-square value
> is 3.841 because we’re using a significance level of 0.05 with 1
> degree of freedom. Since the 979.0102 \> 3.841, this shows there is an
> association between exercise and gender and we can reject the null
> hypothesis.**
> 
> ![Table Description automatically generated](media/image4.png)![Table
> Description automatically generated](media/image5.png)
> 
> ![Chart, treemap chart Description automatically
> generated](media/image6.png)

3)  (30 pts) Create your “Table 1” for this objective. You can use this
    table template (copy and paste into Excel):

| Table 1. Characteristics of 413,748 BRFSS 2010 participants by BMI category. |            |        |            |       |        |       |       |       |            |
| ---------------------------------------------------------------------------- | ---------- | ------ | ---------- | ----- | ------ | ----- | ----- | ----- | ---------- |
|                                                                              | Population | Normal | Overweight | Obese |        |       |       |       |            |
| Variable                                                                     | N          | %      | n          | %     | n      | %     | n     | %     | p value \* |
|                                                                              |            |        |            |       |        |       |       |       |            |
| **Gender**                                                                   |            |        |            |       |        |       |       |       |            |
| Male                                                                         | 162430     | 39.3%  | 43061      | 29.6% | 72605  | 47.8% | 46764 | 40.1% | \<.0001    |
| Female                                                                       | 251318     | 60.7%  | 102291     | 70.4% | 79176  | 52.2% | 69851 | 59.9% |            |
| **Exercise**                                                                 |            |        |            |       |        |       |       |       |            |
| Yes                                                                          | 302217     | 73.0%  | 113204     | 77.9% | 114407 | 75.4% | 74606 | 64.0% | \<.0001    |
| No                                                                           | 111531     | 27.0%  | 32148      | 22.1% | 37374  | 24.6% | 42009 | 36.0% |            |
| \* p values based on Pearson chi-square test of association                  |            |        |            |       |        |       |       |       |            |

4)  (40 pts) Write the results section for this “Table 1”

> **Of the 451,075 BRFSS 2010 participants, 413,748 (92%), had complete
> data for the objective. The demographic characteristics of this
> population are compared in Table 1. There were proportionately more
> females than males (60.7% vs. 39.3%, respectively) in the population.
> Females that had a “Normal” BMI (70.4%) had the highest ratio of the
> population (p\<0.0001). There were proportionately more exercisers
> than non-exercisers (73.0% vs. 27.0%, respectively) in the population.
> Out of the participants that exercised, the highest ratio had a
> “Normal” BMI (77.9%) (p\<0.0001).**

Extra Credit (10 pts)

The calculation of a chi-square statistics makes use of an “expected
value”. Using the exercise by gender contingency table, give an
intuitive explanation of how the expected value is derived.

**The expected count is the proportion for each variable combination
(yes+male, yes+female, no+male, no+female) with respect to the entire
population (413748).**

**The proportion for each variable needs to be calculated first by
taking the total counts for each variable (yes, no, male, female) and
dividing it by the entire population (413748). Next, we need to
calculate each variable combination (yes+male, yes+female, no+male,
no+female) by multiplying its corresponding proportion together. Since
we now have the proportion for each variable combination, we can finally
calculate the expected count by multiplying it by the entire population
(413748).**

**The further the observed values are from the expected values, the more
likely that there really is a significant difference and there is an
association between the variables.**
