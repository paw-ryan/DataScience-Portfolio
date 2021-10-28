/* TASK 1 */
/* CREATE TABLES */
/* Import to ANA610 folder (to create tables)*/
libname sasdata '/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 4';
data ana610.fortune_acct; set sasdata.fortune_acct; run;
data ana610.fortune_attrition; set sasdata.fortune_attrition; run;
data ana610.fortune_hr; set sasdata.fortune_hr; run;
data ana610.fortune_survey; set sasdata.fortune_survey; run;
proc import datafile='/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 4/fortune_credit.csv' out=ana610.fortune_credit replace; run;


/* fortune_acct - numerical */
proc means data=ana610.fortune_acct n nmiss min mean median max;
	var dailyrate hourlyrate monthlyincome percentsalaryhike employee_no; run;
/* fortune_acct - categorical */
proc freq data=ana610.fortune_acct; table department overtime performancerating stockoptionlevel; run;
/* fortune_acct - character */
data ana610.fortune_acct; set ana610.fortune_acct;
	len_ssn = length(ssn); run; 
proc means data=ana610.fortune_acct n nmiss min mean median max; 
	var len_ssn; run;	


/* fortune_attrition - numerical */
proc means data=ana610.fortune_attrition n nmiss min mean median max;
	var employee_no; run;
/* fortune_attrition - dates */
proc tabulate data=ana610.fortune_attrition;
	var depart_dt; 
	table depart_dt, n nmiss (min mean median max) *f=mmddyy10.; run;
data ana610.fortune_attrition; set ana610.fortune_attrition; 
		year_depart_dt = year(depart_dt); run;
proc freq data=ana610.fortune_attrition; table year_depart_dt; run; 


/* fortune_hr - numerical */
proc means data=ana610.fortune_hr n nmiss min mean median max;
	var employee_no; run;
/* fortune_hr - categorical data*/
proc freq data=ana610.fortune_hr; table education educationfield gender birth_state;run;
/* fortune_hr - character */
data ana610.fortune_hr; set ana610.fortune_hr;
	len_first_name = length(first_name); run; 
proc means data=ana610.fortune_hr n nmiss min mean median max; 
	var len_first_name; run;
/* fortune_hr - dates */
proc tabulate data=ana610.fortune_hr;
	var birth_dt hire_dt;
	table birth_dt hire_dt, n nmiss (min mean median max) *f=mmddyy10.; run;
data ana610.fortune_hr; set ana610.fortune_hr; 
		year_birth_dt = year(birth_dt);
		year_hire_dt = year(hire_dt);
proc freq data=ana610.fortune_hr; table year_birth_dt year_hire_dt; run; 
	
	
/* fortune_survey - numerical */
proc means data=ana610.fortune_survey n nmiss min mean median max;
	var distancefromhome numcompaniesworked totalworkingyears trainingtimeslastyear yearsincurrentrole yearssincelastpromotion yearswithcurrmanager employee_no; run;
/* fortune_survey - categorical data*/
proc freq data=ana610.fortune_survey; table businesstravel environmentsatisfaction jobinvolvement joblevel jobsatisfaction maritalstatus relationshipsatisfaction worklifebalance;run;
	
	
/* fortune_credit - numerical */
proc means data=ana610.fortune_credit n nmiss min mean median max;
	var fico_scr ssn; run;
	

	

		
/* MERGE SECTION */
/* Import to Work folder (to create merged file)*/
libname sasdata '/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 4';
data work.fortune_acct; set sasdata.fortune_acct; run;
data work.fortune_attrition; set sasdata.fortune_attrition; run;
data work.fortune_hr; set sasdata.fortune_hr; run;
data work.fortune_survey; set sasdata.fortune_survey; run;
proc import datafile='/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 4/fortune_credit.csv' out=work.fortune_credit replace; run;

/* Check contents */
proc contents data=work.fortune_acct;run;
proc contents data=work.fortune_attrition;run;
proc contents data=work.fortune_hr;run;
proc contents data=work.fortune_survey;run;
proc contents data=work.fortune_credit;run;

/* Convert ssn */
data work.fortune_acct; set work.fortune_acct; 
/* remove characters specified between " " */ 
	ssn1 = compress(ssn,"-"); 
/* convert to a number */ 
	ssn2 = input(ssn1,9.); 
	drop ssn;
run;
data work.fortune_acct; set work.fortune_acct;
	ssn = ssn2;
	drop ssn1 ssn2;
run;

/* merge ssn on fortune_acct and fortune_credit using a left join */ 
proc sort data=work.fortune_acct; by ssn; run; 
proc sort data=work.fortune_credit; by ssn; run; 
data work.fortune_merge1; merge work.fortune_acct (in=a) work.fortune_credit; by ssn; if a; run;

