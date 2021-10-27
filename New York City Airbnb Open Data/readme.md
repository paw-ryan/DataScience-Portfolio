ANA 600: Week Three Assignment

If you have questions about the following instructions or about your
assignment, please send me an email with a description of your question
and what you’ve tried in attempt to answer it. Be sure to include your
data file and R script. Please do NOT submit late assignments; they will
not be accepted after answers are posted.

Data Description

This data was downloaded from Kaggle.com, a site that houses open source
datasets. This specific dataset is titled: “New York City Airbnb Open
Data,” and was originally sourced from Airbnb. From the Kaggle website
(below):

**Context**

Since 2008, guests and hosts have used Airbnb to expand on traveling
possibilities and present more unique, personalized way of experiencing
the world. This dataset describes the listing activity and metrics in
NYC, NY for 2019.

**Content**

This data file includes all needed information to find out more about
hosts, geographical availability, necessary metrics to make predictions
and draw conclusions.

https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data/downloads/new-york-city-
airbnb-open-data.zip/3

Work in R

1.  Download the **Wk3\_Assign\_R\_Markdown\_Template.Rmd** file and
    save it to your local computer.

2.  Download the **airbnb\_data.csv** (data file) and save it on your
    local computer.

3.  Copy the file path of where you saved your data.

4.  Open the Rmd file with Rstudio. Read the instructions on how to
    import the data.

5.  Install and load the required packages (see R/Rstudio install
    instructions)

6.  Using what you’ve learned from the E-Textbook, write (and run\!) the
    code you would like to use to respond to the questions below. Submit
    your R script with your assignment.

Building a Simple Model and Quantifying Error (100 points)

You **DO NOT** need to submit this write-up as an APA-style report.
Don’t forget to **WRITE YOUR NAME** in your document, **AND** save the
file with a new title, YourLastName\_Week3\_Assign3\!

1.  Prior to analysis, remove any observations that have a room\_type =
    “Shared room” and a price greater than $500 (include those less
    than or equal to $500). Next, create another variable from the
    factor variable, room\_type, into a numeric coding scheme, where 0 =
    “Private room” and 1 = “Entire home/apt”. How many total
    observations are left? How many observations are “Private room”? How
    many observations are “Entire home/apt”? Use this filtered dataframe
    to answer the following questions.

2.  Looking at the different rental options, how much does a rental cost
    in general? Is there variation in price? What do you think makes a
    rental cost more versus less? Name a few features. Create a story of
    a DGP that might be responsible for the variation you see in price.

3.  Plot a histogram of price. Discuss the shape, center, spread, and
    weirdness. Provide a five-number summary of price. Create a
    visualization to see price (outcome) by the different room\_type
    categories, “Private room” and “Entire home/apt” (explanatory).
    (Hint: use the factor version of the room\_type variable, not the
    numeric version). What do you observe is the relationship between
    price and room type, based on the graphic?

4.  Fit an empty model for your outcome, price. Based on your model
    output, what is the value of the intercept? What does the intercept
    represent? What is the value of sums of squares? What does the sums
    of squares represent, in your own words?

5.  Compare and contrast residuals, sums of squares, and standard
    deviations.

6.  Using z-scores, compare the price, $275, between the room\_types,
    “Private room” and “Entire home/apt.” What z-scores did you get
    for the two room\_types? Interpret what they mean, in relation to
    each distribution. Discuss this interpretation of z-scores for the
    price, $275, in relation to your DGP in question 2. How might the
    room type explain some of the variation in price? Would knowing the
    room type help you make a better prediction about price? Why or why
    not?

Extra credit: Fit an empty model to a categorical outcome, room\_type
(numeric version). Based on your model output, what is the value of the
intercept? What does it represent, and how would you interpret it?
