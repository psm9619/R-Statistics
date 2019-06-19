
# ------------------------------------------------------------------
# 모수와 통계량
# ------------------------------------------------------------------

# 모수와 통계량
# 모집단 특성: 모수
# 표본의 특성: 통계량

ranicafe <- read.csv("cafedata.csv", header=T, 
                     stringsAsFactors = F) # string 데이터들이 factor 화 되는 것을 막기 위해
head(ranicafe)
str(ranicafe)
head(ranicafe)

# ------------------------------------------------------------------
# 최대 최소값
# 만일 data file 에서 숫자값들이 " "로 묶인 string 형태라면 아래와 같이 as.numeric() 이용해서 치환 
ranicafe$Coff <- as.numeric(ranicafe$Coffees)
sort(ranicafe$Coff, decreasing=T)[1]  # max value
max(ranicafe$Coff, na.rm=T)  # data 값들 중 NA 가 있을 시 max, min 두 함수가 다 NA 를 리턴한다
min(ranicafe$Coff, na.rm=T)  # 따라서 이와 같은 함수사용시 na.rm=T 를 통해서 그것 제외 나머지 값을 비교하게 함.

# ------------------------------------------------------------------
# 최빈값
# 줄기-잎 그래프
# 줄기: 자료의 구분점 (히스토그램 구분구간과 동일)
stem(ranicafe$Coff) # 최빈값 파악에 도움을 줌 (R 에는 최빈값을 구하는 함수가 없어서 이러한 기타 그래프나 방법을 통해 구해야 한다)

# ------------------------------------------------------------------
# 평균과 중앙값
# 자료의 중심에 위치하여 전체 자료를 '대표'할 수 있는 값은 3가지 (각 데이터의 특색에 따라서 필요한 값이 다름)
# =>  최빈값,(산술)평균(mean,avg), 중앙값 (median) 
# 이 중 평균: 무게중심,  중앙값: 순서상 중심 으로 간주
cof <- ranicafe$Coff
weight <- (1/(length(cof)-1))  # length(cof) 는 NA 도 포함하므로 NA 의 빈도수를 빼준다

sum(cof*weight, na.rm=T)  # 각각의 값*1/빈도수 의 전체 합은 산술평균의 본질적 의미이다. 
mean (cof, na.rm=T)  # R에서는 mean() 함수를 이용해서 자동 계산 가능

# 평균값은 이상치에 매우 취약하다. 따라서 boxplot 등을 활용하여 이상치를 미리 알아내고 상황에 따라 제외 등의 행동 필요
cof[cof == max(cof, na.rm=T)] <- 480  # 만일에 max 값이 48이 아닌 480 이라고 잘못 들어갔다면?
mean(cof, na.rm=T)  # 평균값이 매우 달라진다

# 중앙값 
len <- length(cof) - 1  # -1 은 NA 떄문에 사용된 것
med.idx <- (len+1)/2  # median index : 홀수 -> (n+1)/2, 짝수 -> (n/2) , (n/2+1)
med.idx
sort(cof)[med.idx] 
# 중앙값은 한 두개의 이상치 및 양 끝의 변화에 흔들리지 않음 (robust)

# 중앙값 = 평균 의 경우 빈도 수 그래프는 균형잡힌 종모양. 
# 그렇지 않을 경우 한 쪽으로 치우친 skewed shape. 이 때는 봉우리가 아닌 꼬리를 본다.
# 따라서 봉우리가 오른쪽으로 치우친 경우 빈도 그래프는 '왼쪽으로 skewed' 라고 파악

# ------------------------------------------------------------------
# 표준편차
# 각 자료들이 평균에 대해 평균적으로 얼마나 떨어져 있을까?
# 개별 값 - 평균 : 편차(deviation) -> 편차는 음수부터 양수까지, 전체 합은 0 일 수 밖에 없다.
# 편차^2/값의 총 개수 : 분산(Variance) -> 편차^2 의 평균, 단위가 일반 값 단위의 ^2 상태 
# std_root(분산) : 표준편차(Standard deviation) -> 단위를 맞추기 위해 분산의 제곱근을 구한 것
height <- c(164,166,168,170,172,174,176)

# 산술적 계산의 경우
h.m <- mean(height)
h.dev <- height - h.m ; h.dev 
h.len <- length (height) -1  # 이것은 모집단을 구하느냐 표본을 구하느냐 에 따라 다름 (하단 후술)
h.var <- sum((h.dev)^2)/h.len ; h.var
h.stdev <- sqrt(h.var) ; h.stdev
# 사실 R 에는 variance 와 stand.dev 를 구하는 함수가 존재함
var(height)
sd(height)

# 통계에서는 표본의 특성을 통해 모집단의 특성을 추측. 우리가 R 을 이용하여 분석하는 것은 모집단이 아닌 표본의 특성을 찾기 위함이므로 
# n(표본) 이 아닌, 자유도를 인정하는 n(표본) -1 을 사용한다. 

# ------------------------------------------------------------------
# 사분위수 Quartile
# 0%, 25%, 50%, 75%, 100% 값의 나열 (25% = Q1, 100% = Q4 / Q2 는 50% 의 중앙값)
qt <- quantile(cof, na.rm=T)   # quantile(데이터셋, na.rm=T)
qt
# 사분위수 범위 (IQR, Inter Quartile Range) 중앙값을 포함하는 영역인 제 1 사분위수부터 제 3 사분위수 사이 길이
q1 <- qt[2] ; q3 <- qt[4]
q3 - q1  # IQR 의 산술적 계산

IQR (cof, na.rm=T)  # IQR 함수

# boxplot 은 Q1~Q3 을 box 로 그리고 1.5*IQR 범위내의 최대, 최소 값을 각각 점선으로 연결하여 tail/수염을 그린다
# outlier 이상치는 Q2 - 1.5IQR, Q4 _ 1.5IQR 을 벗어난 값
boxplot(cars$dist)
qs <- quantile(cars$dist, na.rm=T) ; qs
iqr <- IQR(cars$dist, na.rm=T) ; iqr
upperlim <- qs[4] + 1.5*iqr ; upperlim
lowerlim <- qs[2] - 1.5*iqr ; lowerlim

# ------------------------------------------------------------------
# 이상치 구하기
cars$dist[cars$dist > upperlim   # 직접 찾아낼 때는 이렇게 할 수 있음. 
          | cars$dist < lowerlim]  

bp <- boxplot(cars$dist)
str(bp)  # boxplot 의 기본 스탯 값들을 리턴함 : stats = quartile, out = outlier
bp$out   # boxplot 그래프를 그린 후라면 $ out 을 통해서 outlier 값을 구할 수 있다.








