# Upload file with Learning Objectives:
# Requirements: 
# - .csv file 
# - one line per learning objective,
# - Column 1: Short code,
# - Column 2: Full description,
# - Column 3+: Additional Information


learningObjectives <- read.csv("~/Dokumente/Wissenschaftliches_Arbeiten/Lernziele.csv",header=FALSE)
head(learningObjectives)

# Upload file with Classes:
# Requirements: 
# - .csv file  
# - one line per class
# Column 1: Class code,
# Column 2: Class name,
# Column 3+: Additional Information

classes <- read.csv("~/Dokumente/Wissenschaftliches_Arbeiten/Liste_Lehrveranstaltungen.csv",header=FALSE)
head(classes)


