/* Import */
libname sasdata '/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 2';
data work.donor; set sasdata.s_pml_donor_hw_v2; run;

/* Task 1 */
/* Contents */ 
proc contents data=work.donor; run;
/* Task 1, Question 1 */
data work.donor; set work.donor;
format analysis_date origin_date first_gift_date last_gift_date median mmddyy10.;
	analysis_date = mdy(8,1,1998);
	/* 1a */ 
	origin_date = analysis_date - (months_since_origin*30.4);
	/* 1b */
	first_gift_date = analysis_date - (months_since_first_gift*30.4);
	/* 1c */
	last_gift_date = analysis_date - (months_since_last_gift*30.4);
	/* 1d */ 
	median = months_since_first_gift - months_since_last_gift;
	proc means data=work.donor n nmiss min median max; var median; run;

/* Task 1, Question 2 */
data work.donor; set work.donor;
	first_gift_date1 = year(first_gift_date1);
	last_gift_date1 = year(last_gift_date);
	origin_date1 = year(origin_date);
	/* 2a */
	proc freq data=work.donor; table origin_date1; run;
	/* 2b */
	proc sql; select last_gift_date1, avg(last_gift_amt) as last_gift_amt_avg from work.donor group by last_gift_date1; quit;
	/* 2c */
	proc freq data=work.donor; table last_gift_date1; run;
	/* 2d */
	proc means data=work.donor n nmiss min mean median max;
		class state last_gift_date1;
		var last_gift_amt; run; 

/* Task 1, Question 3 */
data work.donor; set work.donor;
	/* 3a, 3b, 3c, 3d*/
	proc univariate data=work.donor; var origin_date1; run;
	proc sgplot data=work.donor;
		vbox origin_date1; run;
		
/* Task 1, Question 4 */
data work.donor; set work.donor;	
	/* 4a */ 
	proc univariate data=work.donor; var origin_date1; run;
	/* 4b */
	proc univariate data=work.donor; var origin_date; run;
	/* 4c */
	/* (13210.4-10656.8)/365.25 = 6.99
	/* 4d */ 
	proc univariate data=work.donor; var origin_date1; run;

	
	
	
	
/* Task 2, Question 1 */
/* 1a */
proc means data=work.donor_hw2 n nmiss min mean median max; var donor_age; run;

/* 1b */
/* Import */
libname sasdata '/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 2';
data work.donor_hw2; set sasdata.s_pml_donor_hw_v2; run;

/* Macro Set Up */
%let anal_var 			= donor_age; 
%let anal_var_mi_dum 	= donor_age_dum; 
%let anal_var_mi 		= donor_age_mi;  
%let segment_var 		= median_household_income median_home_value months_since_origin;

/* create missing value indicator and a placeholder variable for imputed values */ 
data work.donor_hw2; set work.donor_hw2;
	&anal_var_mi_dum = missing(&anal_var);      /* missing creates a 1/0 flag */ 
	&anal_var_mi = &anal_var; run;				/* a duplicate of &anal_var which we will overwrite with imputed values */ 

/* Median-Value Imputation */
/* proc stdize + reponly - Impute using median */
proc stdize data=work.donor_hw2
	method=median 				
	reponly 				 /* reponly="replace only" */
	out=work.donor_imputed;
	var &anal_var_mi; run;	 /* MV will be overwritten with imputed value */
/* check final stats */
proc means data=work.donor_imputed n nmiss mean median; var &anal_var &anal_var_mi; run;
proc univariate data=work.donor_imputed; var &anal_var &anal_var_mi;
	histogram &anal_var &anal_var_mi; run;
/* histogram */
proc sgplot data=work.donor_imputed;
	histogram &anal_var / binwidth=5 transparency=.5;
	histogram &anal_var_mi / binwidth=5 transparency=.5; run;


/* Median-Value Segmentation Imputation */
/* Segment imputation using PROC RANK which creates groups. */
proc rank data=work.donor_hw2 out=work.donor_rank groups=12; 
	var median_household_income;
	ranks medianhhinc_grp;   /* creates new group */
run;
/* calculate the median for each group */
proc means data=work.donor_rank median;
	class medianhhinc_grp;
	var &anal_var_mi; run;
/* SORT first, then IMPUTE */
proc sort data=work.donor_rank; by medianhhinc_grp; run;
proc stdize data=work.donor_rank
	method=median
	reponly
	out=work.imputed2;
	var &anal_var_mi;
	by medianhhinc_grp; run; 
/* check final stats */
proc means data=work.imputed2 median mean;
	class medianhhinc_grp;
	var &anal_var &anal_var_mi; run;
/* check using histogram - original vs. imputed */
proc univariate data=work.imputed2; var &anal_var &anal_var_mi;
	histogram &anal_var &anal_var_mi; run;
/* histogram */
proc sgplot data=work.imputed2;
	histogram &anal_var / binwidth=5 transparency=.5;
	histogram &anal_var_mi / binwidth=5 transparency=.5; run;


