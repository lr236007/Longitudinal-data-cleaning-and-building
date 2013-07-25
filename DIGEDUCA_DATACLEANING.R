

#Start by setting up the repository.
setwd("/Users/Leslie/Repository/Dropbox/Eriko")

#Optional: This command eliminate all lists in the repository.
rm(list=ls())
ls()

#Use this command if needed for debugging errors = options(error=recover)

#I started cleaning the three year cohort: elementary, middle school and high school. Ninth grade students have to be matched with 2011 high school and 2012 high school students.   

#CLEAN THE NAMES OF THE TWO DATA SETS

DIGEDUCA_E_MS_HS_2011<-read.csv('Resultados 2006_2009_2011.csv', header=TRUE)
dim(DIGEDUCA_E_MS_HS_2011)
head(DIGEDUCA_E_MS_HS_2011)
require(gtools)
require(gdata)
DIGEDUCA_E_MS_HS_2011<-rename.vars(DIGEDUCA_E_MS_HS_2011, c("PRIMER_NOMBRE","SEGUNDO_NOMBRE","PRIMER_APELLIDO","SEGUNDO_APELLIDO", "DESEMPENIO_LEC_2006", "LOGRO_LEC_2006", "MEASURE_L_2006", "DESEMPENIO_MATE_2006", "LOGRO_MATE_2006", "ID_UNICO_2006", "BARCODE_2009", "MEASURE_LECTURA_2009", "MEASURE_MATE_2009", "DESEMPENIO_LECTURA_2009", "DESEMPENIO_MATE_2009", "LOGRO_LECTURA_2009", "LOGRO_MATEMATICAS_2009", "MEASURE_LECTURA_2011", "MEASURE_MATE_2011", "DESEMPENIO_LECTURA_2011", "DESEMPENIO_MATE_2011", "LOGRO_LECTURA_2011", "LOGRO_MATE_2011"), c("FIRST_NAME", "MIDDLE_NAME", "LAST_NAME_1", "LAST_NAME_2", "STAND_READ_2006", "LOGRO_READ_2006", "SS_READ_2006", "STAND_MATH_2006", "LOGRO_MATH_2006", "MATCH_VAR_2006", "MATCH_VAR_2009", "SS_READ_2009", "SS_MATH_2009", "STAND_READ_2009", "STAND_MATH_2009", "LOGRO_READ_2009", "LOGRO_MATH_2009", "SS_READ_HS", "SS_MATH_HS", "STAND_READ_HS", "STAND_MATH_HS", "LOGRO_READ_HS", "LOGRO_MATH_HS"))

DIGEDUCA_E_MS_HS_2011<-rename.vars(DIGEDUCA_E_MS_HS_2011, c("COD_ESC_2006","COD_DEPA_2006","COD_MUNI_2006","COD_AREA_2006", "COD_SECT_2006", "COD_JORN_2006", "COD_PLAN_2006", "ENTIA_R_2006", "CODIGO_ESTABLECIMIENTO_2009", "CODIGO_DEPARTAMENTO_2009", "CODIGO_MUNICIPIO_2009", "CODIGO_JORNADA_2009", "CODIGO_NIVEL_2009", "CODIGO_SECTOR_2009", "CODIGO_AREA_2009", "EDAD_RECODE_2009", "SEXO_2009", "IE_IDENTIFICACION_ETNICA_2009", "IE_IDIOMA_MATERNO_2009", "BARCODE_2011", "COD_DEPA_2011", "COD_MUNI_2011","COD_ESTAB_2011", "EDAD_RECODE_2011", "SEXO_2011", "COD_AREA_2011", "COD_SECTOR_2011", "COD_JORNADA_2011", "IE_IDENTIFICACION_ETNICA_2011", "IE_IDIOMA_MATERNO_2011"), c("SCHOOL_2006", "STATE_2006", "DISTRICT_2006", "AREA_2006", "SECTOR_2006", "JORN_2006", "PLAN_2006", "ETHNICITY_2006", "SCHOOL_2009", "STATE_2009", "DISTRICT_2009", "JORN_2009", "LEVEL_2009", "SECTOR_2009", "AREA_2009", "AGE_2009", "SEX_2009", "ETHNICITY_2009", "LANG_2009", "MATCH_VAR_HS", "STATE_HS", "DISTRICT_HS","SCHOOL_HS", "AGE_HS", "SEX_HS", "AREA_HS", "SECTOR_HS", "JORN_HS", "ETHNICITY_HS", "LANG_HS"))

#CHECK CODINGS AND REMOVE UNNECESSARY VARIABLES

head(DIGEDUCA_E_MS_HS_2011)
DIGEDUCA_E_MS_HS_2011[34,]
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"AREA_2006")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"SECTOR_2006")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"JORN_2006")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"PLAN_2006")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"JORN_2009")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"LEVEL_2009")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"SECTOR_2009")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"AREA_2009")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"AGE_2009")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"SEX_2009")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"AGE_HS")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"SECTOR_HS")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"JORN_HS")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"MATCH_VAR_2006")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"MATCH_VAR_2009")
DIGEDUCA_E_MS_HS_2011<-remove.vars(DIGEDUCA_E_MS_HS_2011,"MATCH_VAR_HS")




