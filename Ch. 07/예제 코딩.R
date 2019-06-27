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


# 7-02. 모집단이 세 개 이상
# 코드 7-5 
ad <- read.csv ("data/age.data.csv")
str(ad)
ad$score <- ifelse(ad$score==99, NA , ad$score)
ad$scale <- factor(ad$scale)
ad$sex <- factor (ad$sex)

y1 <- ad$age [ad$score == "1"] ; y1 <- y1 [!is.na(y1)] ; y1
y2 <- ad$age [ad$score == "2"] ; y2 <- y2 [!is.na(y2)] ; y2
y3 <- ad$age [ad$score == "3"] ; y3 <- y3 [!is.na(y3)] ; y3

y1.mean <- mean(y1) ; y1.mean
y2.mean <- mean(y2)
y3.mean <- mean(y3)

sse.1 <- sum((y1- y1.mean)^2)  
sse.2 <- sum((y2- y2.mean)^2)
sse.3 <- sum((y3- y3.mean)^2)
sse <- sse.1+sse.2 +sse.3
dfe <- (length(y1) -1)+ (length(y2) -1)+ (length(y3) -1)

y.mean <- mean(ad$age)

sst.1 <- length(y1) * sum((y1.mean- y.mean)^2)
sst.2 <- length(y2) * sum((y2.mean- y.mean)^2)
sst.3 <- length(y3) * sum((y3.mean- y.mean)^2)
sst <- sst.1 + sst.2 + sst.3
dft <- length(levels (ad$scale)) - 1

sum((ad$age-y.mean)^2) 
sst + sse

mst <- sst /dft











