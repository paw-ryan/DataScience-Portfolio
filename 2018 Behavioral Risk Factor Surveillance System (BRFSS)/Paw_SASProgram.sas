libname transprt xport '/home/u50066252/my_sasdata/ANA 625/LLCP2018.XPT';
libname dataout '/home/u50066252/my_sasdata/ANA 625';
proc copy in=transprt out=dataout; run; 
proc contents data=dataout.LLCP2018; run;

/* Contents */
data ana625.llcp2018; set dataout.llcp2018; run;
proc contents data=ana625.llcp2018; run;

/* Proc Corr */
proc corr data=ana625.llcp2018 RANK noprob; 
	var genhlth menthlth poorhlth addepev2 sex1 marital educa
	cpdemo1b veteran3 employ1 children income2 smokday2 alcday5
	adpleas1 addown1 stopwory somale sofemale _metstat _prace1 
	_ment14d _hcvu651 _totinda _age_g _bmi5cat _chldcnt _educag
	_incomg _rfsmok3 drocdy3_ _rfdrhv6;
run;


/*
The Silent Generation: Born 1928-1945 (74-91 years old)
Baby Boomers: Born 1946-1964 (55-73 years old)
Generation X: Born 1965-1980 (39-54 years old)
Millennials: Born 1981-1996 (23-38 years old)
Generation Z: Born 1997-2012 (7-22 years old)
*/

/* Filter Data */
data ana625.llcp2018_filtered; set ana625.llcp2018;
where (18<=_age80<=99) and (sex1 in(1,2)) and (1<=menthlth<=99) and (1<=_PRACE1<=99) and (1<=_INCOMG<=5);

/* AGE: 1 = Gen Z, 2 = Millenial, 3 = Gen X, 4 = Boomer, 5 = Silent */
if 18<=_age80<=21 then agecat=1;
if 22<=_age80<=37 then agecat=2;
if 38<=_age80<=53 then agecat=3;
if 54<=_age80<=72 then agecat=4; 
if _age80>=73 then agecat=5;  

/* SEX: 0 = male, 1 = female */
if sex1 = 2 then sex = 1; 
if sex1 = 1 then sex = 0;

/* MENTAL HEALTH: during the past 30 days was your mental health not good? 1 = yes, 0 = no */
if 1<=menthlth<=30 then mhealth = 1; 
if menthlth > 30 then mhealth = 0;

/* RACE: 1 = White, 2 = Black, 3 = Asian 4 = Other Race */
if _PRACE1=1 then race = 1; 
if _PRACE1=2 then race = 2;
if _PRACE1=4 then race = 3;
if _PRACE1 in (3,5,6,7,77,99) then race = 4;

/* INCOME:  */
if _INCOMG = 1 then income = 1; 
if _INCOMG = 2 then income = 2;
if _INCOMG = 3 then income = 3;
if _INCOMG = 4 then income = 4; 
if _INCOMG = 5 then income = 5; 
run;

/* Check */
proc freq data=ana625.llcp2018;
	tables _age80 sex1 menthlth _PRACE1 _INCOMG; run;

proc freq data=ana625.llcp2018_filtered;
	tables _age80 sex1 menthlth _PRACE1 _INCOMG; run;
proc freq data=ana625.llcp2018_filtered;
	tables mhealth agecat sex race income; run;


/* Table 1 */ 
proc freq data=ana625.llcp2018_filtered;
	tables (sex race income)*agecat / chisq; 
run;


/* Table 2 */ 
proc freq data=ana625.llcp2018_filtered;
	tables (agecat sex race income)*mhealth / chisq; 
run;


/* Table 3 */ 
proc logistic data=ana625.llcp2018_filtered descending;  
	class agecat (ref='5') sex (ref='1') race (ref='2') income (ref='1') / param=reference; 
	model mhealth = agecat sex race income  / aggregate scale=none lackfit;
run;


/* Multicolinearity Check */ 
proc reg data=ana625.llcp2018_filtered;
	model mhealth = agecat sex race income / vif tol; run;


/* Confounding variable check */ 
/* Base - Adjusted OR */ 
proc logistic data=ana625.llcp2018_filtered descending;  
	model mhealth = agecat sex race income; run; 
/* Base Ratio: 0.635 */ 

/* Remove sex */ 
proc logistic data=ana625.llcp2018_filtered descending;  
	model mhealth = agecat race income; run; 
/* Ratio: 0.646	 */ 

/* calculate the % change 
	((0.646 - 0.635) / 0.635)*100 = 1.73%
	
Since <10%, sex is NOT a confounding variable.

/* Remove race */ 
proc logistic data=ana625.llcp2018_filtered descending;  
	model mhealth = agecat sex income; run; 
/* BMI Odds Ratio: 0.644 */ 

/* calculate the % change 
	((0.644 - 0.635) / 0.635)*100 = 1.42%
	
Since <10%, race is NOT a confounding variable.

/* Remove income */ 
proc logistic data=ana625.llcp2018_filtered descending;  
	model mhealth = agecat sex race; run; 
/* BMI Odds Ratio: 0.648 */ 

/* calculate the % change 
	((0.648 - 0.635) / 0.635)*100 = 2.05%
	
Since <10%, income is NOT a confounding variable.*/
 


