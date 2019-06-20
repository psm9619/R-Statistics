# Ch.3 확률과 확률분포
# 3-1. 확률

install.packages("prob")
library(prob)

tosscoin(1)
tosscoin(2, makespace=T)  # 결과뿐 아니라 확률 probs 까지 계산해줌
rolldie(2)
urnsamples(1:3, size=2)  # replace 없이 1:3 까지의 수 를 2번 뽑아라 (총 3 가지 경우)
urnsamples(1:3, size=2, replace = T)  # 복원이 되므로 총 6가지 경우
urnsamples(c(rep("R", 4), rep("8", 2)), size=2) # R 이 4개, 8이 2개 이며 replace 되는 때에 2번 뽑아라



# 3-2. 확률변수의 평균과 분산
x <- c(0,1,2)
px <- c(1/4, 1/2,1/4)
EX <- sum(x*px)  ; EX  # 확률변수의 평균 -> 기댓값 : 전체 합 sigma of x*P(x)

x2 <- x^2 ; x2
EX2 <- sum(x2 * px) ; EX2  # x ^2 의 기댓값

VARX <- EX2 - EX^2  # Variation, 확률변수의 분산 = E(X^2) - E(X)^2
VARX



# 에제 3-3. R 을 이용한 이항분포 계산
n <- 6 ; p=1/3 ; x <- 0:n
# dbinom (x 성공 횟수 벡터, size 시행횟수, prob 성공확률)
dbinom (2, size=n, prob=p)
dbinom (4, size=n, prob=p)

px <- dbinom (x, size=n, prob=p) ; px

plot(x, px, type="s",   # 분포도 그리기 (이어진 하나의 산(히스토그램 닮은) 형태)
     xlab = "성공횟수(x)", ylab="확률(P[X=x])", main="B(6,1/3)")
plot(x, px, type="h",  # 개별적인 막대그래프 형태 (개념적으로 이 타입이 더 맞음 - 각각의 x 에 대한 확률은 독립적이기 때문에)
     xlab = "성공횟수(x)", ylab="확률(P[X=x])", main="B(6,1/3)")


# R 에서 nomal, binom, chi 등의 함수 앞에 상황에 따라 다르게 붙는 d,p,q,r
# d -> 주어진 값 자체에서의 확률
# p -> 주어진 값 까지의 누적확률
# q -> p 와 역행하여, 누적확률이 p_x 가 될 때 값을 구함
# r -> 난수 생성

# pbinom (x, size, prob) 누적분포 함수
pbinom (2, n, p)  # x_1 이 일어나고, x_2 가 일어나고, x_3 이 일어나는 모든 확률을 순차적, 누차적으로 더한 것
pbinom (4, n, p)
pbinom (6, n, p) # 예제에서 n=1~6. 따라서 x=6 까지 주는 것은 말그대로 모든 x의 경우의 P(x) 를 다 더한 기댓값. 즉 1 이어야 함

# qbinom(p(x), size, prob)  
qbinom (0.1, n, p)
qbinom (0.4, n, p)
qbinom (pbinom(4,n,p), n, p)  # 역행하여 누적확률 pbinom 을 받고 당시의 x 값을 구하는 것

# rbinom (x, n, p)  n 까지의 범위 중, p 의 확률로 x 개의 값을 랜덤하게 생성
rbinom(10, n, p)


# 예제 3-4 R 의 분포함수를 이용한 기댓값과 분산
n <- 6 ; p=1/3 ; x <- 0:n

px <- dbinom (x, size=n, prob=p)
ex = sum (x*px)  # expectation vlue 기댓값
ex2 = sum(x^2 * px)
varx <- ex2 - ex ; varx   # Variance

n*p  # 이항분포의 기댓값 : np
n*p*(1-p)  # 이항분포의 분산 : np(1-p)


# 예제 3-5. R 을 이용한 정규분포 계싼
options (digits= 3)
mu <- 170
sigma <- 6
lowlim <- mu - 3*sigma
uplim <- mu + 3*sigma

x <- seq(lowlim, uplim, by =0.01)
normdis <- dnorm(x, mean=mu, sd = sigma)  # 정규분포 normal distribution

plot (x, normdis, type="l",
      xlab = "x", ylab="p(X=x)", main = "평균 170, 표준편차 6 일 때 정규분포",
      lwd=2, col = "red") 

pnorm (mu, mean=mu, sd=sigma)
pnorm(158, mean=mu, sd=sigma)
pnorm(180, mean = mu, sd=sigma) - pnorm(160, mean=mu, sd = sigma)

qnorm (0.25, mean=mu, sd=sigma)  # 25% 일 때 -> 1분위수에서의 x 값 (166 cm 가 1분위값)
qnorm (0.75, mean=mu, sd=sigma)  # 75% 일 때
qnorm (0.50, mean= mu, sd=sigma) # --> 평균값

options(digits=5)  # 소수점 자리를 5까지
set.seed(5)
smp <- rnorm (400, mean = mu, sd = sigma)
c(mean(smp), sd(smp))
hist(smp, prob=T, main="N(170, 6^2) 로부터 추출한 표본의 분포 (n=400)")
lines (x, nd, lty=2, lwd=2, col='red')


# 예제 3-6. 정규분포의 특징 알아보기
options (digits= 4)
mu <- 0
sigma <- 1
p0.05 <- qnorm(0.05, mean = mu, sd = sigma)  # -1.645
p0.025 <- qnorm(0.025, mean = mu, sd = sigma) # -1.96
p0.05 ; p0.025

p0.95 <- qnorm(0.95, mean = mu, sd = sigma) # 1.645
p0.875 <- qnorm(0.975, mean = mu, sd = sigma) # 1.96
p0.95 ; p0.875

pnorm (1.645, mu, sigma) - pnorm(-1.645, mu, sigma) # 0.9, 90% 확률
pnorm (1.96, mu, sigma) - pnorm(-1.96, mu, sigma) # 0.95, 95% 확률


# 그림 3-17
z <- seq(-3,3, by = 0.001)
z.p <- dnorm (z)
plot (z,z.p, axes = F, type = "l",
      main = "표준정규분포 (95%)", ylab = "", ylim = c(-0.04, 0.4))
axis (1)

lines(c(-3,3), c(0,0))
points (-1.96, -0.02, pch=17, col="red")
text(-1.96, -0.035, "-1.96", col = "red")
points (1.96, -0.02, pch=17, col="red")
text(1.96, -0.035, "1.96", col = "red")

s <- seq(-1.96, 1.96, by = 0.001)
s.z <- dnorm(s, mean = 0, sd =1)
s <- c(-1.96, s, 1.96)
s.z <- c(0, s.z, 0)
polygon (s, s.z, col="red", density = 50, angle = 100)