#RECODE DEMOGRAPHIC VARIABLES 
#REQUIRE PACKAGE: car
require(car)
help(car)
#??car
#recode sex variable to match both years: 0= girls and 1= boys
DIGEDUCA_E_MS_HS_2011$SEX_HS<-recode(DIGEDUCA_E_MS_HS_2011$SEX_HS,"c(1)='0';c(0)='1';else='NA'")
#recode ethnicity variables to be consistent accross years: maya = 1, ladino =2, garifuna = 3, xinka = 4, foreign= 5, else= missing
DIGEDUCA_E_MS_HS_2011$ETHNICITY_2006<-recode(DIGEDUCA_E_MS_HS_2011$ETHNICITY_2006,"c(1,2,3,5,6,7,9,10,11,12,13,14,15,16)='1';c(8)='2';c(4)='3';else='NA'")
DIGEDUCA_E_MS_HS_2011$ETHNICITY_2009<-recode(DIGEDUCA_E_MS_HS_2011$ETHNICITY_2009,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")
DIGEDUCA_E_MS_HS_2011$ETHNICITY_HS<-recode(DIGEDUCA_E_MS_HS_2011$ETHNICITY_HS,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")

#recode language to be consistent accross years: 1=spanish, 2= maya, 3=garifuna, 4=xinka, 5=foreign, else=missing
DIGEDUCA_E_MS_HS_2011$LANG_2009<-recode(DIGEDUCA_E_MS_HS_2011$LANG_2009,"c(1)='1';c(2)='2';c(4)='3';c(5)='4';c(3)='5';else='NA'")
DIGEDUCA_E_MS_HS_2011$LANG_HS<-recode(DIGEDUCA_E_MS_HS_2011$LANG_HS,"c(1)='1';c(2)='2';c(4)='3';c(5)='4';c(3)='5';else='NA'")


#convert variables to numeric variables
DIGEDUCA_E_MS_HS_2011$ETHNICITY_2006<-as.numeric(DIGEDUCA_E_MS_HS_2011$ETHNICITY_2006, 'NA'=TRUE)
DIGEDUCA_E_MS_HS_2011$ETHNICITY_2009<-as.numeric(DIGEDUCA_E_MS_HS_2011$ETHNICITY_2009, 'NA'=TRUE)
DIGEDUCA_E_MS_HS_2011$ETHNICITY_HS <-as.numeric(DIGEDUCA_E_MS_HS_2011$ETHNICITY_HS, 'NA'=TRUE)
DIGEDUCA_E_MS_HS_2011$LANG_2009<-as.numeric(DIGEDUCA_E_MS_HS_2011$LANG_2009, 'NA'=TRUE)
DIGEDUCA_E_MS_HS_2011$LANG_HS <-as.numeric(DIGEDUCA_E_MS_HS_2011$LANG_HS, 'NA'=TRUE)
summary(DIGEDUCA_E_MS_HS_2011)
#in case need to change column names:
#colnames(dataset)[2]<-"newname" ,then you change column 2 to "newname" 



#++++++++++++++++++++++++++++++++++#
#Repeat procedure for elementary, middle school and high school csv 2012
DIGEDUCA_E_MS_HS_2012<-read.csv('Resultados 2006_2009_2012.csv', header=TRUE)
head(DIGEDUCA_E_MS_HS_2012)
dim(DIGEDUCA_E_MS_HS_2012)
DIGEDUCA_E_MS_HS_2012<-rename.vars(DIGEDUCA_E_MS_HS_2012, c("PRIMER_NOMBRE","SEGUNDO_NOMBRE","PRIMER_APELLIDO","SEGUNDO_APELLIDO", "DESEMPENIO_LEC_2006", "LOGRO_LEC_2006", "MEASURE_L_2006", "DESEMPENIO_MATE_2006", "LOGRO_MATE_2006", "ID_UNICO_2006", "BARCODE_2009", "MEASURE_LECTURA_2009", "MEASURE_MATE_2009", "DESEMPENIO_LECTURA_2009", "DESEMPENIO_MATE_2009", "LOGRO_LECTURA_2009", "LOGRO_MATEMATICAS_2009", "MEASURE_LECTURA_2012", "MEASURE_MATE_2012", "DESEMPENIO_LECTURA_2012", "DESEMPENIO_MATE_2012", "LOGRO_LECTURA_2012", "LOGRO_MATE_2012"), c("FIRST_NAME", "MIDDLE_NAME", "LAST_NAME_1", "LAST_NAME_2", "STAND_READ_2006", "LOGRO_READ_2006", "SS_READ_2006", "STAND_MATH_2006", "LOGRO_MATH_2006", "MATCH_VAR_2006", "MATCH_VAR_2009", "SS_READ_2009", "SS_MATH_2009", "STAND_READ_2009", "STAND_MATH_2009", "LOGRO_READ_2009", "LOGRO_MATH_2009", "SS_READ_HS", "SS_MATH_HS", "STAND_READ_HS", "STAND_MATH_HS", "LOGRO_READ_HS", "LOGRO_MATH_HS"))

DIGEDUCA_E_MS_HS_2012<-rename.vars(DIGEDUCA_E_MS_HS_2012, c("COD_ESC_2006","COD_DEPA_2006","COD_MUNI_2006","COD_AREA_2006", "COD_SECT_2006", "COD_JORN_2006", "COD_PLAN_2006", "ENTIA_R_2006", "CODIGO_ESTABLECIMIENTO_2009", "CODIGO_DEPARTAMENTO_2009", "CODIGO_MUNICIPIO_2009", "CODIGO_JORNADA_2009", "CODIGO_NIVEL_2009", "CODIGO_SECTOR_2009", "CODIGO_AREA_2009", "EDAD_RECODE_2009", "SEXO_2009", "IE_IDENTIFICACION_ETNICA_2009", "IE_IDIOMA_MATERNO_2009", "BARCODE_2012", "COD_DEPA_2012", "COD_MUNI_2012","COD_ESTAB_2012", "EDAD_RECODIFICADA_2012", "SEXO_2012", "COD_AREA_2012", "COD_SECTOR_2012", "COD_JORNADA_2012", "IE_IDENTIFICACION_ETNICA_2012", "IE_IDIOMA_MATERNO_2012"), c("SCHOOL_2006", "STATE_2006", "DISTRICT_2006", "AREA_2006", "SECTOR_2006", "JORN_2006", "PLAN_2006", "ETHNICITY_2006", "SCHOOL_2009", "STATE_2009", "DISTRICT_2009", "JORN_2009", "LEVEL_2009", "SECTOR_2009", "AREA_2009", "AGE_2009", "SEX_2009", "ETHNICITY_2009", "LANG_2009", "MATCH_VAR_HS", "STATE_HS", "DISTRICT_HS","SCHOOL_HS", "AGE_HS", "SEX_HS", "AREA_HS", "SECTOR_HS", "JORN_HS", "ETHNICITY_HS", "LANG_HS"))

#REMOVE UNNECESARY VARIABLES

DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"AREA_2006")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"SECTOR_2006")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"JORN_2006")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"PLAN_2006")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"JORN_2009")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"LEVEL_2009")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"SECTOR_2009")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"AREA_2009")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"AGE_2009")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"SEX_2009")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"AGE_HS")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"SECTOR_HS")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"JORN_HS")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"MATCH_VAR_2006")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"MATCH_VAR_2009")
DIGEDUCA_E_MS_HS_2012<-remove.vars(DIGEDUCA_E_MS_HS_2012,"MATCH_VAR_HS")


