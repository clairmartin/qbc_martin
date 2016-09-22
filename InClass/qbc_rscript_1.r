#### INTRO WITH ALFARO####

## this is a comment in R

## to highlight and print a line in console (ml = F9)  use ctrl+return

## to get working directory (ml = cd)
getwd()

## to set working direcotry (ml = cd())
setwd("/Users/jungminson/qbc_martin")
##N.B. double quotes not single quotes a la ml

## for file naming avoid SPACES and probably - dash. Stick with under_score or per.iod

# to get help (ml = doc or help) use ?, e.g.
?Random
?lm
?read.csv

# to assign variables use x<-1 OR 1->x (ml = =) however = also seems to work for x = 1
x=1
x<-2
3->x

#concatenate or combine greeting<-c("hi","my","name","is","name")

# concatenate and print  is cat
# greeting2<-cat("hi","my","name","is","name")

# to list variables in workspace
ls()
# to remove variable from workspace
rm()

# to join gfunctions. COULD NOT DO JUST rm(ls())
rm(list=ls())

# to import a function use source("fulladdressofscript") 
# to import a library. Look at how to make pkg or make a script with all functions OR source for each.r

# reading some data
tt <- read.tree("tree.t")
# to see the variable I just import
str(tt)

# to see the attributes
attributes(tt)

# access those elements with $
tt$tip.label

#### CONTROL STATEMENTS ####

# for loops
# \n = new line
for (ii in 1:5){
  cat("\nthe number is ", ii)
}
# would also work as one line, but whitespace is ignored so make it read well

# while loops
# N.B. semicolon is used as command termination if you want (for some reason) to keep >1 command on same line
xx<- 1
while(xx < 5) {
  xx <- xx+1;
  if (xx == 3) {
    break;}
}
print(xx)

# if else statements use == (just like ml)
# can store output as variable x = yy == rr

# modulus division %%

# pseudocode

# functions
doubler <- function(num){
  doubled = 2 * num
  cat("I changed ", num, " to ", doubled, "\n")
  return(doubled)
}

# return @ 1:45

#### LOHMUELLER 1400######

# both Lohmueller and Alfaro will be teaching 200A

# tomorrow working with and manipulating "large" datasets

# ? today calculate some basic statistics, plotting, and familiarize self with simulation

# corny jokes

# basic helpful r functions
?rnorm
# take randome number from normal distribution
x = rnorm(3,1,2) # gets 3 random vals from norm dist mean = 3, sd = 2
# practice see slide 8
s1<-rnorm(1000,0,1)
s3<-rnorm(1000,0,3)

# use head(s1) to get first row of data as sample of dataset just for debug/practice

# histogram

# PRINTING
# SEE SLIDE 9

# open pdf file
pdf(file="Normal_hist.pdf",width=4,height=7);

#parameters of file
par(mfrow=c(2,1), mar=c(4, 4, 3, 2)); # set subplot pos and size
#mar order bottom, left, top, right

#plot hists in order
hist(s3,col=2,xlab="value",main="sigma = 3")#red
hist(s1,col=4,xlab="value",main="sigma = 1") #blue

# close output stream
dev.off() # shuts off current output devbice

# Print with greek letters

# open pdf file
pdf(file="Normal_hist_ouzo.pdf",width=4,height=7);

#parameters of file
par(mfrow=c(2,1), mar=c(4, 4, 3, 2)); # set subplot pos and size
#mar order bottom, left, top, right

#plot hists in order
hist(s3,col=2,xlab="value",main=expression(paste(sigma,"=3")))#red
hist(s1,col=4,xlab="value",main=expression(paste(sigma,"=1")))#blue

# close output stream
dev.off() # shuts off current output devbice

# see LAYOUT

# Smooth density plot
# see slide 13
# density
plot(density(s1))

#lwd = linewidth assignment (default = 1

# if you wanna add lines or points 

# THERE IS NO WAY TO GET A HANDLE. You print. Then have to restart new plot if need fix

# boxplot
pdf(file="Normal_boxplot.pdf", width=6,height=6); #open the file
par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) #sets plotting area and margins
boxplot(cbind(s1,s3),names=c("Sigma=1","Sigma=3"),main="Draws from a normal distribution",col=c(2,4))
 dev.off()
 
 # controlling bin size
 
 

