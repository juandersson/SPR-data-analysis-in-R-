#------------------------------------------------------------------------------------------------------------------
#                                    ~~ Deriving KD by equilibrium analysis ~~
#------------------------------------------------------------------------------------------------------------------
# This R script provides code for fitting a non linear model to the relationship between Beq and analyte concentration
# in order to derive the KD of a reaction. 

# Create vectors for the concentration variable and corresponding Beq values. The first value should be 0 
# for both variables 
# The following values are simply examples
c <- c(0,4,8,16,31,62,125,250,500)
Beq <- c(0, 13, 32, 55, 88, 145, 202, 245, 280)

#Plot the data 
plot(c,Beq, ylim = c(0,300),xlab="[analyte]", ylab="Beq")
      #the "xlim" is set to best visualise the example data
      #choose which range of X-values are most suitable to visualise the data being analysed.   

#Create a fit for the curve using the non-linear regression function 
fit <- nls(Beq ~ Bmax * (c/(KD +c)), start = list(Bmax = 350 , KD = 150))
      #Starting values, or estimations, must be set for the parameters in the command "start=list()".
      #The values set must be within a reasonable range for the potential parameter values. 
      #Otherwise the model algorithm will not be able to converge and an error message will be received. 
      #These estimations are naturally specific to the data being analysed.   

#Create a data frame of the values of "c" for which to get predictions of the fit.   
new.data <- data.frame(c = seq(min(c),max(c),len = 500)) 
      #Adjust "len" according to the highest analyte concentration of the data being analysed.                              


#Visualise the modeled fit in the plot.
lines(new.data$c,predict(fit,newdata = new.data), col = "red", lwd = "2")

#View the estimated values of the parameters.
summary(fit)