#RECODE DEMOGRAPHIC VARIABLES 
#NO NEED TO RECODE SEX FOR 2012 DATA SET
#REQUIRE PACKAGE: car
require(car)
help(car)
#??car
DIGEDUCA_E_MS_HS_2012$ETHNICITY_2006<-recode(DIGEDUCA_E_MS_HS_2012$ETHNICITY_2006,"c(1,2,3,5,6,7,9,10,11,12,13,14,15,16)='1';c(8)='2';c(4)='3';else='NA'")
DIGEDUCA_E_MS_HS_2012$ETHNICITY_2009<-recode(DIGEDUCA_E_MS_HS_2012$ETHNICITY_2009,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")
DIGEDUCA_E_MS_HS_2012$ETHNICITY_HS<-recode(DIGEDUCA_E_MS_HS_2012$ETHNICITY_HS,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")
#recode language to be consistent accross years: 1=spanish, 2= maya, 3=garifuna, 4=xinka, 5=foreign, else=missing
DIGEDUCA_E_MS_HS_2012$LANG_2009<-recode(DIGEDUCA_E_MS_HS_2012$LANG_2009,"c(1)='1';c(2)='2';c(4)='3';c(5)='4';c(3)='5';else='NA'")
DIGEDUCA_E_MS_HS_2012$LANG_HS<-recode(DIGEDUCA_E_MS_HS_2012$LANG_HS,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")

#convert variables to numeric variables
DIGEDUCA_E_MS_HS_2012$ETHNICITY_2006<-as.numeric(DIGEDUCA_E_MS_HS_2012$ETHNICITY_2006, 'NA'=TRUE)
DIGEDUCA_E_MS_HS_2012$ETHNICITY_2009<-as.numeric(DIGEDUCA_E_MS_HS_2012$ETHNICITY_2009, 'NA'=TRUE)
DIGEDUCA_E_MS_HS_2012$ETHNICITY_HS <-as.numeric(DIGEDUCA_E_MS_HS_2012$ETHNICITY_HS, 'NA'=TRUE)
DIGEDUCA_E_MS_HS_2012$LANG_2009 <-as.numeric(DIGEDUCA_E_MS_HS_2012$LANG_2009, 'NA'=TRUE)
DIGEDUCA_E_MS_HS_2012$LANG_HS <-as.numeric(DIGEDUCA_E_MS_HS_2012$LANG_HS, 'NA'=TRUE)
summary(DIGEDUCA_E_MS_HS_2012)
DIGEDUCA_E_MS_HS_2012[6,]

#Optional: MERGE THE TWO DATA SETS including elementary cases (sixth cases), to make inferences about all high school students.

DIGEDUCA_E_MS_HS<-rbind(DIGEDUCA_E_MS_HS_2011, DIGEDUCA_E_MS_HS_2012)
head(DIGEDUCA_E_MS_HS)
dim(DIGEDUCA_E_MS_HS) 
summary(DIGEDUCA_E_MS_HS)

#CREATE GRADE VARIABLES
DIGEDUCA_E_MS_HS$GRADE_2006<-6
DIGEDUCA_E_MS_HS$GRADE_2009<-9
DIGEDUCA_E_MS_HS$GRADE_HS<-12
#DIGEDUCA_E_MS_HS$GRADE_2012<-12
#DIGEDUCA_E_MS_HS<-remove.vars(DIGEDUCA_E_MS_HS, "GRADE_HS")

#CREATE A UNIQUE IDENTIFIER
DIGEDUCA_E_MS_HS$ID<-as.numeric(as.factor(with(DIGEDUCA_E_MS_HS,paste(FIRST_NAME, MIDDLE_NAME, LAST_NAME_1, LAST_NAME_2, STAND_READ_2006, LOGRO_READ_2006, SS_READ_2006, STAND_MATH_2006, LOGRO_MATH_2006, SS_READ_2009, SS_MATH_2009, STAND_READ_2009, STAND_MATH_2009, LOGRO_READ_2009, LOGRO_MATH_2009, SS_READ_HS, SS_MATH_HS, STAND_READ_HS, STAND_MATH_HS, LOGRO_READ_HS, LOGRO_MATH_HS, SCHOOL_2006, STATE_2006, DISTRICT_2006, ETHNICITY_2006, SCHOOL_2009, STATE_2009, DISTRICT_2009, ETHNICITY_2009, LANG_2009, STATE_HS, DISTRICT_HS,SCHOOL_HS, SEX_HS, ETHNICITY_HS, LANG_HS, sep="_"))))

#save three year cohort dataset:

write.csv(DIGEDUCA_E_MS_HS, file = "DIGEDUCA_E_MS_HS.csv")

#check data fit of this dataset.  Have to estimate SGPs to do this.
require(SGP)
sgp_DIGEDUCA_Reading <- studentGrowthPercentiles(panel.data=DIGEDUCA_E_MS_HS,
                   sgp.labels=list(my.year=2012, my.subject="Reading"),
                   panel.data.vnames=c("ID","GRADE_2006", "GRADE_2009", "GRADE_HS", "SS_READ_2006", "SS_READ_2009", "SS_READ_HS"),
                   percentile.cuts=c(1,35,65,99),
                   percuts.digits=2,
                   drop.nonsequential.grade.progression.variables=FALSE,
                   grade.progression=c(6,9,12))
                 
                 
        
names(DIGEDUCA_E_MS_HS)                
dim(DIGEDUCA_E_MS_HS)
names(sgp_DIGEDUCA_Reading)
names(sgp_DIGEDUCA_Reading$SGPercentiles)
names(sgp_DIGEDUCA_Reading$SGPercentiles$READING.2012)
DIGEDUCA_3_SGP<-as.data.frame(cbind(sgp_DIGEDUCA_Reading$SGPercentiles$READING.2012$SGP, sgp_DIGEDUCA_Reading$SGPercentiles$READING.2012$ID))
print(DIGEDUCA_3_SGP)
colnames(DIGEDUCA_3_SGP)[1]<-"SGP"
colnames(DIGEDUCA_3_SGP)[2]<-"ID"
dim(DIGEDUCA_3_SGP)
DIGEDUCA_E_MS_HS_SGP_READING<-merge(DIGEDUCA_E_MS_HS, DIGEDUCA_3_SGP, by.DIGEDUCA_E_MS_HS="ID", incomparables=NA)
head(DIGEDUCA_E_MS_HS_SGP_READING)

write.csv(DIGEDUCA_E_MS_HS_SGP_READING, file = "DIGEDUCA_E_MS_HS_SGP_READING")
help(SGP)
require(grid)
grid.draw(sgp_DIGEDUCA_Reading$Goodness_of_Fit$READING.2012[["GRADE_6_2006-9_2009-12_2012"]])

#No math for 2006

#sgp_DIGEDUCA_Math <- studentGrowthPercentiles(panel.data=DIGEDUCA_E_MS_HS,
#                   sgp.labels=list(my.year=2012, my.subject="Math"),
#                   panel.data.vnames=c("ID","GRADE_2006", "GRADE_2009", "GRADE_HS", "SS_MATH_2009", "SS_MATH_HS"),
#                  percentile.cuts=c(1,35,65,99),
#                  percuts.digits=2,
#                   drop.nonsequential.grade.progression.variables=FALSE,
#                   grade.progression=c(6,9,12))

#merge SGP into de dataset, THIS GIVES AN ERROR.
#??merge
#DIGEDUCA_E_MS_HS_SGP<-merge(DIGEDUCA_E_MS_HS, DIGEDUCA_3_SGP, by.DIGEDUCA_E_MS_HS="ID", incomparables=NA)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#Clean up of the two year cohort: middle school and high school. Ninth grade students have to be matched with 2011 high school and 2012 high school students.
     
DIGEDUCA_2009_2011<-read.csv('Resultados 2009_2011.csv',header=TRUE)
names(DIGEDUCA_2009_2011)
dim(DIGEDUCA_2009_2011)
head(DIGEDUCA_2009_2011)


DIGEDUCA_MS_HS_2011<-rename.vars(DIGEDUCA_2009_2011, c(
	"PRIMER_NOMBRE",
	"SEGUNDO_NOMBRE",
	"PRIMER_APELLIDO",
	"SEGUNDO_APELLIDO", 
	"BARCODE_2009", 
	"MEASURE_LECTURA_2009", 
	"MEASURE_MATE_2009", 
	"DESEMPENIO_LECTURA_2009", 
	"DESEMPENIO_MATE_2009", 
	"LOGRO_LECTURA_2009", 
	"LOGRO_MATEMATICAS_2009", 
	"MEASURE_LECTURA_2011", 
	"MEASURE_MATE_2011", 
	"DESEMPENIO_LECTURA_2011", 
	"DESEMPENIO_MATE_2011", 
	"LOGRO_LECTURA_2011", 
	"LOGRO_MATE_2011", 
	"CODIGO_ESTABLECIMIENTO_2009", 
	"CODIGO_DEPARTAMENTO_2009", 
	"CODIGO_MUNICIPIO_2009", 
	"CODIGO_JORNADA_2009", 
	"CODIGO_NIVEL_2009", 
	"CODIGO_SECTOR_2009", 
	"CODIGO_AREA_2009", 
	"EDAD_RECODE_2009", 
	"SEXO_2009", 
	"IE_IDENTIFICACION_ETNICA_2009", 
	"IE_IDIOMA_MATERNO_2009", 
	"BARCODE_2011", 
	"COD_DEPA_2011", 
	"COD_MUNI_2011",
	"COD_ESTAB_2011", 
	"EDAD_RECODE_2011", 
	"SEXO_2011", 
	"COD_AREA_2011", 
	"COD_SECTOR_2011", 
	"COD_JORNADA_2011", 
	"IE_IDENTIFICACION_ETNICA_2011", 
	"IE_IDIOMA_MATERNO_2011"), 
	
	c("FIRST_NAME", 
	"MIDDLE_NAME", 
	"LAST_NAME_1", 
	"LAST_NAME_2", 
	"MATCH_VAR_2009", 
	"SS_READ_2009", 
	"SS_MATH_2009", 
	"STAND_READ_2009", 
	"STAND_MATH_2009", 
	"LOGRO_READ_2009", 
	"LOGRO_MATH_2009", 
	"SS_READ_HS", 
	"SS_MATH_HS", 
	"STAND_READ_HS", 
	"STAND_MATH_HS", 
	"LOGRO_READ_HS", 
	"LOGRO_MATH_HS",
	"SCHOOL_2009", 
	"STATE_2009", 
	"DISTRICT_2009", 
	"JORN_2009", 
	"LEVEL_2009", 
	"SECTOR_2009", 
	"AREA_2009", 
	"AGE_2009", 
	"SEX_2009", 
	"ETHNICITY_2009", 
	"LANG_2009", 
	"MATCH_VAR_HS", 
	"STATE_HS", 
	"DISTRICT_HS",
	"SCHOOL_HS", 
	"AGE_HS", 
	"SEX_HS", 
	"AREA_HS", 
	"SECTOR_HS", 
	"JORN_HS", 
	"ETHNICITY_HS", 
	"LANG_HS"))


#ERASE UNNECESSARY VARIABLES


DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"JORN_2009")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"LEVEL_2009")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"SECTOR_2009")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"AREA_2009")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"AGE_2009")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"SEX_2009")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"AGE_HS")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"SECTOR_HS")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"JORN_HS")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"AREA_HS")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"MATCH_VAR_2009")
DIGEDUCA_MS_HS_2011<-remove.vars(DIGEDUCA_MS_HS_2011,"MATCH_VAR_HS")