/* create and merge fortune_merge1 with all other files*/
data work.fortune_merge1; set work.fortune_merge1;
data work.fortune_attrition; set work.fortune_attrition;
data work.fortune_hr; set work.fortune_hr;
data work.fortune_survey; set work.fortune_survey;
proc sort data=work.fortune_merge1; by employee_no; run; 
proc sort data=work.fortune_attrition; by employee_no; run; 
proc sort data=work.fortune_hr; by employee_no; run; 
proc sort data=work.fortune_survey; by employee_no; run; 
data work.fortune_master; 
		merge work.fortune_merge1 (in=a) work.fortune_attrition work.fortune_hr work.fortune_survey; by employee_no; if a; run;
data ana610.fortune_master; set work.fortune_master; run;

/* Qualified Sample */
data work.fortune_master; set ana610.fortune_master;
	if not missing(distancefromhome) 
	and not missing(depart_dt)
	then att_q1 = 1;
	else if not missing(distancefromhome)
	and missing(depart_dt)
	then att_q1 = 0;
	else att_q1 = .;
run;
proc freq data=work.fortune_master; table att_q1; run;




/* TASK 2, QUESTION 1 */
/* Check for duplicates */
*====> raw nobs; 
proc sql; select count(*) into : nobs from ana610.fortune_master; quit; 
*====> deduped; 
proc sort data=ana610.fortune_master out=ana610.fortune_master_clean nodupkey; by employee_no; run; 
proc sql; select count(*) into : nobs from ana610.fortune_master_clean; quit; 
/* 25 duplicate employee_no identified */


/* TASK 2, QUESTION 2 */
data ana610.fortune_master_clean; set ana610.fortune_master_clean;
	/* Age variable */
	age_day = mdy(6,1,2018) - birth_dt;
	age = round(age_day/365.25);
	/* Tenure variable */
	if missing(depart_dt) then tenure_day = mdy(6,1,2018)- hire_dt;
	else tenure_day = depart_dt - hire_dt;
	tenure = round(tenure_day/365.25);
run;


/* TASK 2, QUESTION 3 */
data work.fortune_master_clean; set ana610.fortune_master_clean;
proc univariate data=work.fortune_master_clean nextrobs=10; var age tenure; histogram age tenure / normal; run;
proc means data=work.fortune_master_clean n nmiss min mean median max; var tenure; run;


/* TASK 2, QUESTION 4 */
data work.fortune_master_clean; set ana610.fortune_master_clean;
	if not missing(distancefromhome) 
	and not missing(depart_dt)
	then att_q = 1;
	else if not missing(distancefromhome)
	and missing(depart_dt)
	then att_q = 0;
	else att_q = .;
run;
proc freq data=work.fortune_master_clean; table att_q; run;
data ana610.fortune_master_clean1; set work.fortune_master_clean;


/* TASK 3, QUESTION 1 */
data work.fortune_master_clean1; set ana610.fortune_master_clean1;
/* BIN = 10 (Age+Tenure) */
/* equal height - PROC HPBIN and target-based enumeration */
proc hpbin data=work.fortune_master_clean1 numbin = 10 pseudo_quantile;
	input age tenure; ods output mapping=work.mapping; run;
/* equal height - PROC HPBIN - WOE and IV */ 
proc hpbin data=work.fortune_master_clean1 woe bins_meta=work.mapping;
	target att_q/level=nominal order=desc; run; 

/* BIN = 5 (Age) */
/* equal height - PROC HPBIN and target-based enumeration */
proc hpbin data=work.fortune_master_clean1 numbin = 5 pseudo_quantile;
	input age; ods output mapping=work.mapping; run;
/* equal height - PROC HPBIN - WOE and IV */ 
proc hpbin data=work.fortune_master_clean1 woe bins_meta=work.mapping;
	target att_q/level=nominal order=desc; run; 

/* BIN = 2 (Tenure) */
/* equal height - PROC HPBIN and target-based enumeration */
proc hpbin data=work.fortune_master_clean1 numbin = 2 pseudo_quantile;
	input tenure; ods output mapping=work.mapping; run;
/* equal height - PROC HPBIN - WOE and IV */ 
proc hpbin data=work.fortune_master_clean1 woe bins_meta=work.mapping;
	target att_q/level=nominal order=desc; run; 


/* BIN = 10 (Age+Tenure) */
/* equal width - PROC HPBIN and target-based enumeration */
proc hpbin data=work.fortune_master_clean1 numbin = 10;
	input age tenure; ods output mapping=work.mapping; run;
/* equal width - PROC HPBIN - WOE and IV */ 
proc hpbin data=work.fortune_master_clean1 woe bins_meta=work.mapping;
	target att_q/level=nominal order=desc; run; 

/* BIN = 3 (Age) */
/* equal width - PROC HPBIN and target-based enumeration */
proc hpbin data=work.fortune_master_clean1 numbin = 3;
	input age; ods output mapping=work.mapping; run;
