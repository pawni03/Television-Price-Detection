telecomdata=read.csv("Telecom_Data.csv")

#check missing values
any(is.na(telecomdata))

#eda
#churn : categorical dependent variable
# anova test : dependent (categorical) and independent(categorical)
# chisq test : dependent (categorical) and independent(continuous)

anova1=aov(churn~(state),data=telecomdata)
summary(anova1)
anova2=aov(churn~(account.length),data=telecomdata)
summary(anova2)
anova3=aov(churn~(phone.number),data=telecomdata)
summary(anova3)
anova4=aov(churn~(number.vmail.messages),data=telecomdata)
summary(anova4)
anova5=aov(churn~(total.day.minutes),data=telecomdata)
summary(anova5)
anova6=aov(churn~(total.day.calls),data=telecomdata)
summary(anova6)
anova7=aov(churn~(total.day.charge),data=telecomdata)
summary(anova7)
anova8=aov(churn~(total.eve.minutes),data=telecomdata)
summary(anova8)
anova9=aov(churn~(total.eve.calls),data=telecomdata)
summary(anova9)
anova10=aov(churn~(total.eve.charge),data=telecomdata)
summary(anova10)
anova11=aov(churn~(total.night.minutes),data=telecomdata)
summary(anova11)
anova12=aov(churn~(total.night.calls),data=telecomdata)
summary(anova12)
anova13=aov(churn~(total.night.charge),data=telecomdata)
summary(anova13)
anova14=aov(churn~(total.intl.minutes),data=telecomdata)
summary(anova14)
anova15=aov(churn~(total.intl.calls),data=telecomdata)
summary(anova15)
anova16=aov(churn~(total.intl.charge),data=telecomdata)
summary(anova16)
anova17=aov(churn~(customer.service.calls),data=telecomdata)
summary(anova17)

#check if area code is categorical or not
# if yes then anova else chisq
table(telecomdata$area.code)
table(telecomdata$number.vmail.messages)

chisq.test(telecomdata$churn,telecomdata$area.code)
chisq.test(telecomdata$churn,telecomdata$international.plan)
chisq.test(telecomdata$churn,telecomdata$voice.mail.plan)

#remove variables which aren't correlated
#anova & chisq : columns having pvalue >0.05 should be removed
telecom=select(telecomdata,-2,-3,-4,-9,-12,-15)

#model-1
#spilt into 70:30 and store in respective table
sample=sample.split(telecom$churn,SplitRatio=0.70)
training=subset(telecom,sample==TRUE)
test=subset(telecom,sample==FALSE)

#train the model using logistic regression
model=glm(churn~.,data=training)
#store predicted value in a new column in test table
test$predicted_churn=predict(model,test)

# since dependent variable is categorial then if the predicted value is >0.05 then change it into 1 else 0
test$binary=ifelse(test$predicted_churn>0.05,1,0)

#validation
#confusion matrix 
table(test$churn,test$binary)

#model-2 using randomForest Algorithm
install.packages("randomForest")
require(randomForest)
sample=sample.split(telecom$churn,SplitRatio=0.70)
training=subset(telecom,sample==TRUE)
test=subset(telecom,sample==FALSE)
model=randomForest(churn~.,data=training)

test$predicted_churn=predict(model,test)
test$binary=ifelse(test$predicted_churn>0.50,1,0)
table(test$churn,test$binary)
