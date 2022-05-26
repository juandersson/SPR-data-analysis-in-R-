#------------------------------------------------------------------------------------------------------------------
#                                    ~~ FITTING ASSOCIATION CURVES ~~
#------------------------------------------------------------------------------------------------------------------
# This R script provides code for fitting SPR association phase curves using either a monophasic or biphasic model.  
#------------------------------------------------------------------------------------------------------------------
#                                          ~Monophasic model~
#------------------------------------------------------------------------------------------------------------------
# Note that the following code is set up to model the simulated data "monoassim" and certain code will need to be 
# specified according to your data.  

#Create vectors for the response and the time. 
RU <- monoassim$RU   
t <- monoassim$Time                      
      #In the simulated data these columns are labeled "RU" and "Time", but this will need to be specified 
      #according to your data. 

#Plot the data 
plot(t, RU, yaxs = "i", xaxs = "i", xlab = "Time(s)", ylab = "RU",xlim = c(0,210), ylim = c(0,155)) 
      #the "xlim" and "ylim" functions are used to set the range of the x and y-axes of the graph.
      #choose which values are most suitable to visualize your curve 

#Create a fit for the curve using the non-linear regression function with a monophasic model 
fit <- nls(RU ~ (Beq*(1-exp(-t*kobs))), start=list (Beq = 160, kobs = 0.1)) 
      #Starting values, or estimations, must be set for the parameters in the command "start=list()".
      #The values set must be within a reasonable range for the potential parameter values. 
      #Otherwise the model algorithm will not be able to converge and you will receive an error message. 
      #These estimations are naturally specific to your data. 

#Create a data frame of the values of "t" for which you want to get predictions of the fit.   
new.data <- data.frame(t = seq(min(t),max(t),len = 200)) 
      #Adjust "len =" according to the association time of your data                               
                              
#Visualise the modeled fit in your plot.
lines(new.data$t,predict(fit,newdata = new.data), col = "red", lwd = "2")

#View the estimated values of the parameters.
summary(fit)

#------------------------------------------------------------------------------------------------------------------
#                                          ~Biphasic model~
#------------------------------------------------------------------------------------------------------------------
# Note that the following code is set up to model the simulated data "biassim" and certain code will need to be 
# specified according to your data.

#similarly to the code using a monophasic model, run the following code with specifications according to your data: 
my_data <- read.csv(file.choose(), 
                    stringsAsFactor = FALSE)
RU <- biassim$RU
t <- biassim$Time
plot(t, RU, yaxs = "i", xaxs = "i", xlim = c(0,210), ylim = c(0,340), xlab = "Time(s)", ylab = "RU")

#Create a fit for the curve using the non-linear regression function with a biphasic model 
fit <- nls(RU ~ (Beq1*(1-exp(-t*kobs1))) + (Beq2*(1-exp(-t*kobs2))), start = list (Beq1 = 200, kobs1 = 0.1, Beq2 = 100, kobs2 = 0.01))

#Visualise your fit, and get the estimated values for the parameters.  
new.data <- data.frame(t = seq(min(t),max(t),len = 200))
lines(new.data$t,predict(fit,newdata = new.data), col = "red", lwd =  "2")
summary(fit)              