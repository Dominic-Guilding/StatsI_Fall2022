incumbents <- read.csv("https://raw.githubusercontent.com/ASDS-TCD/StatsI_Fall2022/main/datasets/incumbents_subset.csv")
library(ggplot2)
install.packages("car")
library(car)
library(dplyr)
library(stargazer)

#1
model1 <- lm(formula = voteshare ~ difflog, data = incumbents)
summary(model1)
firstgraph <- incumbents %>%
  ggplot(aes(x=difflog, y=voteshare)) +
  geom_point(alpha=0.2) +
  labs(x="Difference in campaign spending",
       y="Incumbent voteshare") +
  geom_smooth()
  print(firstgraph)

res1 <- residuals(model1)

#2
model2 <- lm(formula= presvote ~ difflog, data = incumbents)
summary(model2)
secondgraph <- incumbents %>%
  ggplot(aes(x=difflog, y=presvote)) +
  geom_point(alpha=0.2) +
  labs(x="Difference in campaign spending",
       y="Voteshare of incumbent party presidential candidate") +
  geom_smooth()
print(secondgraph)

res2 <- residuals(model2)

#3 
model3 <- lm(formula = voteshare ~ presvote, data = incumbents)
summary(model3)
thirdgraph <- incumbents %>%
  ggplot(aes(x=presvote, y=voteshare)) +
  geom_point(alpha=0.2) +
  labs(x="Voteshare of incumbent party presidential candidate",
       y="Incumbent voteshare") +
  geom_smooth()
print(thirdgraph)

#4
residuals <- data.frame(res1, res2)
reg_res <- lm(formula = res1~res2, data=residuals)
summary(reg_res)
fourthgraph <- residuals %>%
  ggplot(aes(x=res2, y=res1)) +
  geom_point(alpha=0.2) +
  labs(x="Residuals of second regression",
       y="Residuals of first regression") +
  geom_smooth()
print(fourthgraph)

#5
model4 <- lm(formula = voteshare ~ difflog + presvote, 
             data=incumbents)
summary(model4)
car::avPlots(model4)

stargazer(model1, model2,model3, model4, reg_res,
        type='html', out="regmodels.html", out.header=TRUE)

# Y = 0.4486442 + 0.0355431 + 0.2568770 + e
#The intercepts for the residual regression and presvote~voteshare.