names(DIGEDUCA_MS_HS_2011)
dim(DIGEDUCA_MS_HS_2011)
DIGEDUCA_MS_HS_2011[3,]
#RECODE DEMOGRAPHIC VARIABLES 
#recode sex variable to match both years: 0= girls and 1= boys
DIGEDUCA_MS_HS_2011$SEX_HS<-recode(DIGEDUCA_MS_HS_2011$SEX_HS,"c(1)='0';c(0)='1';else='NA'")
#recode ethnicity variables to be consistent accross years: maya = 1, ladino =2, garifuna = 3, xinka = 4, foreign= 5, else= missing
#REQUIRE PACKAGE: car
require(car)
help(car)
#??car
DIGEDUCA_MS_HS_2011$ETHNICITY_2009<-recode(DIGEDUCA_MS_HS_2011$ETHNICITY_2009,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")
DIGEDUCA_MS_HS_2011$ETHNICITY_HS<-recode(DIGEDUCA_MS_HS_2011$ETHNICITY_HS,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")
#recode language to be consistent accross years: 1=spanish, 2= maya, 3=garifuna, 4=xinka, 5=foreign, else=missing
DIGEDUCA_MS_HS_2011$LANG_2009<-recode(DIGEDUCA_MS_HS_2011$LANG_2009,"c(1)='1';c(2)='2';c(4)='3';c(5)='4';c(3)='5';else='NA'")
DIGEDUCA_MS_HS_2011$LANG_HS<-recode(DIGEDUCA_MS_HS_2011$LANG_HS,"c(1)='1';c(2)='2';c(3)='5';c(4)='3';c(5)='4';else='NA'")



#convert variables to numeric variables
DIGEDUCA_MS_HS_2011$SEX_HS<-as.numeric(DIGEDUCA_MS_HS_2011$SEX_HS, 'NA'=TRUE)
DIGEDUCA_MS_HS_2011$ETHNICITY_2009<-as.numeric(DIGEDUCA_MS_HS_2011$ETHNICITY_2009, 'NA'=TRUE)
DIGEDUCA_MS_HS_2011$ETHNICITY_HS <-as.numeric(DIGEDUCA_MS_HS_2011$ETHNICITY_HS, 'NA'=TRUE)
DIGEDUCA_MS_HS_2011$LANG_2009 <-as.numeric(DIGEDUCA_MS_HS_2011$LANG_2009, 'NA'=TRUE)
DIGEDUCA_MS_HS_2011$LANG_HS <-as.numeric(DIGEDUCA_MS_HS_2011$LANG_HS, 'NA'=TRUE)
summary(DIGEDUCA_MS_HS_2012)
DIGEDUCA_MS_HS_2011[6,]

par(mfrow=c(2,2))
hist(DIGEDUCA_MS_HS_2011$SS_READ_2009, main= "9th Grade Reading Scores Distribution")
hist(DIGEDUCA_MS_HS_2011$SS_MATH_2009, main= "9th Grade Math Scores Distribution")
hist(DIGEDUCA_MS_HS_2011$SS_READ_HS, main= "High School Reading Scores Distribution")
hist(DIGEDUCA_MS_HS_2011$SS_MATH_HS, main= "High School Math Scores Distribution")




#DATA FROM 2009-2012 COHORT. STUDENTS THAT DID A 3 YEAR HIGH SCHOOL.
DIGEDUCA_2009_2012<-read.csv('Resultados 2009_2012.csv',header=TRUE)
names(DIGEDUCA_2009_2012)
dim(DIGEDUCA_2009_2012)
head(DIGEDUCA_2009_2012)

DIGEDUCA_MS_HS_2012<-rename.vars(DIGEDUCA_2009_2012, c(
"PRIMER_NOMBRE",
"SEGUNDO_NOMBRE",
"PRIMER_APELLIDO",
"SEGUNDO_APELLIDO", 
"BARCODE_2009", 
"MEASURE_LECTURA_2009", 
"MEASURE_MATE_2009", 
"DESEMPENIO_LECTURA_2009", 
"DESEMPENIO_MATE_2009", 
"LOGRO_LECTURA_2009", 
"LOGRO_MATEMATICAS_2009", 
"MEASURE_LECTURA_2012", 
"MEASURE_MATE_2012", 
"DESEMPENIO_LECTURA_2012", 
"DESEMPENIO_MATE_2012", 
"LOGRO_LECTURA_2012", 
"LOGRO_MATE_2012", 
"CODIGO_ESTABLECIMIENTO_2009", 
"CODIGO_DEPARTAMENTO_2009", 
"CODIGO_MUNICIPIO_2009", 
"CODIGO_JORNADA_2009", 
"CODIGO_NIVEL_2009", 
"CODIGO_SECTOR_2009", 
"CODIGO_AREA_2009", 
"EDAD_RECODE_2009", 
"SEXO_2009", 
"IE_IDENTIFICACION_ETNICA_2009", 
"IE_IDIOMA_MATERNO_2009", 
"BARCODE_2012", 
"COD_DEPA_2012", 
"COD_MUNI_2012",
"COD_ESTAB_2012", 
"EDAD_RECODIFICADA_2012", 
"SEXO_2012", 
"COD_AREA_2012", 
"COD_SECTOR_2012", 
"COD_JORNADA_2012", 
"IE_IDENTIFICACION_ETNICA_2012", 
"IE_IDIOMA_MATERNO_2012"), 

c("FIRST_NAME", 
"MIDDLE_NAME", 
"LAST_NAME_1", 
"LAST_NAME_2", 
"MATCH_VAR_2009", 
"SS_READ_2009", 
"SS_MATH_2009", 
"STAND_READ_2009", 
"STAND_MATH_2009", 
"LOGRO_READ_2009", 
"LOGRO_MATH_2009", 
"SS_READ_HS", 
"SS_MATH_HS", 
"STAND_READ_HS", 
"STAND_MATH_HS", 
"LOGRO_READ_HS", 
"LOGRO_MATH_HS",
"SCHOOL_2009", 
"STATE_2009", 
"DISTRICT_2009", 
"JORN_2009", 
"LEVEL_2009", 
"SECTOR_2009", 
"AREA_2009", 
"AGE_2009", 
"SEX_2009", 
"ETHNICITY_2009", 
"LANG_2009", 
"MATCH_VAR_HS", 
"STATE_HS", 
"DISTRICT_HS",
"SCHOOL_HS", 
"AGE_HS", 
"SEX_HS", 
"AREA_HS", 
"SECTOR_HS", 
"JORN_HS", 
"ETHNICITY_HS", 
"LANG_HS"))


#ERASE UNNECESSARY VARIABLES


DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"JORN_2009")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"LEVEL_2009")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"SECTOR_2009")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"AREA_2009")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"AGE_2009")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"SEX_2009")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"AGE_HS")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"SECTOR_HS")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"JORN_HS")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"AREA_HS")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"MATCH_VAR_2009")
DIGEDUCA_MS_HS_2012<-remove.vars(DIGEDUCA_MS_HS_2012,"MATCH_VAR_HS")


