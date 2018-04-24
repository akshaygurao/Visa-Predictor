
# Preliminary data processing
library("randomForest")
library("party")
library("dplyr")
library("tidyr")
library("sqldf")
library("caret")
library("glmnet")
library("car")
library("ROCR")
library("gbm")

#read csv files from the local disk
h1b_data <- read.csv("/Users/akshaygurao/Important/H1B Prediction/h1b_kaggle.csv", header=T)

#filter the data that is required, here we take the case status we need i.e certified and denied
data_filtered<-filter(h1b_data,CASE_STATUS %in% c('CERTIFIED','DENIED'))
data_filtered<-data_filtered[complete.cases(data_filtered),]
h1b.rf<-data_filtered
h1b.rf[,c(1,3,5,8,10,11)]<-NULL

##h1b.rf$SOC_NAME<-tolower(h1b.rf$SOC_NAME)
h1b.rf<-separate(data = h1b.rf, col = WORKSITE, into = c("CITY", "STATE"), sep = ",")

## Data Cleaning - Selecting the major occupations
h1b.rf$occ<-NA
h1b.rf$occ[grep("engineer",h1b.rf$SOC_NAME, ignore.case = T)]<-"ENGINEER"
h1b.rf$occ[grep("manager",h1b.rf$SOC_NAME, ignore.case = T)]<-"MANAGER"
h1b.rf$occ[grep("technician",h1b.rf$SOC_NAME, ignore.case = T)]<-"TECHNICIAN"
h1b.rf$occ[grep("teacher",h1b.rf$SOC_NAME, ignore.case = T)]<-"TEACHER"
h1b.rf$occ[grep("executive",h1b.rf$SOC_NAME, ignore.case = T)]<-"EXECUTIVE"
h1b.rf$occ[grep("accountant",h1b.rf$SOC_NAME, ignore.case = T)]<-"ACCOUNTANT"


h1b.rf$SOC_NAME<-NULL
h1b.rf$CITY<- NULL

## removing states with low count
a<-sqldf("select count(*) cc, STATE from 'h1b.rf' group by STATE")
b<-sqldf("select * from a where cc>2000 AND STATE <> ' NA'")
h1b.rf$STATE<-ifelse(h1b.rf$STATE %in% b$STATE,h1b.rf$STATE,NA)

##converting the dependent variable to binary
h1b.rf$CASE_STATUS<-ifelse(h1b.rf$CASE_STATUS %in% c("CERTIFIED"),"1","0")

##selecting only complete cases
h1b.rf<-h1b.rf[complete.cases(h1b.rf),]

##converting categorical variables into factors
h1b.rf[,c(-3)]<- lapply(h1b.rf[,c(-3)], as.factor)


h1b.glm<-h1b.rf

##converting categorical variables to dummy variables for logistic regression
dmy<-dummyVars("~.",data=h1b.glm)

trsf<-data.frame(predict(dmy,newdata=h1b.glm))
data_with_dum<-cbind(h1b.glm[1],trsf[,c(-1,-2)])

colnames(data_with_dum)
#n-1 dummy variables for n categories
data_final<-data_with_dum[,c(-3,-37,-43)]

##fitting the model on the complete dataset
h1bglm.fit <-glm(CASE_STATUS~., family=binomial(link = logit), data = data_final)
summary(h1bglm.fit)

##finding and removing variables with high VIF
viff<-vif(h1bglm.fit)
which(as.numeric(viff)>8,arr.ind=T)
data_final<-data_final[,c(-5,-23,-31)]

##splitting the dataset into training and testing set
set.seed(32388)

inTrain <- createDataPartition(y = data_final$CASE_STATUS,p = .79, list = FALSE)
training <- data_final[inTrain,]
testing <- data_final[-inTrain,]


##fitting the model on the training dataset
h1bglm.train.fit <-glm(CASE_STATUS~., family=binomial(link = logit), data = training)
summary(h1bglm.train.fit)

coef(h1bglm.fit)

###Finding Prdicitons on Testing set
prediction<-predict(h1bglm.train.fit,newdata=testing,type="response")
aa<-as.data.frame(prediction)

##cutoff for prediction
prediction[prediction<0.97]<-0
prediction[prediction>=0.97]<-1

##confusion matrix
confusionMatrix(prediction,testing$CASE_STATUS)

pred <- prediction( prediction, testing$CASE_STATUS)
perf <- performance(pred,"tpr","fpr")
plot(perf)

##splitting data into training and test set
set.seed(32388)
inTrain11 <- createDataPartition(y = h1b.rf$CASE_STATUS,p = .79, list = FALSE)
training1 <- h1b.rf[inTrain11,]
testing1 <- h1b.rf[-inTrain11,]


#####Running ctree on training set
ctree1<-ctree(CASE_STATUS~.,data=training1)
#####Predicitng on testing set
prediction1<-predict(ctree1,newdata=testing1)
###To check the confusion matrix
confusionMatrix(prediction1,testing1$CASE_STATUS)

probabilities <- 1- unlist(treeresponse(ctree1,newdata=testing1), use.names=F)[seq(1,nrow(testing1)*2,2)]
################ROC CURVE
pred1 <- prediction( probabilities, testing1$CASE_STATUS)
perf1 <- performance(pred1,"tpr","fpr")
plot(perf1)