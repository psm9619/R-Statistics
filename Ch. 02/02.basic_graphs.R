# 기술통계학
# 기술함으로써 설명. 이 때 기술은 글/말 이 아닌 그래프 등 시각적 설명

# ------------------------------------------------------------------
# 그래프

# 1. 산점도
# 가장 먼저 그려서 전체적인 분산도를 알아보기 위한 기본 그래프
library(ggplot2)
cars
par(mfrow=c(1,2))
plot (cars$speed, cars$dist,
      main="속도와 제동거리", xlab="속도(mph)", ylab="제동거리(ft)",
      pch=1, col="red")

# jitter 은 비슷한 x,y 값에 여러 값이 모일 경우 
#그것들의 x 값 위치를 살짝 흔들어서 지나친 겹침을 방지. 
# plot(jitter(x), jitter(y)...)  또는 (ggplot 사용시) geom_jitter()
plot (jitter(cars$speed), jitter(cars$dist),
      main="속도와 제동거리", xlab="속도(mph)", ylab="제동거리(ft)",
      pch=1, col="red")

par(mfrow=c(1,1))
# 2. 시계열 그래프 Time Series
Nile
plot(Nile, 
     type = 'p',  # type = 'p' 로 놓으면 산점도식 그래프를 그려내는데 이것으로는 알고자 하는 내용을 파악할 수 없는, 단순 분산도가 나옴.
     main="Nile 강의 연도별 유랑 변화",
     xlab = "연도", ylab="유량")
# 따라서 시간의 규칙적 변화에 따른 특정 데이터의 변화 Time series 를 알고자 할 때는
# 해당자료에 맞게 시계열 그래프를 그려야 한다. 이 때는 특별한 함수 등 필요없이 데이터만 잘 정리되어있으면 자동으로 그려짐. 
plot(Nile, main="Nile 강의 연도별 유랑 변화",
     xlab = "연도", ylab="유량")

# ggplot 으로 그리려 할 때는?
# 주의: ggplot 은 data frame 만 받는다.
class(Nile) # ts (time series) 타입

# conversion: data.frame(x = time(ts dataset), y= as.matrix (ts dataset))
N <- data.frame(연도=time(Nile),  
                유량 =as.matrix(Nile))

ggplot(N, aes(x=연도, y=유량)) +
  geom_line() +
  labs(title="Nile 강의 연도별 유랑 변화") +
  theme_bw()
time(Nile)


# 3. 막대그래프와 히스토그램
# 막대 : 높이에 초점 vs. 히스토 : 넓이에 초점
load("pop.rda")
head(pop) ; tail(pop)  # pop: 2010 인구사항 데이터 셋을 정리, 받은 것

# 막대그래프
tableV5 <- table(pop$V5)  # table(1차원벡터)->주어진 데이터들에 대한 factor 정리 후 각 factor 별 빈도를 세어서 테이블로 만듬
tableV5
barplot(tableV5, main="출생아(남자)별 빈도", 
        xlab = "출생아수", ylab="빈도")

# 히스토그램
hist(pop$V2, main="연령별 분포", xlab = "연령", ylab="빈도")

hist(pop$V2, breaks=c(seq(0,90,10)), # 계급구간 customizing
     right=F,  # right-closed = F -> 각 구간은 [a,b) 로 오른쪽구간이 열림 (default 는 (a,b] 형태이다)     
     main="연령별 분포", xlab="연령", ylab="빈도")


# 원 도표
table(pop$V4)
pie(table(pop$V4), main= "학력수준별 비중",
    cex = 0.8)  # 각 label 의 글자 크기
















