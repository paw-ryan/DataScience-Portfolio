**Data Audit Report**

Prepared by

Ryan Paw

In support of

Predictive model to score a marketing database

Requested by

VP of Marketing

October 31, 2020

**Introduction**

The analytical team has been asked by VP of Marketing to build a
predictive model to build a predictive model and score their marketing
database. Their goal is to spend resources more wisely by targeting
those most likely to donate. The deliverable will be a scored marketing
file.

The target variable is TARGET\_B, which breaks the modeling (qualified)
sample into two segments: those who gave during the 1997 campaign; and
those that did not.

1.  Yes (1): those who gave donations during the 1997 campaign

2.  No (0): those who did not give donations during the 1997 campaign

The timeline for this project is as follows:

| **Milestone**                   | **Timeline** |
| ------------------------------- | ------------ |
| Data Audit/Aggregation          | Week 1       |
| Data Cleansing and Preparation  | Week 2 - 3   |
| Modeling Construction           | Week 4       |
| Scoring of Marketing File       | Week 5       |
| Marketing Campaign Commencement | Week 6       |

*It is essential that the analytical team has a full understanding of
the quality and quantity of data provided to it in support of the
analytical request.*

*Hence, the purpose of this data audit is to ensure that:*

  - *all data received by the analytical team for the project are
    consistent with the team’s understanding of the requested analytical
    deliverable;*

  - *that the team is reading and interpreting these data correctly;*

  - *that the team has received all data intended to be supplied;*

  - *that the data are functionally usable for modeling purposes.*

*The data audit is broken into four main sections:*

1.  *Data File Summary – A list and description of all data files
    received.*

2.  *Data File Detail – For each data file, tables showing all data
    variables received. It is important that this section be reviewed to
    ensure that the analytical team has all the data sent, the data are
    being read correctly and the data have reasonable values.*

3.  *Modeling Sample – Based on the requestor’s sample requirements, a
    determination is necessary as to whether adequate sample is
    available to support modeling.*

4.  *Questions – Specific questions that the analytical team needs
    answered to ensure that the team fully understands the data and that
    the data can support the requested analytical deliverable.*

**Data File Summary**

*The analytical team has received 4 data files from the VP of Marketing
as listed in Table 1.*

Table 1. Data Files Received

<table>
<thead>
<tr class="header">
<th><em>Filename</em></th>
<th><em>File Type</em></th>
<th><em>File Contents</em></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><em>donor_census</em></td>
<td><em>.sas7bdat</em></td>
<td><p><em>as SAS file of census data linked to a donor identification number</em></p>
<p><em>(CONTROL_NUMBER)</em></p></td>
</tr>
<tr class="even">
<td><em>donor_profile</em></td>
<td><em>.csv</em></td>
<td><em>a csv file with donor demographic data</em></td>
</tr>
<tr class="odd">
<td><em>donor_survey</em></td>
<td><em>.csv</em></td>
<td><em>a csv file with donor donation history data</em></td>
</tr>
<tr class="even">
<td><em>giving_history</em></td>
<td><em>.csv</em></td>
<td><em>a csv file with responses to a donor survey</em></td>
</tr>
</tbody>
</table>

**Data File Detail**

Each data file contains the data fields as shown in the following
tables.

***Data File \#1:*** donor\_census

***File Contents:*** CONTROL\_NUMBER, MEDIAN\_HOME\_VALUE,
MEDIAN\_HOUSEHOLD\_INCOME, PCT\_MALE\_MILITARY, PCT\_WWII\_VETERANS,
PCT\_MALE\_VETERANS, PCT\_OWNER\_OCCUPIED, PCT\_VIETNAM\_VETERANS,
PER\_CAPITA\_INCOME, STATE, WEALTH\_RATING

***Records:*** 19372

Table 2. Numeric Data

