setwd("/Users/Leslie/Desktop/")
rm(list=ls())
ls()
#transposed data #don't use yet, it is not worth it with such a small N.
items<-read.csv('REAULA_SGP_2012_TRANS.csv',header=TRUE)

#not transposed data
items<-read.csv('REAULA_SGP_2012.csv',header=TRUE)
require(SGP)
require(data.table)
require(gtools)
require(gdata)


REAULA_SGP <- as.data.table(items)

names(REAULA_SGP)
head(REAULA_SGP)
dim(REAULA_SGP)

REAULA_SGP$GENDER <- factor(REAULA_SGP$GENDER, levels=1:2, labels=c("Male", "Female"))
my.ethnicities <- c("Non_maya", "Maya")


table(items$GENDER)
table(items$PRESCHOOL)
table(items$AGE_M1)
table(items$AGE_M2)
table(items$REPITE)
table(items$MOTHER_LANG)
table(items$EVAL_LANG)
table(items$ETHNICITY)
table(items$SS_READ_PRE)
table(items$SS_READ_POST)
table(items$ACHIEVE_R_POST)
table(items$LOGRO_R_POST)
table(items$SS_MATH_PRE)
table(items$ACH_M_PRE)
table(items$TOTAL_PAMI)
table(items$SS_M_POST)
table(items$ACHIEVE_M_POST)
table(items$LOGRO_M_POST)


#Make sure that I transform the LEE and Pami into theta scores.
#Only use the variables needed for the analyses.
#No need to transform to long data because I only have a few data points.
                
sgp_REAULA_Reading <- studentGrowthPercentiles(panel.data=items,
                   sgp.labels=list(my.year=2012, my.subject="Reading"),
                   panel.data.vnames=c("ID", "GRADE_2001", "GRADE_2002", "SS_READ_PRE", "SS_READ_POST"),
                   percentile.cuts=c(1,35,65,99),
                   percuts.digits=2,
                   grade.progression=c(1,2))

head(sgp_REAULA_Reading$SGPercentiles$READING.2012)
 require(grid)
 names(sgp_REAULA_Reading$Goodness_of_Fit)
 names(sgp_REAULA_Reading$Goodness_of_Fit$READ)
 grid.draw(sgp_REAULA_Reading$Goodness_of_Fit$READING.2012[["GRADE_1-2"]])
 
 
 summary(sgp_REAULA_Reading$SGPercentiles$READING.2012)
 class(sgp_REAULA_Reading$SGPercentiles$READING.2012)
 write.csv(sgp_REAULA_Reading$SGPercentiles$READING.2012, file="REAULA_SGP_READING_2012.csv")


#What did I get as an output?
slotNames(sgp_REAULA_Reading)
class(sgp_REAULA_Reading) #list  how come I did not get a slot?
names(sgp_REAULA_Reading)
names(sgp_REAULA_Reading$Coefficient_Matrices) #Null
names(sgp_REAULA_Reading$Coefficient_Matrices$READING.2012) #"qrmatrix_2_1"
names(sgp_REAULA_Reading$Coefficient_Matrices$READING.2012$qrmatrix_2_1)
names(sgp_REAULA_Reading$Cutscores) #nothing!!! so I have not put it in?
names(sgp_REAULA_Reading$Cutscores)
names(sgp_REAULA_Reading$Panel_Data)  #this is my original data
names(sgp_REAULA_Reading$SGPercentiles)  #this has the reading because that is the only one i have calculated.

#Now Math- still have to put the pre in the same scale as the post

sgp_REAULA_Math <- studentGrowthPercentiles(panel.data=items,
                   sgp.labels=list(my.year=2012, my.subject="Math"),
                   panel.data.vnames=c("ID", "GRADE_2001", "GRADE_2002", "SS_MATH_PRE", "SS_M_POST"),
                   percentile.cuts=c(1,35,65,99),
                   percuts.digits=2,
                   grade.progression=c(1,2))
head(sgp_REAULA_Math$SGPercentiles)
names(sgp_REAULA_Math$SGPercentiles)

head(sgp_REAULA_Math$SGPercentiles$MATH.2012)


 require(grid)
 names(sgp_REAULA_Math$Goodness_of_Fit)
 grid.draw(sgp_REAULA_Math$Goodness_of_Fit$MATH.2012[["GRADE_1-2"]])
 
 
 summary(sgp_REAULA_Math$SGPercentiles$MATH.2012)
write.csv(sgp_REAULA_Math$SGPercentiles$MATH.2012, file="REAULA_SGP_MATH_2012.csv")

#it does not run????? because we don't have enough priors
sgp_proj_read_2012<- studentGrowthProjections(panel.data=items,
					num.panels = 2,
					max.num.scores=2,
					num.prior.scores,
					proj.function,labels=list(my.year=2012,my.subject="reading",my.grade=1),
					subset.grade = 1,
					percentile.trajectories=c(35,65),
					projcuts.digits=0)
