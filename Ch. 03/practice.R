# 베르누이 시행인지 판단하시오.
# 1) 영화관에서 줄을 기다리는 시간을 측정한다.  
FALSE
# 2) 전화가 왔을 때, 전화를 한 사람이 여자인지를 측정한다.
TRUE
# 3) 주사위를 한 번 던졌을 때, 나오는 숫자를 체크한다.
FALSE
# 4) 주사위를 한 번 던졌을 때, 숫자 2가 나오는지를 체크한다
TRUE

# 한 축구 선수가 페널티킥을 차면 5번 중 4번을 성공한다고 한다.
# 이 선수가 10번의 페널티킥을 차서 7번 성공할 확률을 구하시오.
dbinom (7, size = 10, prob = 0.75)

# -------------
options (digits=5)
p <- 4/5 
q <- 1-p
num_case <- urnsamples(1:10, size=7) ; num_case
nrow(num_case)
prob <- (p^7*q^3)*nrow(num_case)
prob


# A라는 회사는 스마트폰의 한 부품을 만드는 회사로, 이 A사의 불량률은 5%로 알려져 있다.
# 이 회사의 제품 20개를 조사했을 때, 불량이 2개 이하로 나올 확률을 구하시오.

pbinom (2, size = 20, prob = 0.05)


# -------------
fault <- 0.05
good <- 1-fault 
size <- 20
# P(numF = 2) + P (numF=1) + P(numF = 0)

# P_X : calculate probability for a case of X = x to occur
P_X <- function (x, n, p, q) {
  num_case <- urnsamples(1:n, size=x)
  prob <- (p^x * q^(n-x)) * nrow(num_case)
  return (prob)
}
# P_bloew_x : calculates the cumulated probability for X <= x  
P_below_x <- function(x, n, p, q) {
  sum <- 0
  for (i in 0:x) {
    sum <- sum+P_X(i, n, p, q)
  }
  return (sum)
}

P_below_x(2, 20, fault, good)


# 어떤 희귀 바이러스에 감염되었을 때, 회복할 수 있는 치료율은 20%라고 한다. 
# 이 바이러스에 감염된 환자 20명을 치료했을 때, 적어도 2명 이상은 회복될 확률을 구하시오.
plot (0:20, dbinom(0:20, size=20, prob=0.20), type="s")
prob_treat_2 <- 1- pbinom (1, size = 20, prob = 0.20)


# -------------
treat <- 0.2
# P_over_x : calculates the cumulated probability for X >= x  
P_over_x <- function(x, n, p, q) {
  sum <- 0
  for (i in x:n) {
    sum <- sum+P_X(i, n, p, q)
  }
  return (sum)
}
prob_treat <- P_over_x(2, 20, treat, 1-treat)
prob_treat


# 주사위 두 개를 던졌을 때, 눈금의 합이 6이 될 확률을 구하시오.
two_die <- rolldie(2, makespace=T)
two_die ; str(two_die)
sum_die <- two_die$X1 + two_die$X2
sum_die
f_sumsix <- function (x) {
  sum_six <- c()
  for (i in 1:length(x)) {
    if (x[i] == 6) {
      sum_six <- c(sum_six, x[i])
    }
  }
  prob <- length(sum_six) / length(x)
  return (prob)
}
f_sumsix (sum_die)
  








