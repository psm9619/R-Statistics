# Ch. 06 가설 검정

load("data.rda")
str(data)

set.seed(9)
height <- height.p[sample(length(height.p), 15)]
height

mean(height)
sd(height)
# One sample t-test, two sided, alpha=0.05
t.test(height, mu =1220)


# 예제 6-1. 단일 모집단의 평균검정
wdata <- read.table (
  "https://www.amstat.org/publications/jse/datasets/babyboom.dat.txt", header=F
) ; str(wdata)
names(wdata) <- c("time", "gender", "weight", "minutes")
tmp <- subset (wdata, gender==1)  ; weight <- tmp [[3]]

# 자동적으로 t.test(데이터셋, mu_0 = .. , alternative = "greater") <- one sided test
t.test (weight, mu=2800, alternative = "greater")  
# 만일 H_a 가 mu_hat < mu_0 일 경우 "less" 사용 

# 전통적인 방법으로 손으로 t value 및 C_u, p.value 를 하나씩 계산하는 것
barX <- mean(weight)  ;  s <- sd(weight)  ;  n <- length(weight)
h0 <- 2800
t.t <- (barX - h0)/(s/sqrt(n)) ; t.t  ;   alpha <- 0.05
c.u <- qt(1-alpha, df=n-1)  ; c.u 
p.value <- 1 - pt(t.t, df=n-1)  ; p.value

# 도표 작성:  그림 6-8
par ( mar=c(0,1,1,1))
x <- seq(-3,3,by = 0.0001)
y <- dt (x, df=n-1)
plot(x, y, type = "l", axes = F, ylim = c(-0.02, 0.38),
     main = "", xlab = "t", ylab = "")
abline (h=0)
# 여기서 쓰이는 c.u, t.t 등은 위의 직접 계산한 t-test 과정에서 만들어진 변수들임 
polygon (c(c.u,  x[x>c.u] , 3), c(0,y[x>c.u], 0), col=2)
text (c.u, -0.02, expression(t[0.05] == 1.74))
text (1.8, 0.2, expression(alpha=0.05), cex = 0.8)
arrows (1.8, 0.18, 1.8, 0.09, length = 0.05)

polygon (c(t.t, x[x>t.t], 3), c(0,y[x>t.t], 0), density=20, angle =45)
text (t.t, -0.02, paste("t=", round(t.t, 3), pos=4))
text (2.65, 0.1, expression(plain(P) (T>2.233) == 0.0196), cex = 0.8)
arrows (2.7, 0.08, 2.5, 0.03, length = 0.05)



# 예제 6-2. 야구공의 불량률 검정
tmp <- read.table ("restitution.txt", header=T)
rel <- ifelse(tmp$rst < 0.4134 | tmp$rst > 0.4374, 1, 0)

n <- length(rel)
nos <- sum (rel)
sp <- nos /n
hp <- 0.1
z<- (sp-hp)/sqrt(hp*(1-hp)/n)

alpha <- 0.05
c.u <- qnorm (1-alpha)
p.value <- 1-pnorm(z)

prop.test(nos, n, p=0.1,
          alternative ="greater", correct = FALSE)














