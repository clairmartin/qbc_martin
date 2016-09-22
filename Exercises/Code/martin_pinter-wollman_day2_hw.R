# Clair Martin
# 2016-09-17
# EEB QBC
# Pinter-Wollman HW Day 2

#### I.1 Weight diff at day 0 ####
#Plot and examine if there is a statistical difference between the weights of chicks
#assigned to different diet treatments on day 0 

# dataframe has 4 col: weight, Time, Chick, Diet

# Get all day 0 samples
day0 = ChickWeight[ChickWeight$Time == 0,]

# run an ANOVA:
anova1=aov(day0$weight~day0$Diet) # set up the statistical test
summary(anova1) # look at the results of the statistical test
tukey_day0 <-TukeyHSD(anova1) # examine each pair using a Tukey test POST HOC to check which are different from eachother

# Plot
#plotfilename = "/Users/jungminson/qbc_martin/Exercises/martin_pinter-wollman_day2_output_chickweightday0_2.pdf";
plotfilename = "/Users/jungminson/qbc_martin/Exercises/martin_pinter-wollman_day2_output_chickweightday0.pdf";

# Create pdf object/open pdf output device
pdf(file=plotfilename,width=6,height=7);

par(mfrow=c(1,1), mar=c(4, 4, 4, 4)); # set subplot pos and size

plot(day0$Diet, day0$weight,
     xlab = "Diet", ylab = "Weight, g", 
     ylim = c(38,45),
     main = "Chick Weights at Day 0");

# Add significance notation
#text(c(1,2,3,4),c(44,44,44,44), # set the location of the letters 
 #    c('A','A','A','A'), # set which letters to display  on the plot
  #   cex=2) # make sure they are large enough to read
# Try to add a table in next subplot
print.data.frame(tukey_day0,show.rownames = F)
write.table(tukey_day0,plotfilename)
# Close output stream
dev.off() # shuts off current output devbice

#### I.2 Weight diff at day 21 ####
#Plot and examine if there is a statistical difference between the weights of chicks
#assigned to different diet treatments at the end of the study (day 21).

# Get all day 0 samples
day21 = ChickWeight[ChickWeight$Time == 21,]

# run an ANOVA:
anova2=aov(day21$weight~day21$Diet) # set up the statistical test
summary(anova2) # look at the results of the statistical test
TukeyHSD(anova2) # examine each pair using a Tukey test POST HOC to check which are different from eachother

# Plot
plotfilename = "/Users/jungminson/qbc_martin/Exercises/martin_pinter-wollman_day2_output_chickweightday21.pdf";

# Create pdf object/open pdf output device
pdf(file=plotfilename,width=6,height=7);

par(mfrow=c(1,1), mar=c(4, 4, 4, 4)); # set subplot pos and size
plot(day21$Diet, day21$weight,
     xlab = "Diet", ylab = "Weight, g", 
     #ylim = c(38,45),
     main = "Chick Weights at Day 21");

# Add significance notation

# Close output stream
dev.off() # shuts off current output devbice

#### I.3 Effect of diet on growth ####
# Is there an effect of diet on chick growth? (HINT: you will need to use a repeated
# measures ANOVA)

anova3 <- aov(ChickWeight$weight ~ ChickWeight$Diet * ChickWeight$Time)
summary(anova3)

#### I.4. Plot diet effects on growth ####
# Plot the effects of diet on chick growth.

# number of ways to do this: plot delta, plot before after box plot gtx style

# try 1
# make dataframe? by diet
g1 = ChickWeight[ChickWeight$Diet == 1,];
g2 = ChickWeight[ChickWeight$Diet == 2,];
g3 = ChickWeight[ChickWeight$Diet == 3,];
g4 = ChickWeight[ChickWeight$Diet == 4,];

# get mean and sd by group and timepoint
# get unique time points by group
timepoints = unique(g1$Time)
#initialize array
n_timepoints <- length(timepoints);
g1_mean = rep(NA,n_timepoints)
g1_sd = rep(NA,n_timepoints)

n=1
for (x in timepoints){
  y = g1[g1$Time == x,];
  
  g1_mean[n] <- mean(y$weight);
  g1_sd[n] <- sd(y$weight);
  
  rm(y)
  n=n+1
}

# get unique time points by group
timepoints = unique(g2$Time)
#initialize array
n_timepoints <- length(timepoints);
g2_mean = rep(NA,n_timepoints)
g2_sd = rep(NA,n_timepoints)

n=1
for (x in timepoints){
  y = g2[g2$Time == x,];
  
  g2_mean[n] <- mean(y$weight);
  g2_sd[n] <- sd(y$weight);
  
  rm(y)
  n=n+1
}

# get unique time points by group
timepoints = unique(g3$Time)
#initialize array
n_timepoints <- length(timepoints);
g3_mean = rep(NA,n_timepoints)
g3_sd = rep(NA,n_timepoints)