| **Field Name**            | **Count** | **Missing** | **Minimum** | **Mean** | **Median** | **Maximum** |
| ------------------------- | --------- | ----------- | ----------- | -------- | ---------- | ----------- |
| MEDIAN\_HOME\_VALUE       | 19,372    | 0           | 0           | 1,080    | 747        | 6000        |
| MEDIAN\_HOUSEHOLD\_INCOME | 19,372    | 0           | 0           | 342      | 311        | 1500        |
| PCT\_MALE\_MILITARY       | 19,372    | 0           | 0           | 1        | 0          | 97          |
| PCT\_WWII\_VETERANS       | 19,372    | 0           | 0           | 33       | 32         | 99          |
| PCT\_MALE\_VETERANS       | 19,372    | 0           | 0           | 31       | 31         | 99          |
| PCT\_OWNER\_OCCUPIED      | 19,372    | 0           | 0           | 70       | 76         | 99          |
| PCT\_VIETNAM\_VETERANS    | 19,372    | 0           | 0           | 30       | 29         | 99          |
| PER\_CAPITA\_INCOME       | 19,372    | 0           | 0           | 15,857   | 13816.5    | 174523      |

Table 3. Categorical Data

| ** **          | ** **       | **Frequency** |           |             |
| -------------- | ----------- | ------------- | --------- | ----------- |
| **Field Name** | **Missing** | **Value**     | **Count** | **Percent** |
| STATE          | 1526        | AK            | 423       | 2.37        |
|                |             | AL            | 369       | 2.07        |
|                |             | AR            | 341       | 1.91        |
|                |             | AZ            | 365       | 2.05        |
|                |             | CA            | 391       | 2.19        |
|                |             | CO            | 360       | 2.02        |
|                |             | CT            | 376       | 2.11        |
|                |             | DC            | 334       | 1.87        |
|                |             | DE            | 406       | 2.28        |
|                |             | FL            | 387       | 2.17        |
|                |             | GA            | 341       | 1.91        |
|                |             | HI            | 367       | 2.06        |
|                |             | IA            | 372       | 2.08        |
|                |             | ID            | 360       | 2.02        |
|                |             | IL            | 379       | 2.12        |
|                |             | IN            | 425       | 2.38        |
|                |             | KS            | 379       | 2.12        |
|                |             | KY            | 412       | 2.31        |
|                |             | LA            | 381       | 2.13        |
|                |             | MA            | 393       | 2.2         |
|                |             | MD            | 395       | 2.21        |
|                |             | ME            | 423       | 2.37        |
|                |             | MI            | 395       | 2.21        |
|                |             | MN            | 383       | 2.15        |
|                |             | MO            | 375       | 2.1         |
|                |             | MS            | 377       | 2.11        |
|                |             | MT            | 401       | 2.25        |
|                |             | NC            | 402       | 2.25        |
|                |             | ND            | 398       | 2.23        |
|                |             | NE            | 386       | 2.16        |
|                |             | NH            | 381       | 2.13        |
|                |             | NJ            | 391       | 2.19        |
|                |             | NM            | 413       | 2.31        |
|                |             | NV            | 398       | 2.23        |
|                |             | NY            | 376       | 2.11        |
|                |             | OH            | 365       | 2.05        |
|                |             | OK            | 403       | 2.26        |
|                |             | OR            | 388       | 2.17        |
|                |             | PA            | 408       | 2.29        |
|                |             | RI            | 382       | 2.14        |
|                |             | SC            | 396       | 2.22        |
|                |             | SD            | 381       | 2.13        |
|                |             | TN            | 427       | 2.39        |
|                |             | TX            | 371       | 2.08        |
|                |             | UT            | 438       | 2.45        |
|                |             | VT            | 432       | 2.42        |
| WEALTH\_RATING | 8810        | 0             | 669       | 6.33        |
|                |             | 1             | 854       | 8.09        |
|                |             | 2             | 974       | 9.22        |
|                |             | 3             | 1,046     | 9.9         |
|                |             | 4             | 987       | 9.34        |
|                |             | 5             | 1,078     | 10.21       |
|                |             | 6             | 1,117     | 10.58       |
|                |             | 7             | 1,199     | 11.35       |
|                |             | 8             | 1,248     | 11.82       |
|                |             | 9             | 1,390     | 13.16       |

