/* Contents */
proc contents data=ana625.cdbrfs10_filtered; run;


/* Question 1 */
proc freq data=ana625.cdbrfs10_filtered; tables sex_1 exerany2_1 _bmi4cat diabete2_1; run;


/* Question 2 */
proc freq data=ana625.cdbrfs10_filtered;
	tables (exerany2_1 sex_1 _bmi4cat)*diabete2_1 / chisq; 
run;


/* Question 6 */
proc logistic data=ana625.cdbrfs10_filtered descending; 
	class diabete2_1 (ref='0') exerany2_1 (ref='0') sex_1 (ref='0') _bmi4cat (ref='1') / param=reference; 
	model diabete2_1 = sex_1 exerany2_1 _bmi4cat; 
run;


proc logistic data=ana625.cdbrfs10_filtered descending; 
	class diabete2_1 (ref='0') exerany2_1 (ref='0') sex_1 (ref='0') _bmi4cat (ref='1') / param=reference; 
	model diabete2_1 = sex_1 exerany2_1 _bmi4cat / aggregate scale=none lackfit;
run;


/* Extra Credit */ 
proc logistic data=ana625.cdbrfs10_filtered descending; 
	class diabete2_1 (ref='0') exerany2_1 (ref='0') sex_1 (ref='0') _bmi4cat (ref='1') / param=reference; 
	model diabete2_1 = sex_1 exerany2_1 _bmi4cat sex_1*exerany2_1 sex_1*_bmi4cat exerany2_1*_bmi4cat sex_1*exerany2_1*_bmi4cat / aggregate scale=none lackfit;
run;

proc logistic data=ana625.cdbrfs10_filtered descending; 
	class diabete2_1 (ref='0') exerany2_1 (ref='0') sex_1 (ref='0') _bmi4cat (ref='1') / param=reference; 
	model diabete2_1 = sex_1 exerany2_1 _bmi4cat sex_1*exerany2_1 sex_1*_bmi4cat sex_1*exerany2_1*_bmi4cat / aggregate scale=none lackfit;
run;
