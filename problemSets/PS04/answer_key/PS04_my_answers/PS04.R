install.packages("car")
library("car")
data(Prestige)
help(Prestige)
Prestige$type
head(Prestige$type)
View(Prestige)
#1(a)
Prestige$professional_dummy <- ifelse(Prestige$type=="prof", 1, 0)
#(b)
model1 <- lm(formula=prestige~income*professional_dummy, data = Prestige)
summary(model1)
#(c)
# Y=21.1422589 + 0.0031709 * 37.7812800
#(d)
#For every one unit increase in the value of income, the estimated value of 
#prestige increases by 0.0031709. So, the effect of income on prestige is 
#statistically significant but its effect is relatively small.
#(e)
#The quality of belonging to the professional class increases prestige score by
#37.78. 
#(f)
21.1422589+37.7812800+(0.0031709*1000) = 62.09444
#(g)
21.1422589+(37.7812800*0) + (0.0031709*6000) = 40.16766

#2(a)
#No direction indicated in question, so using a two-tailed hypothesis test.
#H0: B = 0
#Ha: B ≠ 0
#critical value of t when n=30: 0.683
#(0.042-0/seB0) = 
#(b)
#No direction indicated in question, so using a two-tailed hypothesis test.
#H0: B = 0
#Ha: B ≠ 0
#critical value of t when n=78: 0.679
#(0.042-0/seB0) =
#(c)
#The constant 0.302 indicates the value of the dependent variable (percentage of
#the vote that went to McAuliffe) at the point it crossed the Y-axis.
#(d)
#The overall fit of the model is quite poor. The r-squared value is 0.094, so
#the model explains less than 10% of the variation observed. There are 
#likely more decisive factors informing people's voting choices, such as 
#party id of the incumbent, perceptions of president's performance/perceptions
#of economic performance, crime levels in state, etc.

