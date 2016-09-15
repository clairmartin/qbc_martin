# Clair Martin
# 2016-09-15
# EEB QBC
# Lohmueller HW Day 1

la_height_in_mean = 69;
la_height_in_sd = 10;

# function get_heights
# is this really a function without any input?

get_heights <- function(num){
  la_height_in_mean = 69;
  la_height_in_sd = 10;
  
  heights <- rnorm(num,69,10);
  
  mean_heights <- mean(heights);
  return(mean_heights);
}# function(num)
# to run function: heights<-get_heights(1000)

#### mean_heights_100 ####
mean_heights_100 <- rep(NaN,100)

for (ii in 1:1000){
  mean_heights_ii <- get_heights(100);
  mean_heights_100[ii] <- mean_heights_ii;
  rm(mean_heights_ii)
}

#### mean_heights_1000 ####
mean_heights_1000 <- rep(NaN,1000)

for (ii in 1:1000){
  mean_heights_ii <- get_heights(1000);
  mean_heights_1000[ii] <- mean_heights_ii;
  rm(mean_heights_ii)
}

#### Plot ####

# Convert to binned counts

# get min max with floor ceil
min_val = floor(min(c(mean_heights_100, mean_heights_1000)));
max_val = ceiling(max(c(mean_heights_100, mean_heights_1000)));

# bins by 1
bins <- seq(min_val,max_val,0.5);

# get counts
ct100 <- hist(mean_heights_100,breaks=bins)$counts;
ct1000 <- hist(mean_heights_1000,breaks=bins)$counts;


# Plotting

# open pdf file
pdf(file="la_heights_histo.pdf", width=6,height=6); 

# set plotting area & margins
par(mfrow=c(1,1), mar=c(2, 2, 2, 2));

# Print/draw
# 100 = red, 1000 = blue
  barplot(rbind(ct100,ct1000),col=c(2,4),beside=T,names.arg=seq(min_val,max_val,by=1),xlab="Average Height (inches)",ylab="Count", axes=T, axisnames=T)

# Add legend
legend(1,350,c("n=100","n=1000"),col=c(2,4),lwd=4);

# close pdf
dev.off()
