# Upload file with Learning Objectives:
# Change file path to your own
# Requirements: 
# - .csv file 
# - one line per learning objective,
# - Column 1: Short code,
# - Column 2: Full description,
# - Column 3+: Additional Information


learningObjectives <- read.csv("~/Dokumente/Wissenschaftliches_Arbeiten/Lernziele.csv",header=FALSE,)
learningObjectives <- learningObjectives[learningObjectives[,1]!="",1:2]
nrow(learningObjectives)


# Upload file with Classes:
# Change file path to your own
# Requirements: 
# - .csv file  
# - one line per class
# Column 1: Class code,
# Column 2: Class name,
# Column 3+: Additional Information

# import classes file, ignore empty rows and colums past 2
classes <- read.csv("~/Dokumente/Wissenschaftliches_Arbeiten/Liste_Lehrveranstaltungen.csv",header=FALSE)
classes <- classes[classes[,1]!="",1:2]
nrow(classes)
c



# for (i in 1:nrow(classes)) {
for (i in 1:3) {
  print(paste(classes[i,1]," - ", classes[i,2], sep=""))
  print("Wurden folgende Lernziele in dieser LV ...")
  
#  for (j in 1:nrow(learningObjectives)){
  for (j in 1:2){
    print(learningObjectives[j,2])
    x <- readline("eingeführt (e), verstärkt (v), geprüft (p) oder nicht behandelt (n)? ")  
    e=0
    r=0
    a=0
    if (x=="e"){
    e=1  
    } else if (x=="r"){
      r=1
    }  else if (x=="a"){
      a=1
    }
    mapRow <- c(classes[i,1],classes[i,2],learningObjectives[j,2],learningObjectives[j,2],e,r,a)
    curriculumMap[nrow(curriculumMap)+1,] <- mapRow
  }
}



