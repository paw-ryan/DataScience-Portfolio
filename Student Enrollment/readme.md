If you have questions about the following instructions or about your
assignment, please send me an email with a description of your question
and what you’ve tried in attempt to answer it.
<span class="underline">Do NOT submit late assignments; they will not be
accepted after answers are posted.</span>

# Assignment Questions

Download and import the “sim\_data.csv” file, which contains 1,000
samples (columns) of 100 students (rows) per sample. Each sample was
taken each month (term) at NU for the past 1,000 months (columns) of
students currently enrolled in a class for that month. Each cell is the
age of a student for a term. For histograms, if you have an error
message with gf\_histogram(), use hist() and the abline() functions to
create a histogram with a vertical line.

1.  One Sample
    
    1.  Plot a histogram of age for the first sample (the first column)
        of 100 students with a vertical line of the mean.
    
    2.  Describe the shape of the distribution.
    
    3.  What does the y-axis represent?
    
    4.  What is the mean age for the sample?
    
    5.  What is the standard deviation of age for the sample?
    
    6.  What notation would you use to describe the mean and standard
        error from 1.d-e?

2.  Calculate the mean ages for each sample, using the R function,
    apply(). You will need to figure out what values to put in for the
    three arguments, X, MARGIN, and FUN. Save the 1,000 means in a
    vector of age means.
    
    1.  Plot a histogram of the age means with a vertical line at the
        mean.
    
    2.  Describe the shape of the distribution.
    
    3.  What does the y-axis represent?
    
    4.  What is the mean of the sampling distribution of means?
    
    5.  What is the standard error of the mean?
    
    6.  What notation would you use to describe the mean and standard
        error from 2.d-e?

3.  Calculate the standard deviation for each sample, using the R
    function, apply(). You will need to figure out what values to put in
    for the three arguments, X, MARGIN, and FUN. Save the result in
    vector of age standard deviations.
    
    1.  Plot a histogram of the age standard deviations with a vertical
        line at the mean.
    
    2.  Describe the shape of the distribution.
    
    3.  What does the y-axis represent?
    
    4.  What is the mean of the sampling distribution of the standard
        deviations?
    
    5.  What is the standard error of the standard deviations?
    
    6.  What notation would you use to describe the mean and standard
        error from 3.d-e?

4.  According to your findings from Q1-Q3,
    
    1.  What is your best estimate of the population mean? Why?
    
    2.  What is your best estimate of the population standard deviation?
        Why?

For the following questions, use your best estimates of the population
mean and standard deviation (Q4).

5.  Simulate the sampling distribution of the mean with 100 samples of
    10 students each.
    
    1.  Plot a histogram of the age means with a vertical line at the
        mean.
    
    2.  What is the mean of the sampling distribution of the means?
    
    3.  What is the standard error of the mean?

6.  Repeat the simulation in Q5, but instead of 100 samples, get 1,000
    samples.
    
    1.  Plot a histogram of the age means with a vertical line at the
        mean.
    
    2.  What is the mean of the sampling distribution of the means?
    
    3.  What is the standard error of the mean?
    
    4.  What happened to the standard error of the mean, compared to the
        simulation with 100 samples for 10 students in Q5?
        
        1.  Why do you believe this happened?

7.  Repeat the simulation in Q5, but instead of 10 students per sample,
    get 1,000 students.
    
    1.  Plot a histogram of the age means with a vertical line at the
        mean.
    
    2.  What is the mean of the sampling distribution of the means?
    
    3.  What is the standard error of the mean?
    
    4.  What happened to the standard error of the mean, compared to the
        simulation with 100 samples for 10 students in Q5?
        
        1.  Why do you believe this happened?
    
    5.  What happened to the standard error of the mean, compared to the
        simulation with 1,000 samples for 10 students in Q6?
        
        1.  Why do you believe this happened?

8.  Looking back at your histograms (except Q3),
    
    1.  Which histogram has the most spread?
    
    2.  How can you tell?
    
    3.  Why is this so?

9.  Considering the estimates of the population mean from Q3, Q5, Q6,
    and Q7,
    
    1.  Which estimate would you trust most? Why?
    
    2.  Which estimate would you trust least? Why?

10. Do you believe the sample mean and standard deviation you obtained
    in Q1 (for one sample) was a good estimate of the population mean
    and standard deviation? Why or why not?

Extra credit: Write the R code to generate a random sample of 100 coin
flips from a coin where the probability of a heads is twice as likely as
a tails.
