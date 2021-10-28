**ANA 610 Homework \#1**

**Donor Solicitation Dataset**

The AnyState Veterans of Foreign Wars periodically solicits donations to
fund its various initiatives. To improve the effectiveness of their
solicitation campaigns, the VP of Marketing has asked your analytics
team to build a predictive model and score their marketing database.
Their goal is to spend resources more wisely by targeting those most
likely to donate.

The first step is to audit the data that will support this model
building effort.

The VP of Marketing has provided four (4) datasets along with a master
data dictionary “Data Dictionary – Donor.pdf.” These datasets are:

Donor\_census – as SAS file of census data linked to a donor
identification number (CONTROL\_NUMBER)

Donor\_profile – a csv file with donor demographic data

Giving\_history – a csv file with donor donation history data

Donor\_survey – a csv file with responses to a donor survey

Overall, there are data on 19,000+- individuals who had been contacted
in a veteran’s donation campaign in 1997. This file has been
pre-qualified for us; there is no further qualification required. The
target variable is TARGET\_b, which breaks the modeling (qualified)
sample into two segments: those who gave during the 1997 campaign; and
those that did not. We will explore this dataset over the course of this
class.

**Task \#1 (125 pts):** Generate a data audit report (using the audit
report template as a guide) to be shared with the VP of Marketing;
include a check of the available modeling sample size after merging all
files and application of target qualifications. To support future
modeling, your merged file should be one row per CONTROL\_NUMBER.

***Remember the “Questions” section contains questions
<span class="underline">from you</span> to the marketing department
(i.e. What questions do you have based on your audit?)***

**Homework deliverable:**

  - Task \#1:
    
      - Neatly formatted, data audit report (see template) – Word doc
    
      - SAS program with all code used for the data audit (from SAS,
        download as a SAS program)
    
      - Merged SAS datafile (download from SAS Studio)