/* Hot-Deck Imputation */
/* proc surveyimpute does the hot decking */
proc surveyimpute data=work.donor_hw2 seed=12345 method=hotdeck(selection=srswr);
	var &anal_var_mi &segment_var;
	output out=work.imputed3; run;
/* check final stats */
proc means data=work.imputed3 n nmiss median mean;
	var &anal_var &anal_var_mi; run;
proc univariate data=work.imputed3; var &anal_var &anal_var_mi;
	histogram &anal_var &anal_var_mi; run;
/* histogram */ 
proc sgplot data=work.imputed3;
	histogram &anal_var / binwidth=5 transparency=.5;
	histogram &anal_var_mi / binwidth=5 transparency=.5; run;


/* Stochastic Imputation */
proc mi data=work.donor_hw2 nimpute=1 seed=12345 out=work.imputed4;
	fcs nbiter=1;					/* regression method; NBITER ensures 1 set of imputed date */
	var &anal_var_mi &segment_var;	/* regression of mmbal on other variables with non missing */ run;
proc univariate data=work.imputed4; var &anal_var &anal_var_mi;
	histogram &anal_var &anal_var_mi; run;
/* histogram */
proc sgplot data=work.imputed4;
	histogram &anal_var / binwidth=5 transparency=.5;
	histogram &anal_var_mi / binwidth=5 transparency=.5; run;


/* Task 2, Question 2 */
/* 2a */
/* Import */
libname sasdata '/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 2';
data work.donor_hw2a; set sasdata.s_pml_donor_hw_v2; run;
/* Macro Set Up */
%let anal_var1 			= wealth_rating; 
%let anal_var_mi_dum1 	= wealth_rating_dum; 
%let anal_var_mi1		= wealth_rating_mi; 
data work.donor_hw2a; set work.donor_hw2a;
	&anal_var_mi_dum1 = missing(&anal_var1); 
	&anal_var_mi1 = &anal_var1; run;
/* original distribution */ 
proc freq data=work.donor_hw2a; tables &anal_var1; run; 
/* check calculation */ 
proc freq data=work.donor_hw2a; 
	tables &anal_var1 &anal_var_mi1; run; 
/* estimate/output mode of observed values*/ 
proc means data=work.donor_hw2a mode; var &anal_var_mi1; 
	where not missing(&anal_var_mi1); 
	output out=work.mode mode=mode; run; 
/* put mode value into a macro variable */ 
proc sql; select mode into : mode separated by ' ' from work.mode; quit;
/* impute using mode (PROC STDIZE does not have METHOD=MODE) */ 
proc stdize data=work.donor_hw2a 
	missing=&mode 
	reponly 
	out=work.imputed5; 
	var &anal_var_mi1; run;
/* check final stats */ 
proc freq data=work.imputed5; tables &anal_var1 &anal_var_mi1; run;
/* histogram */
proc sgplot data=work.imputed5; 
	histogram &anal_var1 / binwidth=1 transparency=.5; 
	histogram &anal_var_mi1 / binwidth=1 transparency=.5; run;
/* 2c */
libname sasdata '/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 2';
data work.donor_hw2c; set sasdata.s_pml_donor_hw_v2;
	if missing(wealth_rating) then wealth_rating=999; run; 
proc freq data=work.donor_hw2c; tables wealth_rating; run;



/* Extra Credit */
/* Extra Credit, Question 1 */
libname sasdata '/home/u50066252/my_shared_file_links/kevinduffy-deno1/Homework 2';
data work.donor_EC; set sasdata.s_pml_donor_hw_v2;
%let anal_var = lifetime_gift_amount;
proc univariate data=work.donor_EC
	nextrobs=10;
	var &anal_var;
	histogram &anal_var / normal;
run;

/* Extra Credit - Question 2 */
data work.donor_EC; set work.donor_EC;
%let anal_var = lifetime_gift_amount;
	if &anal_var > 0 then do; 
		square_anal_var 	= (&anal_var)**2;
		sqrt_anal_var 		= sqrt(&anal_var);
		inv_anal_var 		= 1/(&anal_var); 
		inv_sqrt_anal_var 	= 1/sqrt_anal_var;
		inv_square_anal_var	= 1/square_anal_var;
		log_anal_var 		= log(&anal_var); 
	end; 
	else do; 
		square_anal_var 	= 0;
		sqrt_anal_var 		= 0;
		inv_anal_var 		= 0; 
		inv_sqrt_anal_var 	= 0;
		inv_square_anal_var	= 0;
		log_anal_var 		= 0;
	end; 
run; 

proc univariate data=work.donor_EC nextrobs=10 normal;
	var square_anal_var sqrt_anal_var inv_anal_var inv_sqrt_anal_var inv_square_anal_var log_anal_var; 
	histogram square_anal_var sqrt_anal_var inv_anal_var inv_sqrt_anal_var inv_square_anal_var log_anal_var / normal; 
run; 