/* equal width - PROC HPBIN - WOE and IV */ 
proc hpbin data=work.fortune_master_clean1 woe bins_meta=work.mapping;
	target att_q/level=nominal order=desc; run; 

/* BIN = 6 (Tenure) */
/* equal width - PROC HPBIN and target-based enumeration */
proc hpbin data=work.fortune_master_clean1 numbin = 6;
	input tenure; ods output mapping=work.mapping; run;
/* equal width - PROC HPBIN - WOE and IV */ 
proc hpbin data=work.fortune_master_clean1 woe bins_meta=work.mapping;
	target att_q/level=nominal order=desc; run; 




/* TASK 3, QUESTION 4 */
/* Dummy variables - Age */
data work.fortune_master_dummy; set ana610.fortune_master_clean1;
	if age < 31.0013  					then age_1to31_dum = 1;  else age_1to31_dum = 0;
	if age ge 31.0013 and age < 35.0003 then age_31to35_dum = 1; else age_31to35_dum = 0;
	if age ge 35.0003 and age < 40.0012	then age_35to40_dum = 1; else age_35to40_dum = 0;
	if age ge 40.0012 and age < 47.0016 then age_40to47_dum = 1; else age_40to47_dum = 0;
	if age ge 47.0016                 	then age_47plus_dum = 1; else age_47plus_dum = 0;
	if age in(.)                 		then age_miss_dum = 1;   else age_miss_dum = 0;
run;
%let age_dums = age_1to31_dum age_31to35_dum age_35to40_dum age_40to47_dum age_47plus_dum age_miss_dum;
proc means data=work.fortune_master_dummy n nmiss min mean max sum; var &age_dums; run;

/* Dummy variables - Tenure */
data work.fortune_master_dummy; set work.fortune_master_dummy;
	if tenure ge 0 and tenure < 7.0014  then tenure_0to7_dum = 1;   else tenure_0to7_dum = 0;
	if tenure ge 7.0014                 then tenure_7plus_dum = 1;  else tenure_7plus_dum = 0;
	if tenure in(.)                 	then tenure_miss_dum = 1;   else tenure_miss_dum = 0;
run;
%let tenure_dums = tenure_0to7_dum tenure_7plus_dum tenure_miss_dum;	
proc means data=work.fortune_master_dummy n nmiss min mean max sum; var &tenure_dums; run;
data ana610.fortune_master_dummy; set work.fortune_master_dummy;

/* Transpose - Age */
proc transpose data=work.fortune_master_dummy out=work.fortune_master_skinny1; by employee_no;
var &age_dums; 
run;
/* Tranpose - Tenure */
proc transpose data=work.fortune_master_dummy out=work.fortune_master_skinny2; by employee_no;
var &tenure_dums; 
run;

/* Check sum - Age*/ 
proc hpbin data=ana610.fortune_master_clean1 numbin = 5 pseudo_quantile;
	input age; ods output mapping=work.mapping; run;
proc means data=work.fortune_master_skinny1 n nmiss min mean max sum; 
	class _NAME_;
	var COL1; run;
/* Check sum - Tenure */
proc hpbin data=ana610.fortune_master_clean1 numbin = 2 pseudo_quantile;
	input tenure; ods output mapping=work.mapping; run;
proc means data=work.fortune_master_skinny2 n nmiss min mean max sum; 
	class _NAME_;
	var COL1; run;



/* TASK 4, QUESTION 1 */
/* AGE */
data work.fortune_master_dummy; set ana610.fortune_master_dummy;
proc corr data=work.fortune_master_dummy out=work.corr; var att_q;
	with &age_dums; run; 
/* Absolute value of the correlations */ 
data work.corr; set work.corr; where _TYPE_ in("CORR");
	rename att_q = corr;
	abs_corr = abs(att_q); run; 
/* Print the correlations (Top 25) */ 
proc sort data=work.corr; by descending abs_corr; run; 
	proc print data=work.corr (firstobs = 1 obs = 25);
		var _name_ abs_corr; run; 

/* TENURE */
data work.fortune_master_dummy; set ana610.fortune_master_dummy;
proc corr data=work.fortune_master_dummy out=work.corr; var att_q;
	with &tenure_dums; run; 
/* Absolute value of the correlations */ 
data work.corr; set work.corr; where _TYPE_ in("CORR");
	rename att_q = corr;
	abs_corr = abs(att_q); run; 
/* Print the correlations (Top 25) */ 
proc sort data=work.corr; by descending abs_corr; run; 
	proc print data=work.corr (firstobs = 1 obs = 25);
		var _name_ abs_corr; run; 



/* EXTRA CREDIT */
data work.fortune_master_clean1; set ana610.fortune_master_clean1;
proc sort data=work.fortune_master_clean1(keep=employee_no hire_dt)
          out=work.fortune_ec;
   by hire_dt;
run;


