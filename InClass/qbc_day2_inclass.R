#2016-09-15

#UCLA EEB QBC Day 2

# vector math automatic (loops not reqd)

# functions in slides
# length()
# sum()
# mean()

# rep(toberepped,numtimes)

# seq(min,max,interval)

# sample(poolofvalues,numtimes)

# sometimes in function you have to assign the argument and argument value, e.g. seq(1,10,by=2) OR seq(1,10,2)
# has to agree to order if argument variable is not declared
# avoid ordered pairs of arguments by specifiying the parameter

# to access elements use brackets []

# to make a matrix
x<-seq(1,10)
y<-matrix(x,nrow=2,ncol=5)
# to fill by row in stead of column set byrow=T defaults to FALSE

# to look at the first row (a vector)
# NOTATION IS ROW,COLUMN
y[1,]
# dataframes
# KL suggest to think about aa matrix

# to denote missing values, use NA
x<-c(5,3,4,NA)
# to get mean ignoring NA
mean(x,na.rm=TRUE)

# DISTINCTION BETWEEN NaN (0/0) and NA (missing val)

#### matrix math #####

#fx apply
# 1= rows
# 2 = col
apply(y,1,mean)

#### playing with data ####

# SNPs data about genetic variation hapmap_CEU_r23a_chr2_ld.txt

#see AnalyzeSNPdata.2016.student.R

# to get a function into R can copy and paste into console or source the original .r file with the function (and maybe mny more)



# TO CLEAR WORKSPACE
rm(list = ls())

# to continue funcitons across lines (ml = ...) use , and just continue on \n

# list class more or less the same as cells in ml

# TUKEY test post hoc after anova to etermine which differs from which
