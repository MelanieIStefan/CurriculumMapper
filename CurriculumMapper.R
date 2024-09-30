# load librarise
library(ggplot2)

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

curriculumMap <- data.frame(matrix(nrow=0,ncol=5))
names(curriculumMap) <- c("LV", "LV Name", "Lernziel", "Lernziel Lang", "behandelt")


for (i in 1:nrow(classes)) {
# for testing
# for (i in 1:3) {
  print("*********************")
  print(paste(classes[i,1]," - ", classes[i,2], sep=""))
  print("*********************")

for (j in 1:nrow(learningObjectives)){
# for testing
# for (j in 1:2){
    print(learningObjectives[j,2])
    x <- readline("Wurde diese Ziel eingeführt (e), verstärkt (v), geprüft (p) oder nicht behandelt (n)? ")
    b="0"
    if (x=="e"){
      b="e"
    } else if (x=="v"){
      b="v"
    }  else if (x=="p"){
      b="p"
    }
    mapRow <- c(classes[i,1],classes[i,2],learningObjectives[j,1],learningObjectives[j,2],b)
    curriculumMap[nrow(curriculumMap)+1,] <- mapRow
  }
}

# Save to make sure
write.csv(curriculumMap,"CurriculumMap.csv")

curriculumMapPlot <- read.csv("CurriculumMap.csv")


# plot works, just make it prettier!

ggplot(curriculumMapPlot, mapping=aes(LV,Lernziel,fill=behandelt, label=behandelt)) +
          geom_tile() +
          geom_text(col = "black") +
          theme_minimal()

        