Table 4. Character Data

| ** **           | **Length of Character Field** |             |             |          |            |             |
| --------------- | ----------------------------- | ----------- | ----------- | -------- | ---------- | ----------- |
| **Field Name**  | **Count**                     | **Missing** | **Minimum** | **Mean** | **Median** | **Maximum** |
| CONTROL\_NUMBER | 19,372                        | 0           | 8.00        | 8.00     | 8          | 8           |

***Data File \#2:*** donor\_profile

***File Contents:*** CONTROL\_NUMBER, CLUSTER\_CODE, DONOR\_AGE,
INCOME\_GROUP, RECENT\_STAR\_STATUS, DONOR\_GENDER, HOME\_OWNER,
OVERLAY\_SOURCE, PUBLISHED\_PHONE, SES, URBANICITY

***Records:*** 19372

Table 5. Numeric Data

| **Field Name** | **Count** | **Missing** | **Minimum** | **Mean**   | **Median** | **Maximum** |
| -------------- | --------- | ----------- | ----------- | ---------- | ---------- | ----------- |
| CLUSTER\_CODE  | 18918     | 454         | 1           | 27.8616133 | 28         | 53          |
| DONOR\_AGE     | 14577     | 4795        | 0           | 58.9190506 | 60         | 87          |

Table 6. Categorical Data

| ** **                | ** **       | **Frequency** |           |             |
| -------------------- | ----------- | ------------- | --------- | ----------- |
| **Field Name**       | **Missing** | **Value**     | **Count** | **Percent** |
| DONOR\_GENDER        | 0           | A             | 1         | 0.01        |
|                      |             | F             | 10401     | 53.69       |
|                      |             | M             | 7953      | 41.05       |
|                      |             | U             | 1017      | 5.25        |
| HOME\_OWNER          | 0           | 10606         | 54.75     | 10606       |
|                      |             | 8766          | 45.25     | 19372       |
| OVERLAY\_SOURCE      | 0           | B             | 8732      | 45.08       |
|                      |             | M             | 1480      | 7.64        |
|                      |             | N             | 4392      | 22.67       |
|                      |             | P             | 4768      | 24.61       |
| PUBLISHED\_PHONE     | 0           | 0             | 9730      | 50.23       |
|                      |             | 1             | 9642      | 49.77       |
| SES                  | 0           | 1             | 5924      | 30.58       |
|                      |             | 2             | 9284      | 47.92       |
|                      |             | 3             | 3323      | 17.15       |
|                      |             | 4             | 387       | 2           |
|                      |             | ?             | 454       | 2.34        |
| URBANICITY           | 0           | ?             | 454       | 2.34        |
|                      |             | C             | 4022      | 20.76       |
|                      |             | R             | 4005      | 20.67       |
|                      |             | S             | 4491      | 23.18       |
|                      |             | T             | 3944      | 20.36       |
|                      |             | U             | 2456      | 12.68       |
| INCOME\_GROUP        | 4392        | 1             | 1822      | 12.16       |
|                      |             | 2             | 2626      | 17.53       |
|                      |             | 3             | 1699      | 11.34       |
|                      |             | 4             | 2526      | 16.86       |
|                      |             | 5             | 3149      | 21.02       |
|                      |             | 6             | 1591      | 10.62       |
|                      |             | 7             | 1567      | 10.46       |
| RECENT\_STAR\_STATUS | 0           | 0             | 13239     | 68.34       |
|                      |             | 1             | 4289      | 22.14       |
|                      |             | 2             | 26        | 0.13        |
|                      |             | 3             | 346       | 1.79        |
|                      |             | 4             | 320       | 1.65        |
|                      |             | 5             | 205       | 1.06        |
|                      |             | 6             | 88        | 0.45        |
|                      |             | 7             | 140       | 0.72        |
|                      |             | 8             | 54        | 0.28        |
|                      |             | 9             | 15        | 0.08        |
|                      |             | 10            | 86        | 0.44        |
|                      |             | 11            | 183       | 0.94        |
|                      |             | 12            | 122       | 0.63        |
|                      |             | 13            | 84        | 0.43        |
|                      |             | 14            | 61        | 0.31        |
|                      |             | 15            | 26        | 0.13        |
|                      |             | 16            | 18        | 0.09        |
|                      |             | 17            | 15        | 0.08        |
|                      |             | 18            | 12        | 0.06        |
|                      |             | 19            | 27        | 0.14        |
|                      |             | 20            | 4         | 0.02        |
|                      |             | 21            | 10        | 0.05        |
|                      |             | 22            | 2         | 0.01        |

