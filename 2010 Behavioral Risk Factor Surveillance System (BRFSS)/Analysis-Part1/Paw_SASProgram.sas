/* Import .XPT file */
libname transprt xport '/home/u50066252/my_sasdata/ANA 625/CDBRFS10.XPT';
libname dataout '/home/u50066252/my_sasdata/ANA 625';
proc copy in=transprt out=dataout; run; 
/* PROC CONTENTS throws an error w/ bad characters for CIASSIST */
proc contents data=dataout.cdbrfs10; run;
proc freq data=dataout.cdbrfs10; tables ciassist; run;
/* export as a csv then read back in with a guessingrows */
proc export data=dataout.cdbrfs10 outfile='/home/u50066252/my_sasdata/ANA 625/cdbrfs10.csv'; run;


/* Import .CSV */
proc import datafile='/home/u50066252/my_sasdata/ANA 625/cdbrfs10.csv' out=work.cdbrfs10 replace; guessingrows=10000; run;
proc contents data=work.cdbrfs10; run;
/* Dataset ready (ana625)*/
data ana625.cdbrfs10; set work.cdbrfs10; run;
/* Dataset ready (work) */
data work.cdbrfs10; set ana625.cdbrfs10; run;


/* Categorize SEX (male=0, female=1) as sex_1. Male is category 1 of the raw variable and female is category 2 */ 
data work.cdbrfs10; set work.cdbrfs10; 
	if sex = 1 then sex_1 = 0;
	if sex = 2 then sex_1 = 1;
run;
proc freq data=work.cdbrfs10; tables sex sex_1; run;

/* Categorize DIABETE2 (no=0, yes=1) as diabete2_1. Yes is category 1 of the raw variable and no is category 3 */ 
data work.cdbrfs10; set work.cdbrfs10; 
	if diabete2 = 1 then diabete2_1 = 1;
	else if diabete2 = 3 then diabete2_1 = 0;
	else diabete2_1 = .;
run; 
proc freq data=work.cdbrfs10; tables diabete2_1 diabete2; run;

/* Categorize EXERANY2 (no=0, yes=1) as exerany2_1. Yes is category 1 of the raw variable and no is category 2*/
data work.cdbrfs10; set work.cdbrfs10; 
	if exerany2 = 1 then exerany2_1 = 1;
	else if exerany2 = 2 then exerany2_1 = 0;
	else exerany2_1 = .;
run; 
proc freq data=work.cdbrfs10; tables exerany2 exerany2_1; run; 


/* Filtered Data */
data work.cdbrfs10_filtered; set work.cdbrfs10
	(where= ((18<=age<=99) 
	and (sex_1 in (0,1))
	and (diabete2_1 in (0,1))
	and (exerany2_1 in (0,1))
	and (educa in (1,2,3,4,5,6))
	and (_bmi4cat in (1,2,3))
	and (genhlth in (1,2,3,4,5)) ));
run;

proc contents data=work.cdbrfs10_filtered; run;
proc contents data=work.cdbrfs10; run;
proc freq data=work.cdbrfs10_filtered; tables age sex_1 diabete2_1 exerany2_1 educa _bmi4cat genhlth; run;

data ana625.cdbrfs10_filtered; set work.cdbrfs10_filtered; run;


/* QUESTION 1 */ 
proc freq data=ana625.cdbrfs10_filtered; tables sex_1 exerany2_1 _bmi4cat; run;


/* QUESTION 2 */
proc freq data=ana625.cdbrfs10_filtered;
	tables exerany2_1*sex_1 / norow nopercent nocol;
run;

proc freq data=ana625.cdbrfs10_filtered;
	tables exerany2_1*sex_1 / norow nopercent nocol chisq plots=mosaicplot;
run;

/* QUESTION 3 */
proc freq data=ana625.cdbrfs10_filtered;
	tables (exerany2_1 sex_1)*_bmi4cat / chisq; 
run;



