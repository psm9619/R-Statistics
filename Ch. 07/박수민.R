library(dplyr)
car <- mtcars

mpg.auto <- car %>%
  filter(am %in% 1) 
mpg.man <- car %>%
  filter(am %in% 0) 
mpg.auto <- mpg.auto$mpg
mpg.man <- mpg.man$mpg

par(mfrow=c(1,2))
shapiro.test(mpg.auto)
qqnorm(mpg.auto)
qqline(mpg.auto)
shapiro.test(mpg.man)
qqnorm(mpg.man)
qqline(mpg.man)

v <- var.test(mpg.auto,mpg.man) ; v
data.frame(F_value = round(v$statistic, 3), P_value = round(v$p.value,3),
           Conclusion = " P>0.05 이므로 두 집단의 분산은 동일")
t <- t.test(mpg.auto,mpg.man,
            mu = 0, var.equal = FALSE) ; t
data.frame(t_value = round(t$statistic, 3), P_value = round(t$p.value,3),
           Conclusion = " P<0.05 이므로 am 에 따른 mpg 의 차이가 존재한다")






cars_M <- MASS::Cars93
head(cars_M)

org.US <- cars_M %>%
  filter(Origin %in% "USA")  
org.non_US <- cars_M %>%
  filter(Origin %in% "non_USA") ; head(org.non_US)
org.US <- org.US$Price  
org.non_US <- org.non_US$Price ; org.non_US

par(mfrow=c(1,2))
shapiro.test(org.US)
qqnorm(org.US)
qqline(org.US)
shapiro.test(org.non_US)
qqnorm(org.non_US)
qqline(org.non_US)

v <- var.test(org.US,org.non_US)
data.frame(F_value = round(v$statistic, 3), P_value = round(v$p.value,3),
           Conclusion = "두 집단의 분산은 동일하지 않다")
t <- t.test(org.US, org.non_US,
            mu = 0, var.equal = FALSE) ; t
data.frame(t_value = round(t$statistic, 3), P_value = round(t$p.value,3),
           Conclusion = "P>0.05 이므로 국적에 따른 가격 차이가 나지 않는다")

























