data <- read.table("data/chapter7.txt", header=T)

par(mar=c(2, 1, 1, 1))
hist(data$weight[data$gender==1], xlim=c(1500, 4500), ylim=c(0, 12), 
     col="orange", border=NA, main="", xlab="", ylab="", axes=F)
hist(data$weight[data$gender==2], density=10, angle=45, 
     add=TRUE, col="green")
axis(1)
abline(v = mean(data$weight[data$gender==1]), lty=1, lwd=3, col="orange")
abline(v = mean(data$weight[data$gender==2]), lty=1, lwd=3, col="green")
legends = c("여자아이", "남자아이")
legend("topright", legend=legends, 
       fill=c("orange", "green"), density=c(NA, 20))

boy <- subset(data, gender==1) ; boy
girl <- subset(data, gender==2) ; girl

# 정규성 테스트
shapiro.test(boy$weight)
qqnorm(boy$weight)
qqline(boy$weight)
shapiro.test(girl$weight)
qqnorm(girl$weight)
qqline(girl$weight)

iriss <- subset(iris, Species=='setosa')
shapiro.test(iriss$Sepal.Length)  # p-value > 0.05, 정규성 있음
qqnorm(iriss$Sepal.Length)
qqline(iriss$Sepal.Length)
shapiro.test(iriss$Petal.Width)   # p-value < 0.05, 정규성 없음
qqnorm(iriss$Petal.Width)
qqline(iriss$Petal.Width)

# 그림 7-3. 분산의 동일성 여부에 따른 차이
x <- seq(-3, 3, by=0.01)
y <- dnorm(x)

plot(x, y, type="l", xlim=c(-3, 3.5), ylim=c(0, 0.5), axes=FALSE)
axis(1)
lines(c(0, 0), c(0, max(y)), lty=3)
text(-0.3, max(y)+0.05, "① 평균 0, 표준편차 1")
arrows(-0.2, max(y)+0.03, 0, max(y), length=0.1)

y2 <- dnorm(x+0.5, mean=0.5)
lines(x+0.5, y2, col="red")
lines(c(0.5, 0.5), c(0, max(y2)), lty=3)
text(2.3, max(y2)+0.05, "② 평균 0.5, 표준편차 1")
arrows(2, max(y2)+0.03, 1, dnorm(1, mean=0.5), length=0.1)

y3 <- dnorm(x-1, mean=-1, sd=1.5)
lines(x-1, y3, col="blue")
lines(c(-1, -1), c(0, max(y3)), lty=3)
text(-2, max(y3)+0.05, "③ 평균 -1, 표준편차 1.5")
arrows(-2, max(y3)+0.03, -1.5, dnorm(-1.5, mean=-1, sd=1.5), length=0.1)

# 등분산성 테스트
var.test(data$weight ~ data$gender)
var.test(weight ~ gender, data=data)

# 2-sample T test
t.test(data$weight ~ data$gender, mu=0, alternative="less", 
       var.equal=TRUE )




install.packages("PairedData")
library(PairedData)
data(Anorexia)
data <- Anorexia
str(data)

install.packages('psych')
library(psych)
summary(data)
describe(data)

n <- length(data$Prior - data$Post)
m <- mean( data$Prior - data$Post )
s <- sd (data$Prior - data$Post) ; s
t.t <- m/(s / sqrt(n))
alpha <- 0.05
qt(alpha, df=16)
pt(t.t, df=16)    # 검정통계량으로부터 구한 유의확률

t.test(data$Prior, data$Post, paired=T, alternative="less")



# 7-2. 모집단이 세개 이상
# 그림 7-6
set.seed(2)
grp1 <- rnorm(20, mean=-1)
grp2 <- rnorm(20, mean=0.5)
grp3 <- rnorm(20, mean=1)

d <- data.frame(grp=rep(1:3, each=20), val=c(grp1, grp2, grp3))
par(mar=c(1, 1, 1, 1))

plot(val~grp, data=d, pch=20, col="red", 
     xlim=c(1, 3.5), ylim=c(-4.2, 4), axes=F, xlab="", ylab="")

text(1.2, -4, "처리 1")
text(2.2, -3, "처리 2")
text(3.2, -2, "처리 3")

