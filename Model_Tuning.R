#library
library(iClusterPlus)
library(GenomicRanges)
library(gplots)
library(lattice)
#set parallel computing
library("doParallel")
registerDoParallel(cores=2) #MAY THAY HINH NHU LA 8 cores?

#set working direction
setwd("~/Desktop/run")
#load data
load("/Users/admin/Desktop/run/run.RData")
#set the original of data
c_cna_o<-c_cna
c_exp_o<-c_exp


for(k in 7:10){
  cv2.fit = tune.iClusterPlus(cpus=24,dt1=c_mut,dt2=c_cna_o,dt3=c_exp_o,
                              type=c("binomial","gaussian","gaussian"),K=k,n.lambda=185, 
                              scale.lambda=c(0.05,1,1),maxiter=20)
  save(cv2.fit, file=paste("Hau_500Gene_185n.lambda_cv2.fit.k",k,".Rdata",sep=""))}