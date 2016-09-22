# Clair Martin
# 2016-09-17
# EEB QBC
# Lohmueller HW Day 2

#### Prepwork ####

# Clear workspace
rm(list=ls())

# Set working directory:
setwd("/Users/jungminson/qbc_martin/Data")

# Load data set
snpsDataFrame<-read.table('hapmap_CEU_r23a_chr2_ld-1.txt',header=TRUE)

#### 1.A. H-W Chi-square revisited ####

# Convert data frame to matrix
snps<-as.matrix(snpsDataFrame)

# Chi-square fxn
compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n
  chisq=sum((obscnts-expcnts)^2/expcnts)
  return(chisq)
}

# Perform chisquare on snp matrix
chisqs<-apply(snps,1,compute_chisquare)

# Get and store pvals
pvals<-pchisq(chisqs,1,lower.tail=FALSE)

#### 1.B. Pval proportions ####

# Get total number of pvals for denominator in proportion
n_pvals <- length(pvals); # = 4014

# <0.05 
signifthresh<-0.05
n_belowthresh_0.05 <- sum(pvals<signifthresh) # = 181
proportion_0.05 <- n_belowthresh_0.05/n_pvals; # = 0.04509218

# <0.01
signifthresh<-0.01
n_belowthresh_0.01 <- sum(pvals<signifthresh) # = 41
proportion_0.01 <- n_belowthresh_0.01/n_pvals; # 0.01021425

# <0.001
signifthresh<-0.001
n_belowthresh_0.001 <- sum(pvals<signifthresh) # = 5
proportion_0.001 <- n_belowthresh_0.001/n_pvals; # = 0.00124564

#### 1.C. Departures from H-W ####

# rename for KEL style, ignore length and use sum of boolean vector as before
num_pval_0.05 = n_belowthresh_0.05;
num_pval_0.01 = n_belowthresh_0.01;
num_pval_0.001 = n_belowthresh_0.001;

#### 1.D. Expected pvals ####

# Initiate variables
#exp_pval_0.05 = rep(NA,num_pval_0.05);
#exp_pval_0.01 = rep(NA,num_pval_0.01);
#exp_pval_0.001 = rep(NA,num_pval_0.001);
exp_pval = rep(NA,n_pvals);

# Make a numerator vector. ?cleaner way to do this
#numerator_0.05 = seq(1,num_pval_0.05,1);
#numerator_0.01 = seq(1,num_pval_0.01,1);
#numerator_0.001 = seq(1,num_pval_0.001,1);
numerator = seq(1,n_pvals,1);

# Get expected pvals 
#exp_pval_0.05 = numerator_0.05/num_pval_0.05;
#exp_pval_0.01 = numerator_0.01/num_pval_0.01;
#exp_pval_0.001 = numerator_0.001/num_pval_0.001;
exp_pval = numerator/n_pvals;

#### 1.E. Sort pvals ####

# sort(x, decreasing = FALSE, na.last = NA, ...)
sort_pvals = sort(pvals)

#### 1.F Get -log10 of exp and obsv pvals ####

log_sort_pvals = -log10(sort_pvals);

log_exp_pvals = -log10(exp_pval);

#### 1.F. Scatter plot ####

# Set file name
plotfilename = "/Users/jungminson/qbc_martin/Exercises/martin_lohmueller_day2_output_qqplot.pdf";

# Create pdf object/open pdf output device
#pdf(file=plotfilename,width=4,height=7);
pdf(file=plotfilename,width=6,height=6);


#Set pdf param
par(mfrow=c(1,1), mar=c(4, 4, 4, 4)); # set subplot pos and size
#mar order bottom, left, top, right

# Set axis label strings
xlab_str = "-log10(expected P-value)";
ylab_str = "-log10(observed P-value)";

# plot scatter
#quartz()
plot(log_exp_pvals, log_sort_pvals, type = "p", # scatter x y data
     xlab = xlab_str, ylab = ylab_str, # axis labels
     main = "QQ Plot from hapmap_CEU_r23a_chr2_ld.txt", # main title
     ylim = (c(0,5)), xlim = (c(0,5)),
     pch=19, # filled markers
     cex.lab=1.2, # label size
     cex.axis=1.2 # axis size
);

#### 1.H Add diagonal line (m=1) ####
linecolor = 2;

abline(a = 0, b = 1, col = linecolor)

# Close output stream
dev.off() # shuts off current output devbice
