data =read.csv("D:\\ElectMart\\Train.csv")

seer=data[,-1]

dim(seer)
summary(seer)
str(seer)

freq=seer[,c(1,8)]
library(plyr)
freq=count(freq,"Client_ID")

final=join(seer,freq,by="Client_ID")

final$return=0
final$return[which(final$freq>1)]=1

model=glm(return~.,data=final)

write.csv(final,"D:\\ElectMart\\final.csv")
  
# sum(is.na(seer))
# 
# plot(seer)
# 
# aggr =read.csv("D:\\ElectMart\\test.csv")
# a=count(aggr,"cust")
# #a=aggregate(data=aggr,by=list(cust),FUN=count,na.rm=TRUE)
# aggr=join(aggr,a,by="cust")

