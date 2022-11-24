library(readxl)

Data <- read_excel("AirBnb_tutorial_Data.xlsx")

Data
View(Data)

#track id is made primary key
file1 <- Data[ , c(1:6)]
file2 <- Data[ , c(1,7:12)]
View(file1)
View(file2)

file2 <- subset(file2, select = - Number_of_Records)
file2

colSums(is.na(file1))
colSums(is.na(file2))

file1 <- file1[!is.na(file1$Property_Type), ]
file2 <- file2[!is.na(file2$Zipcode), ]

beds <- file2$Beds[!is.na(file2$Beds)]
mean_bed = mean(beds)
file2$Beds[is.na(file2$Beds)] <- ceiling(mean_bed)

Ratings <- file2$Review_Scores_Rating[!is.na(file2$Review_Scores_Rating)]
mean_Rating <- mean(Ratings)
file2$Review_Scores_Rating[is.na(file2$Review_Scores_Rating)] <- ceiling(mean_Rating)

write.csv(file1,"file1.csv", row.names = TRUE)
write.csv(file2,"file2.csv", row.names = TRUE)

read.csv("file1.csv")
read.csv("file2.csv")