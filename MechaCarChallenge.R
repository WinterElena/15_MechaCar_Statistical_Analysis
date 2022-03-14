# Use the library() function to load the dplyr package.
library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe.
mecha_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform linear regression using the lm() function. 
# In the lm() function, pass in all six variables (i.e., columns), 
# and add the dataframe you created in Step 4 as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)

# determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)) 

# Adjusted R-squared:  0.6825  p-value: 5.35e-11
###################################################
# Import the data
suspension_coil <- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# Create a summary data frame of the suspension coil's PSI continuous variable across all manufacturing lots
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Create a summary data frame grouped by Manufacturing Lot
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI),Variance = var(PSI), SD = sd(PSI))

####################
# RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the 
# population mean of 1,500 pounds per square inch.
t.test(suspension_coil$PSI,mu=1500)

# write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if 
# the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)

#Lot #1 Test
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)

#Lot #2 Test
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)

#Lot #3 Test
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)