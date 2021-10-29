/* Import */ 
proc import datafile='/home/u50066252/my_sasdata/ANA 625/cdbrfs10.csv' out=work.cdbrfs10 replace; guessingrows=10000; run;
proc contents data=work.cdbrfs10; run;

/* subset data and create variables */
data work.cdbrfs10; set work.cdbrfs10;
where (18<=age<=99) and (sex in(1,2)) and (diabete2 in(1,3)) and (exerany2 in(1,2)) and (educa in (1,2,3,4,5,6))
and (_bmi4cat in(1,2,3)) and (genhlth in(1,2,3,4,5));

/* AGE */
if 18<=age<=34 then agecat=1;
if 35<=age<=54 then agecat=2;
if 55<=age then agecat=3; 

/* DIABETES: have you ever been told by a doctor that you have diabetes? 1 = yes, 3 = no */
if diabete2=1 then diabetes = 1; 
if diabete2=3 then diabetes = 0;

/* EXERCISE: did you participate in any physical activity during the past month? 1 = yes, 2 = no */
if exerany2=1 then exercise = 1; 
if exerany2=2 then exercise = 0;

/* SEX: 1 = male, 2 = female */
if sex = 2 then sex2 = 1; 
if sex = 1 then sex2 = 0;

/* EDUCATION: 1/2 = Elementary, 3/4 = HS, 5/6 = College */
if educa in (1,2) then edcat = 1; 
if educa in (3,4) then edcat = 2; 
if educa in (5,6) then edcat = 3;

/* GENERAL HEALTH: 1 = Excellent, 2/3 = Good, 4/5 = Poor */
if genhlth in (1) then genhealth = 1; 
if genhlth in (2,3) then genhealth = 2; 
if genhlth in (4,5) then genhealth = 3;

/* BMI: 1 = ok 2 = overweight 3 = obese */
if _bmi4cat = 1 then bmi = 1; 
if _bmi4cat = 2 then bmi = 2; 
if _bmi4cat = 3 then bmi = 3;
drop sex; run;

data work.cdbrfs10; set work.cdbrfs10; rename sex2 = sex; run;

/* Save to ANA625 */
data ana625.cdbrfs10_filtered2; set work.cdbrfs10; run;


/* Question 1 */
proc freq data=ana625.cdbrfs10_filtered2;
	tables (bmi exercise sex edcat agecat genhealth)*diabetes / chisq; 
run;


/* Question 5 */
proc logistic data=ana625.cdbrfs10_filtered2 descending;  
	model diabetes = bmi exercise sex edcat age genhealth  / aggregate scale=none lackfit;
run;


/* Question 6 */
proc reg data=ana625.cdbrfs10_filtered2;
	model diabetes = bmi exercise sex edcat agecat genhealth / vif tol; run;


/* Question 7 */
/* Base - Adjusted OR */ 
proc logistic data=ana625.cdbrfs10_filtered2 descending;  
	model diabetes = bmi exercise sex edcat agecat genhealth / rsq; run; 
/* BMI Odds Ratio: 2.159 */ 

/* Remove Exercise */ 
proc logistic data=ana625.cdbrfs10_filtered2 descending;  
	model diabetes = bmi sex edcat agecat genhealth / rsq; run; 
/* BMI Odds Ratio: 2.173 */ 

/* calculate the % change 
	(2.173 - 2.159) / 2.159 = 0.00648 = 0.65%
	(2.173 - 2.159) / 2.173 = 0.00644 = 0.64%
	
Since <10%, exercise is NOT a confounding variable.

/* Remove Sex */ 
proc logistic data=ana625.cdbrfs10_filtered2 descending;  
	model diabetes = bmi exercise edcat agecat genhealth / rsq; run; 
/* BMI Odds Ratio: 2.166 */ 

/* calculate the % change 
	(2.166 - 2.159) / 2.159 = 0.00324 = 0.32%
	(2.166 - 2.159) / 2.166 = 0.00323 = 0.32%
	
Since <10%, sex is NOT a confounding variable.

/* Remove General Health */ 
proc logistic data=ana625.cdbrfs10_filtered2 descending;  
	model diabetes = bmi exercise sex edcat agecat / rsq; run; 
/* BMI Odds Ratio: 2.325 */ 

/* calculate the % change 
	(2.325 - 2.159) / 2.159 = 0.0769 = 7.69%
	(2.325 - 2.159) / 2.325 = 0.0714 = 7.14%
	
Since <10%, general health is NOT a confounding variable.

/* Remove Age */ 
proc logistic data=ana625.cdbrfs10_filtered2 descending;  
	model diabetes = bmi exercise sex edcat genhealth / rsq; run; 
/* BMI Odds Ratio: 2.039 */ 

/* calculate the % change 
	(2.039 - 2.159) / 2.159 = -0.0556 = -5.56%
	(2.039 - 2.159) / 2.039 = -0.0589 = -5.89%
	
Since <10%, age is NOT a confounding variable.

/* Remove Education */ 
proc logistic data=ana625.cdbrfs10_filtered2 descending;  
	model diabetes = bmi exercise sex agecat genhealth / rsq; run; 
/* BMI Odds Ratio: 2.159 */ 

/* calculate the % change 
	(2.159 - 2.159) / 2.159 = 0.00 = 0.00%
	(2.159 - 2.159) / 2.159 = 0.00 = 0.00%
	
Since <10%, exercise is NOT a confounding variable.

/* Question 8 */
proc logistic data=ana625.cdbrfs10_filtered2 descending; 
	class bmi (ref='1') exercise (ref='0') sex (ref='0') edcat (ref='1') agecat (ref='1') genhealth (ref='3') / param=reference; 
	model diabetes = bmi exercise sex edcat agecat genhealth / aggregate scale=none lackfit;
run;

/* Female to male */
proc logistic data=ana625.cdbrfs10_filtered2 descending; 
	class sex (ref='0') / param=reference; 
	model diabetes = sex / rsq;
run;
/* Exerciser to non-exerciser */
proc logistic data=ana625.cdbrfs10_filtered2 descending; 
	class exercise (ref='0') / param=reference; 
	model diabetes = exercise / rsq;
run;
/* Overweight to normal BMI, Obese to normal BMI */
proc logistic data=ana625.cdbrfs10_filtered2 descending; 
	class bmi (ref='1') / param=reference; 
	model diabetes = bmi / rsq;
run;
/* Age 35-54 to 18-24, Age 55+ to 18-24 */
proc logistic data=ana625.cdbrfs10_filtered2 descending; 
	class agecat (ref='1') / param=reference; 
	model diabetes = agecat / rsq;
run;
/* HS to elementary education, College to elementary education */
proc logistic data=ana625.cdbrfs10_filtered2 descending; 
	class edcat (ref='1') / param=reference; 
	model diabetes = edcat / rsq;
run; 
/* Good to poor health, Excellent to poor health */
proc logistic data=ana625.cdbrfs10_filtered2 descending; 
	class genhealth (ref='3') / param=reference; 
	model diabetes = genhealth / rsq;
run;



/* Extra Credit */ 
proc logistic data=ana625.cdbrfs10_filtered2 descending;
	model diabetes = sex agecat sex*agecat; run;
	
proc logistic data=ana625.cdbrfs10_filtered2 descending;
	class sex agecat; 
	model diabetes = sex agecat sex*agecat / expb; run;

proc logistic data=ana625.cdbrfs10_filtered2 descending;
model diabetes = sex agecat sex*agecat; 
oddsratio sex / at(agecat= 1);
oddsratio sex / at(agecat= 2); 
oddsratio sex / at(agecat= 3); 
run;