Table 7. Character Data

| ** **           | **Length of Character Field** |             |             |          |            |             |
| --------------- | ----------------------------- | ----------- | ----------- | -------- | ---------- | ----------- |
| **Field Name**  | **Count**                     | **Missing** | **Minimum** | **Mean** | **Median** | **Maximum** |
| CONTROL\_NUMBER | 19,372                        | 0           | 12.00       | 12.00    | 12         | 12          |

***Data File \#3:*** donor\_survey

***File Contents:*** CONTROL\_NUMBER, survey\_question, survey\_value

***Records:*** 58116

Table 8. Numeric Data

| **Field Name** | **Count** | **Missing** | **Minimum** | **Mean**  | **Median** | **Maximum** |
| -------------- | --------- | ----------- | ----------- | --------- | ---------- | ----------- |
| survey\_value  | 58116     | 0           | 0           | 4.0364788 | 4          | 10          |

Table 9. Categorical Data

| ** **            | ** **       | **Frequency**               |           |             |
| ---------------- | ----------- | --------------------------- | --------- | ----------- |
| **Field Name**   | **Missing** | **Value**                   | **Count** | **Percent** |
| survey\_question | 0           | causes donated to last year | 19372     | 33.33       |
|                  |             | familiarity with programs   | 19372     | 33.33       |
|                  |             | willingness to recommend    | 19372     | 33.33       |

Table 10. Character Data

| ** **           | **Length of Character Field** |             |             |          |            |             |
| --------------- | ----------------------------- | ----------- | ----------- | -------- | ---------- | ----------- |
| **Field Name**  | **Count**                     | **Missing** | **Minimum** | **Mean** | **Median** | **Maximum** |
| CONTROL\_NUMBER | 58116                         | 0           | 12.00       | 12.00    | 12         | 12          |

***Data File \#4:*** giving\_history

***File Contents:***

CONTROL\_NUMBER, TARGET\_D, MONTHS\_SINCE\_ORIGIN, MOR\_HIT\_RATE,
RECENT\_RESPONSE\_PROP,
RECENT\_AVG\_GIFT\_AMT,RECENT\_AVG\_CARD\_GIFT\_AMT,
RECENT\_CARD\_RESPONSE\_PROP, RECENT\_RESPONSE\_COUNT,
RECENT\_CARD\_RESPONSE\_COUNT, MONTHS\_SINCE\_LAST\_PROM\_RESP,
LIFETIME\_CARD\_PROM, LIFETIME\_PROM, LIFETIME\_GIFT\_AMOUNT,
LIFETIME\_GIFT\_COUNT, LIFETIME\_AVG\_GIFT\_AMT, LIFETIME\_GIFT\_RANGE,
LIFETIME\_MAX\_GIFT\_AMT, LIFETIME\_MIN\_GIFT\_AMT, LAST\_GIFT\_AMT,
CARD\_PROM\_12, NUMBER\_PROM\_12, MONTHS\_SINCE\_LAST\_GIFT,
MONTHS\_SINCE\_FIRST\_GIFT, TARGET\_B, IN\_HOUSE, PEP\_STAR,
RECENCY\_STATUS\_96NK, FREQUENCY\_STATUS\_97NK