n=1
for (x in timepoints){
  y = g3[g3$Time == x,];
  
  g3_mean[n] <- mean(y$weight);
  g3_sd[n] <- sd(y$weight);
  
  rm(y)
  n=n+1
}

# get unique time points by group
timepoints = unique(g4$Time)
#initialize array
n_timepoints <- length(timepoints);
g4_mean = rep(NA,n_timepoints)
g4_sd = rep(NA,n_timepoints)

n=1
for (x in timepoints){
  y = g4[g4$Time == x,];
  
  g4_mean[n] <- mean(y$weight);
  g4_sd[n] <- sd(y$weight);
  
  rm(y)
  n=n+1
}

# ref: http://stackoverflow.com/questions/15063287/add-error-bars-to-show-standard-deviation-on-a-plot-in-r


#quartz()

plotfilename = "/Users/jungminson/qbc_martin/Exercises/Outputs/martin_pinter-wollman_day2_output_DietEffectsOnGrowth.pdf";

# Create pdf object/open pdf output device
pdf(file=plotfilename,width=10,height=7.5);

par(mfrow=c(1,1), mar=c(4, 4, 4, 4)); # set subplot pos and size

x = timepoints-0.18;
y = g1_mean;
sd = g1_sd;

plot (x, y, ylim = c(0,400), xlim = c(-1,22), 
      cex = 0.5, pch = 19, 
      xlab = "Days", ylab = "Weight, g",
      main = "Chick Weight (g) Mean and SD by Diet"
)
epsilon = 0.02
for(i in 1:n_timepoints) {
  up = y[i] + sd[i]
  low = y[i] - sd[i]
  segments(x[i],low , x[i], up)
  segments(x[i]-epsilon, up , x[i]+epsilon, up)
  segments(x[i]-epsilon, low , x[i]+epsilon, low)
}

x = timepoints-0.06;
y = g2_mean;
sd = g2_sd;
plotcol = "red";

matplot(x,y, col= plotcol, cex = 0.5, pch = 19, add = T)
epsilon = 0.02
for(i in 1:n_timepoints) {
  up = y[i] + sd[i]
  low = y[i] - sd[i]
  segments(x[i],low , x[i], up, col = plotcol)
  segments(x[i]-epsilon, up , x[i]+epsilon, up, col = plotcol)
  segments(x[i]-epsilon, low , x[i]+epsilon, low, col = plotcol)
}

x = timepoints+0.06;
y = g3_mean;
sd = g3_sd;
plotcol = "blue";

matplot(x,y, col= plotcol, cex = 0.5, pch = 19, add = T)
epsilon = 0.02
for(i in 1:n_timepoints) {
  up = y[i] + sd[i]
  low = y[i] - sd[i]
  segments(x[i],low , x[i], up, col = plotcol)
  segments(x[i]-epsilon, up , x[i]+epsilon, up, col = plotcol)
  segments(x[i]-epsilon, low , x[i]+epsilon, low, col = plotcol)
}

x = timepoints+0.18;
y = g4_mean;
sd = g4_sd;
plotcol = "green";

matplot(x,y, col= plotcol, cex = 0.5, pch = 19, add = T)
epsilon = 0.02
for(i in 1:n_timepoints) {
  up = y[i] + sd[i]
  low = y[i] - sd[i]
  segments(x[i],low , x[i], up, col = plotcol)
  segments(x[i]-epsilon, up , x[i]+epsilon, up, col = plotcol)
  segments(x[i]-epsilon, low , x[i]+epsilon, low, col = plotcol)
}

legend(0,375, # set the location x, y 
       c("Diet 1", "Diet 2", "Diet 3", "Diet 4"), # text to display
       text.col=c("black", "red", "blue", "green"), #text color
       bty ='n') # remove outline of legend box
dev.off() # shuts off current output devbice


#### I.5 Chick growth unq color plot ####
# Using a ‘for’ loop, plot the growth of each chick in a different color, all on the same plot
n_chicks = length(unique(ChickWeight$Chick))
#quartz();

plotfilename = "/Users/jungminson/qbc_martin/Exercises/Outputs/martin_pinter-wollman_day2_output_IndividualChickGrowth.pdf";

# Create pdf object/open pdf output device
pdf(file=plotfilename,width=10,height=7.5);

ylims = c(0,400)
for (n in 1:n_chicks){
  ii = ChickWeight[ChickWeight$Chick == n,]
  
  if (n == 1){
    plot(ii$Time, ii$weight, 
         type = "l", cex = 0.5, col=rainbow(n_chicks*10)[n*10], 
         ylim = ylims, 
         ylab = "Weight, g", xlab = "Days",
         main = "Chick Weight (g) by Individual")
  } else {
    matplot(ii$Time, ii$weight, type = "l", cex = 0.5, col=rainbow(n_chicks*10)[n*10], add = T)
  }
  
  rm(ii)
}

dev.off()
#### II Population Growth model ####

# not reached in lecture.