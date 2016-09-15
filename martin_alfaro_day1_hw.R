# Clair Martin
# 2016-09-15
# EEB QBC
# Alfaro HW Day 1

#### Exercise 1 ####
# Not clear if 8 or 9 \n in the output
# Assume 9 \n and then *

# a
for (ii in 1:9){
  output = cat(output,"\n")
  
  if (ii == 9) {
    output = cat(output,"*");
    }
}

# b
for (ii in 1:9){
  cat("\n")
  
  if (ii == 9) {
    cat("*");
  }
}

#### Exercise 2 #####
for (ii in 1:9){
  cat("*&")
  
  if (ii == 9) {
    cat("*");
  }
}

#### Exercise 3 #####
# A. 
# init = 10
# Loop1: in = 10, out = 11
# Loop2: in = 11, out = 12
# Loop3: in = 12, out = 13
# Loop4: in = 13, out = 14
# Loop5: in = 14, out = 15

#B.
# init = 0
# Loop1: in = 0, out = -4
# Loop2: in = -4, out = -9
# Loop3: in = -9, out = -15
# Loop4: in = -15, out = -22
# Loop5: in = -22, out = -30

#C. 
# init = 12
# Loop1: in = 12, out = -1
# Loop2: in = -1, out = 0
# Loop3: in = 0, out = 1
# Loop4: in = 1, out = 2
# Loop5: in = 2, out = 3

#### Exercise 4 ####
# Exercise unclear. This loop does not need to be modified to "print out a message during presidential as well as congressional election years"
# pres years = 2016, 2020; congress years = 2016, 2018, 2020
# But let's make it clearer which year it is
years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if (years[ii] %% 4 == 0){
    cat(years[ii], 'Hooray, presidental and congressional elections!', sep = '\t', fill = T)
    }
  else if (years[ii] %% 2 == 0){
      cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = T)
        } 
}

#### Exercise 5 #####
# I would do this as a vector. not a loop. preserve the loop for years.

#Hardcodes
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0125;

#Initialize new variable
# How do I create a sized vector without any values in it? NA? NaN? NULL?
n_accounts <- length(bankAccounts)
compounded <- rep.int(0,n_accounts)

for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }

#### Exercise 6 ####

# Hardcodes
bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7); #deduct
food<- c(3.5, 4.3, 5.0);    #deduct
fun <- c(7.8, 2.1, 10.5);  #deduct
#and incomes (through TAships) of 
income <- c(21, 21, 21); #add this

# Loop
for (j in 1:5) {
  for (i in 1:length(bankAccounts)) {
    #step 1 modify bankAccounts so that amounts reflect income and expenses
    bankAccounts[i] <- bankAccounts[i] - house[i];
    bankAccounts[i] <- bankAccounts[i] - food[i];
    bankAccounts[i] <- bankAccounts[i] - fun[i];
    bankAccounts[i] <- bankAccounts[i] + income[i];
    #step 2 get calculate interest and add to accounts from step 1
    interest <- bankAccounts[i] * (interestRate);
    bankAccounts[i] <- bankAccounts[i] + interest;
    rm(interest)
  }
}

#### Exercise 7 ####

# Hardcodes
house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0); 
fun <- c(7.8, 2.1, 10.5); 

#and incomes (through TAships) of 

income <- c(21, 21, 21);

# Disbursment ( NB units is thousands of $)
trustFund = 5;

# Loop
for (j in 2015:2020) {
  
  for (i in 1:length(bankAccounts)) {
    
    #step 1 modify bankAccounts so that amounts reflect income and expenses
    bankAccounts[i] <- bankAccounts[i] - house[i];
    bankAccounts[i] <- bankAccounts[i] - food[i];
    bankAccounts[i] <- bankAccounts[i] - fun[i];
    bankAccounts[i] <- bankAccounts[i] + income[i];
    if ( (j %% 2 == 1) & (i %% 2 == 1) ){
      bankAccounts[i] <- bankAccounts[i] + trustFund;
    }# if ((j %% 2 == 1) & (i %% 2 == 1))
    
    #step 2 get calculate interest and add to accounts from step 1
    interest <- bankAccounts[i] * (interestRate);
    bankAccounts[i] <- bankAccounts[i] + interest;
    rm(interest)
    
  }# for (i in 1:length(bankAccounts))  
  
}# for (j in 2015:2020)

#### Exercise 8 ####
xx<- 1
sum = 0;
while(xx < 18) {
  
  sum <- xx + sum
  xx <- xx + 1

}# while(xx < 18) 

#### Exercise 9 ####
# functions
numberSizeDescriptor <- function(num){
  if (num <= -1){
    print("small")
    }
  else if (num >= 1){
    print("big")
    }
  else{
    print("medium")
    }
}# function(num)