***Records:*** 19372

Table 11. Numeric Data

| **Variable**                    | **Count** | **Missing** | **Minimum** | **Mean**    | **Median** | **Maximum** |
| ------------------------------- | --------- | ----------- | ----------- | ----------- | ---------- | ----------- |
| MONTHS\_SINCE\_ORIGIN           | 19372     | 0           | 5           | 73.4099732  | 65         | 137         |
| MOR\_HIT\_RATE                  | 19372     | 0           | 0           | 3.361656    | 0          | 241         |
| RECENT\_RESPONSE\_PROP          | 19372     | 0           | 0           | 0.1901275   | 0.167      | 1           |
| RECENT\_AVG\_GIFT\_AMT          | 19372     | 0           | 0           | 15.3653959  | 14         | 260         |
| RECENT\_CARD\_RESPONSE\_PROP    | 19372     | 0           | 0           | 0.2308077   | 0.2        | 1           |
| RECENT\_RESPONSE\_COUNT         | 19372     | 0           | 0           | 3.0431034   | 3          | 16          |
| RECENT\_CARD\_RESPONSE\_COUNT   | 19372     | 0           | 0           | 1.7305389   | 1          | 9           |
| MONTHS\_SINCE\_LAST\_PROM\_RESP | 19126     | 246         | \-12        | 19.0388999  | 18         | 36          |
| LIFETIME\_CARD\_PROM            | 19372     | 0           | 2           | 18.6680776  | 18         | 56          |
| LIFETIME\_PROM                  | 19372     | 0           | 5           | 47.5705141  | 47         | 194         |
| LIFETIME\_GIFT\_AMOUNT          | 19372     | 0           | 15          | 104.4257165 | 79         | 3775        |
| LIFETIME\_GIFT\_COUNT           | 19372     | 0           | 1           | 9.9797646   | 8          | 95          |
| LIFETIME\_AVG\_GIFT\_AMT        | 19372     | 0           | 1.36        | 12.8583383  | 11.2       | 450         |
| LIFETIME\_GIFT\_RANGE           | 19372     | 0           | 0           | 11.5878758  | 10         | 997         |
| LIFETIME\_MAX\_GIFT\_AMT        | 19372     | 0           | 5           | 19.2088081  | 16         | 1000        |
| LIFETIME\_MIN\_GIFT\_AMT        | 19372     | 0           | 0           | 7.6209323   | 5          | 450         |
| LAST\_GIFT\_AMT                 | 19372     | 0           | 0           | 16.5841988  | 15         | 450         |
| CARD\_PROM\_12                  | 19372     | 0           | 0           | 5.3671278   | 6          | 17          |
| NUMBER\_PROM\_12                | 19372     | 0           | 2           | 12.9018687  | 12         | 64          |
| MONTHS\_SINCE\_LAST\_GIFT       | 19372     | 0           | 4           | 18.1911522  | 18         | 27          |
| RECENT\_AVG\_CARD\_GIFT\_AMT    | 19372     | 0           | 0           | 11.6854703  | 10.14      | 300         |
| MONTHS\_SINCE\_FIRST\_GIFT      | 19372     | 0           | 15          | 69.4820875  | 65         | 260         |
| TARGET\_D                       | 4843      | 14529       | 1           | 15.6243444  | 13         | 200         |

Table 12. Categorical Data

