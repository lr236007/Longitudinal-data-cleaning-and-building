
#Start by setting up the repository.
setwd("/Users/Leslie/Desktop")

#Optional: This command eliminate all lists in the repository.
rm(list=ls())
ls()

#####################################################
###
### SCRIPT FOR CREATING SGPs FOR GUATEMALA
###
#####################################################

### LOAD SGP PACKAGE

require(SGP)
require(devtools)
install_github("SGP", "dbetebenner")
require(data.table)
### Load LONG Data

load("Guatemala_Data_LONG.Rdata")


### prepareSGP

Guatemala_SGP <- prepareSGP(Guatemala_Data_LONG, state="GUA")


### analyzeSGP

Guatemala_Config <- Grade_12.config <- list(
					MATHEMATICS.2012 = list(
						sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS'),
						sgp.panel.years=c('2009', '2012'),
						sgp.grade.sequences=list(c(9, 12))),
					READING.2012 = list(
						sgp.content.areas=c('READING', 'READING'),
						sgp.panel.years=c('2009', '2012'),
						sgp.grade.sequences=list(c(9, 12))))
						
Guatemala_SGP <- analyzeSGP(Guatemala_SGP,
							state="GUA",
							sgp.percentiles=TRUE,
							sgp.projections=FALSE,
							sgp.projections.lagged=FALSE,
							sgp.percentiles.baseline=FALSE,
							sgp.projections.baseline=FALSE,
							sgp.projections.lagged.baseline=FALSE,
							sgp.config.drop.nonsequential.grade.progression.variables=FALSE,
							sgp.config=Guatemala_Config)
#Combine SGP

Guatemala_SGP<-combineSGP(Guatemala_SGP, state="GUA")			
save (Guatemala_SGP, file="Guatemala_SGP.Rdata")
load(Guatemala_SGP.Rdata)	
names(Guatemala_SGP@Data)		
#codebook of variables in data
names(Guatemala_SGP@Data)	
#Summarize SGP

Guatemala_SGP <- summarizeSGP(Guatemala_SGP, state="GUA")
save (Guatemala_SGP, file="Guatemala_SGP.Rdata")
load("Guatemala_SGP.RData")
#Data visualizations (haven't work so far...)
visualizeSGP(Guatemala_SGP, state="GUA", plot.types="studentGrowthPlot", sgPlot.demo.report=TRUE)
visualizeSGP(Guatemala_SGP, state="GUA", plot.types=c("bubblePlot", "studentGrowthPlot", bPlot.prior.achievement=FALSE, sgPlot.demo.report=TRUE))
visualizeSGP(Guatemala_SGP, state="GUA", plot.types="growthAchievementPlots", sgPlot.demo.report=TRUE)


