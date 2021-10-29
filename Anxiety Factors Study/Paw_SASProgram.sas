data anxiety (type=cov);
	infile cards missover;
	input _type_ $ _name_ $ ten1 ten2 ten3 wor1 wor2 wor3 
							irthk1 irthk2 irthk3 body1 body2 body3;

cards;
COV TEN1 .7821
COV TEN2 .5602 .9299
COV TEN3 .5695 .6281 .9751
COV WOR1 .1969 .2599 .2362 .6352
COV WOR2 .2289 .2835 .3079 .4575 .7943
COV WOR3 .2609 .3670 .3575 .4327 .4151 .6783
COV IRTHK1 .0556 .0740 .0981 .2094 .2306 .2503 .6855
COV IRTHK2 .0025 .0279 .0798 .2047 .2270 .2257 .4224 .6952
COV IRTHK3 .0180 .0753 .0744 .1892 .2352 .2008 .4343 .4514 .6065
COV BODY1 .1617 .1919 .2892 .1376 .1744 .1845 .0645 .0731 .0921 .4068
COV BODY2 .2628 .3047 .4043 .1742 .2066 .2547 .1356 .1336 .1283 .1958 .7015
COV BODY3 .2966 .3040 .3919 .1942 .1864 .2402 .1073 .0988 .0599 .2233 .3033 .5786
;



PROC CALIS DATA=ANXIETY COVARIANCE RESIDUAL MODIFICATION
NOBS=318;
LINEQS
     TEN1   = L11 F1 + E1,
     TEN2   = L21 F1 + E2,
     TEN3   = L31 F1 + E3,
     WOR1   = L12 F2 + E4,
     WOR2   = L22 F2 + E5,
     WOR3   = L32 F2 + E6,
     IRTHK1 = L13 F3 + E7,
     IRTHK2 = L23 F3 + E8,
     IRTHK3 = L33 F3 + E9,
     BODY1  = L14 F4 + E10,
     BODY2  = L24 F4 + E11,
     BODY3  = L34 F4 + E12;
   VARIANCE
     E1 - E12 = VARE1-VARE12,
     F1 = 1.0,
     F2 = 1.0,
     F3 = 1.0,
     F4 = 1.0;
   COV
     F1 F2 = COV12,
     F1 F3 = COV13,
     F1 F4 = COV14,
     F2 F3 = COV23,
     F2 F4 = COV24,
     F3 F4 = COV34;
RUN; 



