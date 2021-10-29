If you have questions about the following instructions or about your
assignment, please send me an email with a description of your question
and what you’ve tried in attempt to answer it.
<span class="underline">Do NOT submit late assignments; they will not be
accepted after answers are posted.</span>

# Data Description

This data was downloaded from Kaggle.com, a site that houses open source
datasets. This

specific dataset is titled: “Breast Cancer Wisconsin (Diagnostic) Data
Set” From the Kaggle website:
<https://www.kaggle.com/uciml/breast-cancer-wisconsin-data>

Features are computed from a digitized image of a fine needle aspirate
(FNA) of a breast mass. They describe characteristics of the cell nuclei
present in the image. n the 3-dimensional space is that described in:
\[K. P. Bennett and O. L. Mangasarian: "Robust Linear Programming
Discrimination of Two Linearly Inseparable Sets", Optimization Methods
and Software 1, 1992, 23-34\].

This database is also available through the UW CS ftp server: ftp
ftp.cs.wisc.edu cd math-prog/cpo-dataset/machine-learn/WDBC/

Also can be found on UCI Machine Learning Repository:
<https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29>

Attribute Information:

1\) ID number 2) Diagnosis (M = malignant, B = benign) 3-32)

Ten real-valued features are computed for each cell nucleus: a) radius
(mean of distances from center to points on the perimeter) b) texture
(standard deviation of gray-scale values) c) perimeter d) area e)
smoothness (local variation in radius lengths) f) compactness
(perimeter^2 / area - 1.0) g) concavity (severity of concave portions of
the contour) h) concave points (number of concave portions of the
contour) i) symmetry j) fractal dimension ("coastline approximation" -
1)

The mean, standard error and "worst" or largest (mean of the three
largest values) of these features were computed for each image,
resulting in 30 features. For instance, field 3 is Mean Radius, field 13
is Radius SE, field 23 is Worst Radius.

All feature values are recoded with four significant digits.

Missing attribute values: none

Class distribution: 357 benign, 212 malignant

# Preliminaries

Install and load the R package, “effsize.” You will use the function,
“cohen.d” to get confidence intervals for Cohen’s d in Q4. Also load
the mosaic package.

# Assignment Questions

1.  Descriptive statistics.
    
    1.  Quantitative Variables: perimeter\_mean and texture\_mean
        
        1.  Create a histogram for each variable
        
        2.  Obtain the five number summaries for each variable
    
    2.  Categorical Variable: diagnosis
        
        1.  Create a boxplot with perimeter\_mean as the explanatory
            variable
        
        2.  Obtain frequencies of the two categories.
        
        3.  Obtain means and standard deviations of perimeter\_mean,
            aggregated by diagnosis

2.  Correlation between perimeter\_mean and texture\_mean
    
    1.  Obtain the correlation.
    
    2.  Interpret the correlation (reference Assignment One for
        examples).
    
    3.  What is the 95% confidence interval? Use cor.test().
    
    4.  What is the 75% confidence interval? Use cor.test().
    
    5.  Are you confident that the true population correlation could be
        zero? Why or why not?

3.  Fit an empty model for perimeter\_mean,
    
    1.  What are the parameter estimates? Interpret them.
    
    2.  What is the PRE? Interpret it.
    
    3.  Provide a 95% confidence interval around your parameter
        estimate. How did you obtain it? Interpret it.

4.  Fit a linear model with perimeter\_mean as the outcome and diagnosis
    as the explanatory variable.
    
    1.  What are the parameter estimates? Interpret them.
    
    2.  What are the 95% confidence intervals around your slope?
        Describe the method you used to obtain them.
    
    3.  What are the 99% confidence intervals around your slope?
        Describe the method you used to obtain them.
    
    4.  What is the effect size, expressed as Cohen’s d?
        
        1.  Interpret the Cohen’s d from the model.
        
        2.  What is the 99% confidence interval around Cohen’s d?
        
        3.  Interpret the confidence interval for Cohen’s d. What do the
            units represent?
    
    5.  Do you believe there is a relationship between perimeter\_mean
        and diagnosis? Why or why not?
    
    6.  How does the information you received from the confidence
        interval relate to the hypothesis that this sample represents
        (is drawn from) a population with these parameter estimates?

5.  Fit a linear model with perimeter\_mean as the outcome and
    texture\_mean as the explanatory variable.
    
    1.  What are the parameter estimates? Interpret them.
    
    2.  95% confidence intervals around your slope.
        
        1.  Construct the confidence intervals using bootstrap with 1000
            samples.
            
            1.  What are the units of the confidence intervals?
            
            2.  How would you interpret the confidence interval?
        
        2.  Construct the confidence intervals using the model.
            
            1.  What are the units of the confidence intervals?
            
            2.  How would you interpret the confidence interval?
        
        3.  Are you confident that the true population slope parameter
            is not 0? Why or why not?
    
    3.  75% confidence intervals around your slope.
        
        1.  Construct the confidence intervals using bootstrap with 1000
            samples.
        
        2.  Construct the confidence intervals using the model.
        
        3.  Are the confidence intervals from these two methods similar?
            If they are similar, why is this so? If they are not, why
            not?
    
    4.  What is the effect size, expressed as PRE? Interpret the PRE of
        the model.
    
    5.  Do you believe there is a relationship between texture\_mean and
        perimeter\_mean? Why or why not?

6.  Comparing the models in Q4 and Q5, which do you believe predicts
    perimeter\_mean better? Why or why not? Justify your reasoning.
