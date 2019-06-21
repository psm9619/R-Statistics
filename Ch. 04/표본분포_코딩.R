# 표본분포
# 예제 4-1. 표본평균 xbar 의 분포

m10 <- rep(NA, 1000)  # NA 로 차있는 1000개의 스팟을 만드는 것
m40 <- rep(NA, 1000)

set.seed(0)
for (i in 1:1000) {  
  m10[i] <- mean(rnorm(10))  # NA 로 비어있는 스팟에 랜덤한 10개 숫자의 평균을 넣는다
  m40[i] <- mean (rnorm(40))
  }

options(digits=4)
c(mean(m10), sd(m10))  # ~0.00x , ~0.35x
c(mean(m40), sd(m40))  # ~0.0000x, ~0.16x

par(mfrow=c(1,2))
hist(m10, xlim = c(-1.5,1.5), main = "n=10", xlab="x", ylab="", 
     col = "cyan", border= "blue")
hist(m40, xlim = c(-1.5,1.5), main = "n=40", xlab="x", ylab="", 
     col = "grey", border= "black")

par(mfrow=c(1,1))

# 예제 4-2. 정규분포로부터 추출된 표본평균의 xbar 분포
set.seed(0)
n <- 1000
r.1.mean <- rep(NA, n)
r.2.mean <- rep(NA,n)

for (i in 1:n) {
  r.1.mean[i] <- mean(rnorm (4, mean=3, sd =1))
  r.2.mean[i] <- mean(rnorm(4, mean=170, sd=6))
}
r.1.mean
options(digits=4)
c(mean(r.1.mean), sd(r.1.mean))
c(mean(r.2.mean), sd(r.2.mean))

hist(r.1.mean, breaks = 20,  prob=TRUE, main = "", xlab="표본평균", ylab="밀도", 
     col = "cyan", border= "blue")
x1 <- seq(min(r.1.mean), max(r.1.mean), length=1000)
y1 <- dnorm (x=x1, mean=3, sd=(1/sqrt(4)))
lines(x1, y1, lwd=2, col="blue")

hist(r.2.mean, breaks = 20,  prob=TRUE, main = "", xlab="표본평균", ylab="밀도", 
     col = "grey", border= "black")
x2 <- seq(min(r.2.mean), max(r.2.mean), length=1000)
y2 <- dnorm (x=x2, mean=170, sd=(6/sqrt(4)))
lines(x2, y2, lwd=2, col="blue")


# 예제 4-3. 임의의 분포에서 추출된 표본평균 xbar 의 분포
set.seed(0)
t <- 10  ;  p <- 0.1
x <- 0:10  ;  n <- 1000

b.2.mean <- rep(NA, n)
b.4.mean <- rep(NA, n)
b.32.mean <- rep(NA, n)
b.64.mean <- rep(NA, n)
for (i in 1:n) {
  b.2.mean[i] <- mean( rbinom(2, size=t, prob=p))
  b.4.mean[i] <- mean( rbinom(4, size=t, prob=p))
  b.32.mean[i] <- mean( rbinom(32, size=t, prob=p))
  b.64.mean[i] <- mean( rbinom(64, size=t, prob=p))
  }
options(digits=4)
c(mean(b.2.mean), sd(b.2.mean))
c(mean(b.4.mean), sd(b.4.mean))
c(mean(b.32.mean), sd(b.32.mean))

hist(b.2.mean,  prob=TRUE, 
     main = "", col = "orange", border= "yellow")
x1 <- seq(min(b.2.mean), max(b.2.mean), length=1000)
y1 <- dnorm (x=x1, mean= 1, sd=(0.9/sqrt(2)))
lines(x1, y1, lty=2, lwd=2, col="red")

hist(b.4.mean,  prob=TRUE, 
     main = "", col = "orange", border= "yellow")
x2 <- seq(min(b.4.mean), max(b.4.mean), length=1000)
y2 <- dnorm (x=x2, mean= 1, sd=(0.9/sqrt(4)))
lines(x2, y2, lty=2, lwd=2, col="red")

hist(b.32.mean,  prob=TRUE, 
     main = "", col = "orange", border= "yellow")
x3 <- seq(min(b.32.mean), max(b.32.mean), length=1000)
y3 <- dnorm (x=x3, mean= 1, sd=(0.9/sqrt(32)))
lines(x3, y3, lty=2, lwd=2, col="red")

hist(b.32.mean,  prob=TRUE, 
     main = "", col = "orange", border= "yellow")
x3 <- seq(min(b.32.mean), max(b.32.mean), length=1000)
y3 <- dnorm (x=x3, mean= 1, sd=(0.9/sqrt(32)))
lines(x3, y3, lty=2, lwd=2, col="red")


hist(b.64.mean,  prob=TRUE,    # 표본 크기가 늘어날 수록 표본평균의 분포가 정규분포와 닮아감감
     main = "", col = "orange", border= "yellow")
x4 <- seq(min(b.64.mean), max(b.64.mean), length=1000)
y4 <- dnorm (x=x3, mean= 1, sd=(0.9/sqrt(64)))
lines(x4, y4, lty=2, lwd=2, col="red")