| ** **                   | ** **       | **Frequency** |           |             |
| ----------------------- | ----------- | ------------- | --------- | ----------- |
| **Field Name**          | **Missing** | **Value**     | **Count** | **Percent** |
| TARGET\_B               | 0           | 0             | 14529     | 75          |
|                         |             | 1             | 4843      | 25          |
| IN\_HOUSE               | 0           | 0             | 17954     | 92.68       |
|                         |             | 1             | 1418      | 7.32        |
| PEP\_STAR               | 0           | 0             | 9600      | 49.56       |
|                         |             | 1             | 9772      | 50.44       |
| RECENCY\_STATUS\_96NK   | 0           | A             | 11918     | 61.52       |
|                         |             | E             | 427       | 2.2         |
|                         |             | F             | 1521      | 7.85        |
|                         |             | L             | 93        | 0.48        |
|                         |             | N             | 1192      | 6.15        |
|                         |             | S             | 4221      | 21.79       |
| FREQUENCY\_STATUS\_97NK | 0           | 1             | 9118      | 47.07       |
|                         |             | 2             | 4191      | 21.63       |
|                         |             | 3             | 3318      | 17.13       |
|                         |             | 4             | 2745      | 14.17       |

Table 13. Character Data

| ** **           | **Length of Character Field** |             |             |          |            |             |
| --------------- | ----------------------------- | ----------- | ----------- | -------- | ---------- | ----------- |
| **Field Name**  | **Count**                     | **Missing** | **Minimum** | **Mean** | **Median** | **Maximum** |
| CONTROL\_NUMBER | 19,372                        | 0           | 12.00       | 12.00    | 12         | 12          |

**Qualified Sample**

| **Segment**                                                       | **Count** |
| ----------------------------------------------------------------- | --------- |
| TARGET\_B                                                         |           |
| Yes (1): those who gave donations during the 1997 campaign        | 4843      |
| No (0): those who did not give donations during the 1997 campaign | 14529     |
|                                                                   |           |
| **Total qualified (target) sample**                               | 19372     |
|                                                                   |           |
| **Total records in dataset**                                      | 19372     |

Note – the qualified (target) sample and breakout by segment is adequate
for model construction.

**Questions**

1.  Does the above information appear to be correct? Specifically:
    
      - *Does the analytical team have all the data that was meant to be
        sent?*
        
          - *Yes, the analytical team has all the data that was sent.
            However, the data audit identified a total of 25,111 missing
            values in this dataset.*
    
      - *Is the team interpreting the data correctly?*
        
          - *Yes, the analytical team is interpreting the data
            correctly.*
    
      - *Do the data appear to have reasonable values?*
        
          - *For the most part, yes, the data did appear to have
            reasonable values. There were a few values that looked odd.*
            
              - *“MONTHS\_SINCE\_LAST\_PROM\_RESP” in
                giving\_history\_csv has a minimum value of “-12”.*
            
              - “URBANICITY” in the donor\_profile.csv has a 454 counts
                of “?”.

2.  *Here is a list of the data integrity issues the analytical team
    uncovered:*

<!-- end list -->

  - *“State” in donor\_census.sas has 1,526 missing cases (2.37%)*

  - *“WEALTH\_RATING” in donor\_census.sas has 8,810 missing cases
    (6.33%)*

  - *Missing cases in donor\_profile.csv for CLUSTER\_CODE (454 cases),
    DONOR\_AGE (4795 cases), and INCOME\_GROUP (4392 cases)*

  - *“MONTHS\_SINCE\_LAST\_PROM\_RESP” in giving\_history.csv has 246
    missing cases*

  - *“MONTHS\_SINCE\_LAST\_PROM\_RESP” in giving\_history.csv has a
    minimum value of “-12”. Not sure if this negative number accurately
    reflects the number of months.*

  - *“TARGET\_D” in giving\_history.csv has 14,529 missing cases*

<!-- end list -->

3.  The following are specific questions the analytical team has about
    the data:

<!-- end list -->

  - “URBANICITY” in the donor\_profile.csv has a 454 counts of “?”. What
    does this mean?

  - *“MONTHS\_SINCE\_LAST\_PROM\_RESP” in giving\_history.csv had a
    minimum value of “-12”. What does this mean?*

  - How long was the data collection period for this dataset?

  - Would data from additional time periods expand our data and our
    target customer?

  - Are there additional data fields available to increase the target
    customer predictor pool?
