# Ch. 08

# 8-1. 적합도 검정
# 그림 8-1

x <- seq(0,15,by=0.01)
dc <- dchisq(x, df=3)

alpha <- 0.05
tol <- qchisq (0.95, df=3)

par(mar=c(0,1,1,1))
plot (x, dc, type = "l", axes = F, ylim = c(-0.03, 0.25), xlab ="", ylab = "")
abline(h=0)
tol.g <- round (tol,2)
polygon (c(tol.g, x[x>tol.g], 15), c(0,dc[x>tol.g], 0), col="red")
text (0, -0.03, "0", cex = 0.8)
text (tol, -0.03, expression (chi[0.05] ^{2} == 2.14), cex = 0.8)

# 예제 -1. 멘델의 법칙
x <- c(315, 101, 108, 32)
chisq.test(x, p=c(9,3,3,1)/16)  # P-value > 0.05 alpha region 

par(mar=c(0,1,1,1))
plot (x, dc, type = "l", axes = F, ylim = c(-0.03, 0.25), xlab ="", ylab = "")
abline(h=0)
tol.g <- round (tol,2)
polygon (c(tol.g, x[x>tol.g], 15), c(0,dc[x>tol.g], 0), col="red")
text (0, -0.03, "0", cex = 0.8)
text (tol, -0.03, expression (chi[0.05] ^{2} == 2.14), cex = 0.8)




# 8-2. 동질성 검정 과 독립성 검정
# 예제 2. 연령대별 SNS 이용률 동질성 검정
sns.c <- read.csv("snsbyage.csv", header=T, stringsAsFactors = FALSE)
str(sns.c)

# 연령대 나눠서 저장 
sns.c <- transform(sns.c, age.c = 
                     factor (age, levels = c(1,2,3), 
                             labels = c("20대", "30대", "40대")))
sns.c <- transform(sns.c, service.c = 
                     factor (service, levels = c("F", "T", "K", "C", "E"), 
                             ordered =  TRUE))
c.tab <- table (sns.c$age.c, sns.c$service.c)
c.tab

# 각 row, column 합 구하기 margin.table (테이블 , margin = 1 또는 2) : 1 이 row, 2 가 column
(a.n <- margin.table(c.tab, margin=1)) #(a <- ...) 대입후에 바로 출력 (따로 a 부르지 않아도)
(s.n <- margin.table(c.tab, margin=2))

(s.p <- s.n/margin.table(c.tab))
(expected <- a.n %*% t(s.p))  # 매트릭스 곱셈 연산 (axb) %*% (bxc) -> b 부분이 같은 크기일 때 %*% 이용해서 연산

(o.e <- c.tab - expected)  # O_ij - E_ij
(t.t <- sum(o.e^2/expected)) # 검정통계량

# 0.95 까지, 즉 alpha= 0.05 가 되는 순간의 t 값 계산
qchisq (0.95, df = 8)  # df = (r-1)*(c-1)
# 데이터에서 가져온 t 값을 이용해서 t 이후로 (오른쪽으로) 의 누적확률, 즉 유의 확률 계산
1- pchisq (t.t , df=8)
 
# 위 까지는 전통적인 hands on 계산법. 이하는 R 을 이용해 단번에 계산하는 것
(result <- chisq.test(c.tab))  # Pearson's Chi-squared Test
names(result)
result$p.value



# 예제 3. 성별에 따른 대학원 입학 여부의 독립성 검정
data("UCBAdmissions")
UCBAdmissions # [2,2, 6] 으로 2,2 로 이루어진 테이블이 6개 있는 구조
(ucba.tab <- apply(UCBAdmissions, c(1,2), sum))  # apply 를 이용해서 c(1,2) 의 값들을 6개 테이블에서 한 번에 합침 

(a.n <- margin.table(ucba.tab, margin = 1))
(g.n <- margin.table(ucba.tab, margin = 2))

a.p <- a.n / margin.table(ucba.tab)
g.p <- g.n / margin.table(ucba.tab)

(expected <- margin.table(ucba.tab) * (a.p %*% t(g.p)))
o.e <- (abs(ucba.tab - expected) - 0.5) ^2 / expected  
sum(o.e)



























