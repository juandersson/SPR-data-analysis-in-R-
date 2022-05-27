#------------------------------------------------------------------------------------------------------------------
#                                    ~~ FITTING DISSOCIATION CURVES ~~
#------------------------------------------------------------------------------------------------------------------
# This R script provides code for fitting SPR dissociation phase curves using either a monophasic or biphasic model.  
#------------------------------------------------------------------------------------------------------------------
#                                          ~Monophasic model~
#------------------------------------------------------------------------------------------------------------------
# Note that the following code is set up to model the simulated data "monodissim" and certain code will need to be 
# specified according to the data being analysed.     

#Create vectors for the response and the time, and zero the time variable. 
RU <- monodissim$RU
t <- monodissim$Time - 200                     
      #In the simulated data these columns are labeled "RU" and "Time", but this will need to be specified 
      #according to the data being analysed.   

#Plot the data 
plot(t, RU, yaxs = "i", xaxs = "i", xlim = c(0, 510), ylim = c(0,155), xlab = "Time(s)", ylab = "RU")
      #The "xlim" and "ylim" functions are used to set the range of the x and y-axes of the graph.
      #Choose which values are most suitable to visualize the data being analysed.   


#Create a fit for the curve using the non-linear regression function with a monophasic model 
fit <- nls(RU ~ y0 + A*exp(-kd*t), start = list(y0 = 0, A = 40, kd = 0.01))
      #Starting values, or estimations, must be set for the parameters in the command "start=list()".
      #The values set must be within a reasonable range for the potential parameter values. 
      #Otherwise the model algorithm will not be able to converge and an error message will be received. 
      #These estimations are naturally specific to the data being analysed.   

#Create a data frame of the values of "t" for which to get predictions of the fit.   
new.data <- data.frame(t = seq(min(t),max(t),len = 500))
      #Adjust "len" according to the association time of the data being analysed.   


#Visualise the modeled fit in the plot.
lines(new.data$t,predict(fit,newdata = new.data), col = "red", lwd =  "2")

#View the estimated values of the parameters.
summary(fit)

#If the fit gives a "y0" value which is too high (it should be approaching 0), the y0 value can be set to 0 
fit <- nls(RU ~ 0 + A*exp(-kd*t), start = list(A = 40, kd = 0.01))

#Visualise the new fit and get the estimated values of the parameters. 
lines(new.data$t,predict(fit,newdata = new.data), col = "red", lwd = "2")
summary(fit)



#------------------------------------------------------------------------------------------------------------------
#                                          ~Biphasic model~
#------------------------------------------------------------------------------------------------------------------
# Note that the following code is set up to model the simulated data "bisimdiss" and certain code will need to be 
# specified according to the data being analysed.   

#similarly to the code using a monophasic model, run the following code with specifications according to the 
# data being analysed: 
RU <- bidissim$RU
t <- bidissim$Time - 200
plot(t, RU, yaxs = "i", xaxs = "i", xlim = c(0, 1250), ylim = c(0,330), xlab = "Time(s)", ylab = "RU")

#Create a fit for the curve using the non-linear regression function with a biphasic model 
fit <- nls(RU ~ y0 + A1*exp(-kd1*t) + A2*exp(-kd2*t), start = list(y0=0, A1 = 200, kd1 = 0.01, A2 = 130, kd2 = 0.001))

#Visualise the fit, and get the estimated values for the parameters.  
new.data <- data.frame(t = seq(min(t),max(t),len = 1200))
lines(new.data$t,predict(fit,newdata = new.data), col = "red", lwd =  "2")
summary(fit)

#If the fit gives a "y0" value which is too high, the y0 value can be set to 0 
fit <- nls(RU ~ 0 + A1*exp(-kd1*t) + A2*exp(-kd2*t), start = list(A1 = 200, kd1 = 0.01, A2 = 130, kd2 = 0.001))

#Visualise the new fit and get the estimated values of the parameters. 
lines(new.data$t,predict(fit,newdata = new.data), col = "red", lwd = "2")
summary(fit)
