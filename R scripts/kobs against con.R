#------------------------------------------------------------------------------------------------------------------
#                                    ~~ Deriving KD from kobs values ~~
#------------------------------------------------------------------------------------------------------------------
# This R script provides code for fitting a linear model for the relationship between kobs and analyte concentration
# in order to derive the KD of a reaction. 

# Create vectors for the concentration variable and corresponding kobs values.
# The following values are simply examples. 
c <- c(4,8,16,31,62,125,250,500)
kobs <- c(0.0039604, 0.0040308, 0.0042716, 0.0050106, 0.0061333, 0.008715, 0.01414, 0.0247)

#Plot the data 
plot(c,kobs, ylim = c(0,0.03),xlab="[analyte]", ylab="kobs")
      #the "xlim" is set to best visualise the example data
      #choose which range of X-values are most suitable to visualise the data being analysed.   

#Create a linear fit for the curve using the "lm" function 
fit <- lm(kobs ~ c)

#visualise the fit in the plot 
abline(fit, col = "red")

#View the estimated values for the coefficients.
summary(fit)
      #"(intercept)" is the y-intercept i.e. the dissociation rate constant.
      #"c" is the slope i.e. the association rate constant. 
      # KD is derived by dividing the dissociation rate constant by the association rate constant. 
      



