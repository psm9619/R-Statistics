# Ch. 7.
# 7-1 모집단이 2 개 일 경우
data <- read.table("./data/chapter7.txt", header=T)
data2 <- data.frame (gender=c(1,1), weight = c(3350, 3380))

boy <- subset(data,gender == 1)
girl <- subset(data, gender ==2)


# 정규성 테스트
shapiro.test(boy$weight)  # p-value = 0.01798 -> below alpha = 0.05
qqnorm(boy$weight)  # 밑에 그려지는 line 에서 심하게 (significant) 분산한다. 
qqline(boy$weight)  

shapiro.test(girl$weight)
qqnorm(girl$weight)
qqline(girl$weight)

# 등분산성 테스트 (분산이 같은가)
# F test to compare two variables
var.test(data$weight ~ data$gender)  

# 2 sample t. test  
t.test(data$weight~data$gender, mu = 0, alternative = "less", var.equal = TRUE)



# 예제 7-2
install.packages("PairedData")
library(PairedData)
data(anorexia)
data <- Anorexia
str(data)

install.packages ("psych")
library(psych)
summary(data)
describe(data)

n <- length(data$Prior - data$Post)
m <- mean(data$Prior - data$Post)
s <- sd (data$Prior - data$Post)
t.t <- m/(s/sqrt(n)) ; t.t

t.test(data$Prior, data$Post, paired=T, alternatie = "less")



