names(DIGEDUCA_MS_HS_2012)
dim(DIGEDUCA_MS_HS_2012)

#RECODE DEMOGRAPHIC VARIABLES 

#recode ethnicity variables to be consistent accross years: maya = 1, ladino =2, garifuna = 3, xinka = 4, foreign= 5, else= missing
#REQUIRE PACKAGE: car
require(car)
help(car)
#??car
DIGEDUCA_MS_HS_2012$ETHNICITY_2009<-recode(DIGEDUCA_MS_HS_2012$ETHNICITY_2009,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")
DIGEDUCA_MS_HS_2012$ETHNICITY_HS<-recode(DIGEDUCA_MS_HS_2012$ETHNICITY_HS,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")
#recode language to be consistent accross years: 1=spanish, 2= maya, 3=garifuna, 4=xinka, 5=foreign, else=missing
DIGEDUCA_MS_HS_2012$LANG_2009<-recode(DIGEDUCA_MS_HS_2012$LANG_2009,"c(1)='1';c(2)='2';c(4)='3';c(5)='4';c(3)='5';else='NA'")
DIGEDUCA_MS_HS_2012$LANG_HS<-recode(DIGEDUCA_MS_HS_2012$LANG_HS,"c(1)='1';c(2)='2';c(3)='3';c(4)='4';c(5)='5';else='NA'")


#convert variables to numeric variables
DIGEDUCA_MS_HS_2012$SEX_HS<-as.numeric(DIGEDUCA_MS_HS_2012$SEX_HS, 'NA'=TRUE)
DIGEDUCA_MS_HS_2012$ETHNICITY_2009<-as.numeric(DIGEDUCA_MS_HS_2012$ETHNICITY_2009, 'NA'=TRUE)
DIGEDUCA_MS_HS_2012$ETHNICITY_HS <-as.numeric(DIGEDUCA_MS_HS_2012$ETHNICITY_HS, 'NA'=TRUE)
DIGEDUCA_MS_HS_2012$LANG_2009 <-as.numeric(DIGEDUCA_MS_HS_2012$LANG_2009, 'NA'=TRUE)
DIGEDUCA_MS_HS_2012$LANG_HS <-as.numeric(DIGEDUCA_MS_HS_2012$LANG_HS, 'NA'=TRUE)


#Optional: MERGE THE TWO DATA SETS to make inferences about all high school students.

DIGEDUCA_MS_HS<-rbind(DIGEDUCA_MS_HS_2011, DIGEDUCA_MS_HS_2012)
head(DIGEDUCA_MS_HS)
dim(DIGEDUCA_MS_HS) #N=88,948


DIGEDUCA_MS_HS<-unique(DIGEDUCA_MS_HS)

#CREATE GRADE AND ID VARIABLES
DIGEDUCA_MS_HS$GRADE_2009<-9
DIGEDUCA_MS_HS$GRADE_HS<-12

#CREATE A UNIQUE IDENTIFIER
DIGEDUCA_MS_HS$ID<-as.numeric(as.factor(with(DIGEDUCA_MS_HS,
paste(FIRST_NAME, 
MIDDLE_NAME, 
LAST_NAME_1, 
LAST_NAME_2,  
SS_READ_2009, 
SS_MATH_2009, 
STAND_READ_2009, 
STAND_MATH_2009, 
LOGRO_READ_2009, 
LOGRO_MATH_2009, 
SS_READ_HS, 
SS_MATH_HS, 
STAND_READ_HS, 
STAND_MATH_HS, 
LOGRO_READ_HS, 
LOGRO_MATH_HS, 
SCHOOL_2009, 
STATE_2009, 
DISTRICT_2009, 
ETHNICITY_2009, 
LANG_2009, 
STATE_HS, 
DISTRICT_HS,
SCHOOL_HS, 
SEX_HS,  
ETHNICITY_HS, 
LANG_HS, sep="_"))))

write.csv(DIGEDUCA_MS_HS, file = "DIGEDUCA_MS_HS")

#student growth percentiles ms and hs
require(SGP)
sgp_DIGEDUCA_Reading_HS <- studentGrowthPercentiles(panel.data=DIGEDUCA_MS_HS,
                   sgp.labels=list(my.year=2012, my.subject="Reading"),
                   panel.data.vnames=c("ID", "GRADE_2009", "GRADE_HS", "SS_READ_2009", "SS_READ_HS"),
                   percentile.cuts=c(1,35,65,99),
                   percuts.digits=2,
                   drop.nonsequential.grade.progression.variables=FALSE,
                   grade.progression=c(9,12))
                   
names(sgp_DIGEDUCA_Reading_HS$SGPercentiles$READING.2012)

                  
dim(DIGEDUCA_MS_HS)
names(sgp_DIGEDUCA_Reading_HS$SGPercentiles)
names(sgp_DIGEDUCA_Reading_HS$SGPercentiles$READING.2012)
DIGEDUCA_2_SGP<-as.data.frame(cbind(sgp_DIGEDUCA_Reading_HS$SGPercentiles$READING.2012$SGP, sgp_DIGEDUCA_Reading_HS$SGPercentiles$READING.2012$ID))
head(DIGEDUCA_2_SGP)
dim(DIGEDUCA_2_SGP)
colnames(DIGEDUCA_2_SGP)[1]<-"SGP"
colnames(DIGEDUCA_2_SGP)[2]<-"ID"
dim(DIGEDUCA_2_SGP)
DIGEDUCA_HS_SGP_READING<-merge(DIGEDUCA_MS_HS, DIGEDUCA_2_SGP, by.DIGEDUCA_MS_HS="ID", incomparables=NA)
head(DIGEDUCA_HS_SGP_READING)

help(SGP)
require(grid)
names(sgp_DIGEDUCA_Reading_HS$Goodness_of_Fit$READING.2012)
grid.draw(sgp_DIGEDUCA_Reading_HS$Goodness_of_Fit$READING.2012[["GRADE_9_2009-12_2012"]])


write.csv(DIGEDUCA_2_SGP, file = "DIGEDUCA_2_SGP")

sgp_DIGEDUCA_MATH_HS <- studentGrowthPercentiles(panel.data=DIGEDUCA_MS_HS,
                   sgp.labels=list(my.year=2012, my.subject="Math"),
                   panel.data.vnames=c("ID", "GRADE_2009", "GRADE_HS", "SS_MATH_2009", "SS_MATH_HS"),
                   percentile.cuts=c(1,35,65,99),
                   percuts.digits=2,
                   drop.nonsequential.grade.progression.variables=FALSE,
                   grade.progression=c(9,12))



                  
dim(DIGEDUCA_MS_HS)
names(sgp_DIGEDUCA_MATH_HS$SGPercentiles)
names(sgp_DIGEDUCA_MATH_HS$SGPercentiles$MATH.2012)
DIGEDUCA_2_SGP_MATH<-as.data.frame(cbind(sgp_DIGEDUCA_MATH_HS$SGPercentiles$MATH.2012$SGP, sgp_DIGEDUCA_MATH_HS$SGPercentiles$MATH.2012$ID))
dim(DIGEDUCA_2_SGP_MATH)
colnames(DIGEDUCA_2_SGP_MATH)[1]<-"SGP_MATH"
colnames(DIGEDUCA_2_SGP_MATH)[2]<-"ID"
head(DIGEDUCA_MS_HS)
head(DIGEDUCA_2_SGP)
head(DIGEDUCA_2_SGP_MATH)
DIGEDUCA_HS_SGP<-merge(DIGEDUCA_HS_SGP_READING, DIGEDUCA_2_SGP_MATH, by.DIGEDUCA_HS_SGP_READING="ID", incomparables=NA)

head(DIGEDUCA_HS_SGP)

write.csv(DIGEDUCA_HS_SGP, file = "DIGEDUCA_HS_SGP.csv")

help(SGP)
require(grid)
names(sgp_DIGEDUCA_MATH_HS$Goodness_of_Fit$MATH.2012)
grid.draw(sgp_DIGEDUCA_MATH_HS$Goodness_of_Fit$MATH.2012[["GRADE_9_2009-12_2012"]])

setwd("/Users/Leslie/Repository/Dropbox/Eriko")

#did the long formatting in SPSS


DIGEDUCA_LONG_FORMAT<-read.csv('DIGEDUCA_LONG_FORMAT_REC.csv', header=TRUE)
head(DIGEDUCA_LONG_FORMAT)
DIGEDUCA_LONG_FORMAT[1:16,]
DIGEDUCA_LONG_FORMAT[17:32,]
DIGEDUCA_LONG_FORMAT[33:48,]


write.csv(DIGEDUCA_LONG_FORMAT, file = "GUATEMALA_LONG_DATA.csv")


###########################################
###
### Cleanup of LONG file
###
###########################################

### Load SGP Package

require(SGP)
require(data.table)
require(gtools)
require(gdata)



### Load data

Guatemala_Data_LONG <- read.csv("/Users/Leslie/Repository/Dropbox/Eriko/GUATEMALA_DATA_LONG.csv")
names(Guatemala_Data_LONG)
head(Guatemala_Data_LONG)
dim(Guatemala_Data_LONG)

### NULL out unused variables
Guatemala_Data_LONG$SEX<-Guatemala_Data_LONG$SEX_HS

my.variables.to.null.out <- c( "RNUMBER", "SGP", "SGP_MATH","Index2", "Index1")
for (i in my.variables.to.null.out) {
	Guatemala_Data_LONG[[i]] <- NULL
}


### Convert to data.table

Guatemala_Data_LONG <- as.data.table(Guatemala_Data_LONG)

### Tidy up variables

Guatemala_Data_LONG$ID  <- as.character(Guatemala_Data_LONG$ID)

levels(Guatemala_Data_LONG$FIRST_NAME) <- sapply(levels(Guatemala_Data_LONG$FIRST_NAME), capwords)
levels(Guatemala_Data_LONG$MIDDLE_NAME) <- sapply(levels(Guatemala_Data_LONG$MIDDLE_NAME), capwords)
levels(Guatemala_Data_LONG$LAST_NAME_1) <- sapply(levels(Guatemala_Data_LONG$LAST_NAME_1), capwords)
levels(Guatemala_Data_LONG$LAST_NAME_2) <- sapply(levels(Guatemala_Data_LONG$LAST_NAME_2), capwords)

Guatemala_Data_LONG$SEX <- factor(Guatemala_Data_LONG$SEX, levels=0:1, labels=c("Female", "Male"))

setnames(Guatemala_Data_LONG, "SCALE", "SCALE_SCORE")
setnames(Guatemala_Data_LONG, "ACHIEVEMENT", "ACHIEVEMENT_LEVEL")

my.achievement.levels <- c("Unsatisfactory", "Needs improvement", "Satisfactory", "Excelent")
Guatemala_Data_LONG$ACHIEVEMENT_LEVEL <- factor(Guatemala_Data_LONG$ACHIEVEMENT_LEVEL, levels=1:4, labels=my.achievement.levels, ordered=TRUE)

Guatemala_Data_LONG$LOGRO <- factor(Guatemala_Data_LONG$LOGRO, levels=0:1, labels=c("No", "Yes"))

setnames(Guatemala_Data_LONG, "STATE", "STATE_NUMBER")
setnames(Guatemala_Data_LONG, "DISTRICT", "DISTRICT_NUMBER")
setnames(Guatemala_Data_LONG, "SCHOOL", "SCHOOL_NUMBER")

my.ethnicities <- c("Maya", "Ladino", "Garifuna", "Xinka", "Foreign")
Guatemala_Data_LONG$ETHNICITY <- factor(Guatemala_Data_LONG$ETHNICITY, levels=1:5, labels=my.ethnicities)

my.languages <- c("Spanish", "Maya", "Garifuna", "Xinka", "Foreign")
Guatemala_Data_LONG$LANGUAGE <- factor(Guatemala_Data_LONG$LANGUAGE, levels=1:5, labels=my.languages)

Guatemala_Data_LONG$SCHOOL_NUMBER <- as.character(Guatemala_Data_LONG$SCHOOL_NUMBER)

Guatemala_Data_LONG$YEAR <- as.character(Guatemala_Data_LONG$YEAR)

levels(Guatemala_Data_LONG$CONTENT) <- c("MATHEMATICS", "READING")
Guatemala_Data_LONG$CONTENT <- as.character(Guatemala_Data_LONG$CONTENT)

my.states<-c("Ciudad Capital", "Guatemala", "El Progreso", "Sacatepequez", "Chimaltenango", "Escuintla", "Santa Rosa", "Solola", "Totonicapán", "Quetzaltenango", "Suchitepequez", "Retalhuleu", "San Marcos", "Huehuetenango", "Quiche", "Baja Verapaz", "Alta Verapaz", "Petén", "Izabal", "Zacapa", "Chiquimula", "Jalapa", "Jutiapa")
Guatemala_Data_LONG$STATE_NAME <- factor(Guatemala_Data_LONG$STATE_NUMBER, levels=0:22, labels=my.states)

my.districts<-as.data.table(read.csv("DISTRICT_LABELS.csv", header=FALSE))
names(my.districts) <- c("DISTRICT_NUMBER", "DISTRICT_NAME")
setkey(my.districts, DISTRICT_NUMBER)
setkey(Guatemala_Data_LONG, DISTRICT_NUMBER)

Guatemala_Data_LONG <- my.districts[Guatemala_Data_LONG]
#SOMETHING HAPPENED WITH THE OTHER LABELS????
head(Guatemala_Data_LONG)


table(Guatemala_Data_LONG$GRADE, Guatemala_Data_LONG$YEAR)
head(Guatemala_Data_LONG)

save(Guatemala_Data_LONG, file="Guatemala_Data_LONG.Rdata")

#More data cleaning before analyses in SGP
#CREATE THE FOLLOWING FACTOR VARIABLES:

Guatemala_Data_LONG$VALID_CASE <- "VALID_CASE"

Guatemala_Data_LONG$SCHOOL_ENROLLMENT_STATUS <- factor(1, levels=0:1, labels=c("Enrolled School: No", "Enrolled School: Yes"))
Guatemala_Data_LONG$DISTRICT_ENROLLMENT_STATUS <- factor(1, levels=0:1, labels=c("Enrolled District: No", "Enrolled District: Yes"))
Guatemala_Data_LONG$STATE_ENROLLMENT_STATUS <- factor(1, levels=0:1, labels=c("Enrolled State: No", "Enrolled State: Yes"))
save(Guatemala_Data_LONG, file="Guatemala_Data_LONG.Rdata")

Guatemala_SGP@Data$SCHOOL_ENROLLMENT_STATUS <- factor(1, levels=0:1, labels=c("Enrolled School: No", "Enrolled School: Yes"))
Guatemala_SGP@Data$DISTRICT_ENROLLMENT_STATUS <- factor(1, levels=0:1, labels=c("Enrolled District: No", "Enrolled District: Yes"))
Guatemala_SGP@Data$STATE_ENROLLMENT_STATUS <- factor(1, levels=0:1, labels=c("Enrolled State: No", "Enrolled State: Yes"))
save(Guatemala_SGP, file="Guatemala_SGP.Rdata")

Guatemala_Data_LONG$LAST_NAME <- paste(Guatemala_Data_LONG$LAST_NAME_1, Guatemala_Data_LONG$LAST_NAME_2)
Guatemala_SGP@Data$LAST_NAME <- paste(Guatemala_SGP@Data$LAST_NAME_1, Guatemala_SGP@Data$LAST_NAME_2)