abline(h=mean(d$val), lwd=2, col="red")
arrows(1.5, 1.9, 1.5, mean(d$val), length=0.1)
text(1.5, 2.2, expression(bar(y[..]) ), cex=1.5)

lines(c(1, 1), c(-4, 2), lty=2, col="blue")
lines(c(2, 2), c(-2.5, 3.5), lty=2, col="blue")
lines(c(3, 3), c(-2, 4), lty=2, col="blue")

y1 <- seq(-4, 2, by=0.01)
x1 <- 1+dnorm(y1, mean=-1)
lines(x1, y1, lty=3, lwd=1.5)
lines(c(1, max(x1)), c(-1, -1), lty=2)
arrows(1.5, -3, 1.3, -2, length=0.05)
text(1.5, -3.2, expression(N(mu[1], sigma^2) ))

y2 <- seq(-2.5, 3.5, by=0.01)
x2 <- 2+dnorm(y2, mean=0.5)
lines(x2, y2, lty=3, lwd=1.5)
lines(c(2, max(x2)), c(0.5, 0.5), lty=2)
arrows(2.4, 1.8, 2.3, 1.3, length=0.05)
text(2.5, 2.2, expression(N(mu[2], sigma^2) ))

y3 <- seq(-2, 4, by=0.01)
x3 <- 3+dnorm(y3, mean=1)
lines(x3, y3, lty=3, lwd=1.5)
lines(c(3, max(x3)), c(1, 1), lty=2)
arrows(3.4, 2.8, 3.3, 2, length=0.05)
text(3.4, 3.2, expression(N(mu[3], sigma^2) ))

# 지역 규모별 나이 평균이 차이가 나는가?
ad <- read.csv("data/age.data.csv")
str(ad)
ad$score <- ifelse(ad$score==99, NA, ad$score)
ad$scale <- factor(ad$scale)
ad$sex <- factor(ad$sex)

tail(ad)

y1 <- ad$age[ad$scale=="1"]
y2 <- ad$age[ad$scale=="2"]
y3 <- ad$age[ad$scale=="3"]

y1.mean <- mean(y1)
y2.mean <- mean(y2)
y3.mean <- mean(y3)

sse.1 <- sum((y1 - y1.mean)^2)
sse.2 <- sum((y2 - y2.mean)^2)
sse.3 <- sum((y3 - y3.mean)^2)
sse <- sse.1 + sse.2 + sse.3
dfe <- (length(y1)-1) + (length(y2)-1) + (length(y3)-1)

y.mean <- mean(ad$age)

sst.1 <- length(y1) * sum((y1.mean - y.mean)^2)
sst.2 <- length(y2) * sum((y2.mean - y.mean)^2)
sst.3 <- length(y3) * sum((y3.mean - y.mean)^2)
sst <- sst.1 + sst.2 + sst.3
dft <- length(levels(ad$scale)) - 1

mst <- sst / dft
mse <- sse / dfe
f.t <- mst / mse

alpha <- 0.05
tol <- qf(1-alpha, 2, 147)

p.value <- 1 - pf(f.t, 2, 147)

# 그림 7-7
x <- seq(0, 4, by=0.01)
yf <- df(x, 2, 147)
par(mar=c(2, 1, 1, 1))
plot(x, yf, type="l", ylim=c(-0.1, 1), xlab="", ylab="", axes=F)
abline(h=0)
tol.r <- round(tol, 2)
polygon(c(tol.r, x[x>=tol.r], 4), c(0, yf[x>=tol.r], 0), col="red")
arrows(tol, 0.3, tol, 0.08, length=0.1)
text(tol, 0.32, 
     paste("P(F(2, 147) > ", round(tol, 3),")=0.05", sep=""), cex=0.8)
lines(c(f.t, f.t), c(0,df(f.t, 2, 147)), lty=2)
arrows(f.t, -0.05, f.t, 0, length=0.05)
text(f.t, -0.1, paste("F(2, 147)=", round(f.t, 3),sep=""), cex=0.8)

# R을 통한 p-value 구하기
ow <- lm(age~scale, data=ad)
anova(ow)

oneway.test(age~scale, data=ad, var.equal=TRUE)




