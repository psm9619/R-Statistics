부모의 키가 클수록 자식의 키도 상대적으로 크다고 하는데, 
아버지의 키와 아들의 키를 조사하였더니 아래와 같이 나왔다고 한다. 
이 자료를 바탕으로 해서 회귀식을 구하고 아버지의 키가 165cm일 때 
아들의 키는 얼마인지 예측하시오

father <- c(150,160,170,180,190)
son <- c(176, 179, 182,181,185)
data <- data.frame(father=father, son=son)

(fit <- lm(son~father, data=data))
summary(fit)

father_height <- 165
(son_height <- 146.6 + 0.2 *father_height )



소득이 높을수록 신용카드 사용량이 많아진다고 하는데, 
월 소득 대비 신용카드 사용량을 조사하였더니 아래와 같이 나왔다고 한다. 
이 자료를 바탕으로 해서 회귀식을 구하고, 월 소득이 250만원일 때 
신용카드 사용량을 예측하시오. 
(단위: 만원)	월 소득(x):	100  200  300  400  500	카드 사용량(y):	 30    70    85  140  197

income <- c(100,  200,  300,  400,  500)
card <- c(30, 70,  85,  140,  197)
data <- data.frame(income=income, card=card)

(fit <- lm (card ~ income, data = data))
summary(fit)

x <- 250
(y <- -16.8 + 0.404*x)



mtcars 데이터셋에서 배기량(disp)에 따른 마력(hp)의 회귀식을 구하시오

mtcars
(fit <- lm(hp~disp, data=mtcars))
summary(fit)

x <- 0
y <- 45.735 + 0.4376 * x




MASS 패키지를 설치하고, 이 패키지 안에 있는 Boston 데이터셋을 이용하여
Boston 인근의 집값을 결정하는 다중회귀 모델을 만드시오.

* 참조
  : Modelling Home Prices (R) by Campos, David and Eulogio, Raul
  : 모범답안 by 황성윤
install.packages("MASS")
library(MASS)
library(ggplot2)
str(Boston)

bos <- Boston
head(bos)

chas 데이터는 찰스 강을 기준으로 한 dummy variable 이므로 factor 화 한다. 
bos$chas <- as.factor(bos$chas)

rad 데이터는 방사성 고속도로로의 접근성을 index 화 한 것.
이는 접근성에 따라 ordered 되어있으므로 level 을 더한다.
bos$rad <- as.factor(bos$rad)
levels (bos$rad)

대략적인 데이터의 분포와 추이를 보기 위해 histogram 과 boxplot 을 종속변수인 medv 에 대해 그린다.
hist (bos$medv, breaks= 20 ,
      col = 'yellow', border = 'purple')
boxplot (bos$medv, col = 'yellow', border = 'brown')
위의 그래프들에 따르면 medv 는 오른쪽으로 skewed 되어있는 형태의 분포이며 다수의 outlier 가 존재하는 것으로 보인다.

종속변수를 포함하여 데이터 셋의 여러 변수를 포함한 산점도를 그린다.
plot (bos, col = 'grey3')
패턴 상 한정된 값의 팩터인 chas 와 rad 는 산점도를 통해 correlation 을 보기 어려우므로 제외. 
plot (bos[,-c(4, 9)], col = 'grey3')

I . linear regression model
(fit <- lm(medv~. , data=bos))
summary (fit)
indus 와 age, rad2,4,5,6, 등이 linear regression 에서 무의미한 영향력을 가진 것으로 파악됨 (P(>t) > 0.05)
anova(fit) 
nox 와 age 가 무의미한 영향력을 보인다.

stepwise regression
1. backward
step(fit, direction = 'backward')
age 와 indus 가 무의미한 변수로 파악되어 제거 되었다.

2. forward
step(lm(medv~1, data=bos), direction='forward',
     scope = ~crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat)
마찬가지로 age 와 indus 를 제외한 모든 변수가 유의미하다고 파악되었다.

3. both direction
step(fit, direction = 'both')
쌍방으로 검사한 결과도 동일하므로 앞으로의 과정에ㅅ는 age 와 indus 를 제외한 분석을 한다.

4. leap
install.packages("leaps")
library(leaps)
subset1 <- regsubsets(medv~., data = bos[, -c(3,7)],
                     method = 'seqrep', nbest=11)
plot(subset1)
subset2 <- regsubsets(medv~., data = bos[, -c(3,7)],
                     method = 'exhaustive', nbest=11)
plot(subset2)
subset2  # 확인 결과 rad 가 factor label 별로 하나씩 항목을 차지하고 있음이 보인다. 이를 막기 위해 rad 항목을 제외한다.

subset1 <- regsubsets(medv~., data = bos[, -c(3,7,9)],
                      method = 'seqrep', nbest=11)
plot(subset1)
subset2 <- regsubsets(medv~., data = bos[, -c(3,7,9)],
                      method = 'exhaustive', nbest=11)
plot(subset2)

BIC 그래프 모형에 따르면 crim 과 tax 가 무의미하게 판정된다. 
따라서 앞으로의 검정에서 crim, tax, age, indus, rad 를 제외시킨다.


II. 기타 model
다중선형회귀 모델 구축시 잔차에 대한 다음과 같은 가정을 한다.
정규성 (normality)
등분산성 (homoscedaticity)
선형성 (linearity)
독립성 (idependence)

위의 step 과 leap regression 을 통해 판정한 변수들을 제외한 모델을 구축
fit2 <- lm(medv~zn+chas+nox+rm+dis+ptratio+black+lstat,data=bos)
이의 정규성, 등분산성, 선형성 및 독립성을 확인한다.
par(mfrow=c(2,2)) ; plot (fit2)
par(mfrow=c(1,1))
1. 정규성
shapiro.test(fit2$residuals)  # p-value = 0.000 < 0.05 로 정규성 거짓
2. 등분산성 및 선형성
gvlma 패키지의 gvlma 함수가 등분산성과 선형성을 검정한다. 
global test : 선형성, heteroscedasticity : 등분산성
install.packages("gvlma")
library(gvlma)
(gvmodel <- gvlma(fit2))
p-value 가 global, heteroscedatiscity 둘 다 < 0.05 이므로 선형성, 등분산성 모두 거짓.
3. 독립성 
Durbin-Watson 검정법으로 독립성을 검정한다.
이 때는 DW statistic == 2 일 때 독립, ==0 일때 양의 자기상관, ==4 일때 음의 자기상관으로 판정한다.
library(car)
durbinWatsonTest(fit2)
p-value = 0 <0.05 이므로 독립성이 거짓.


결과적으로 fit2 는 다중선형회귀분석에 대한 기본가정을 만족하지 못한다.
그러나 현 과제 특성상 이 모델로 우선 진행한다.

overfitting 을 예방하기 위해 multicollinearity 를 검정하기 위해 
vif 테스트를 시행한다. vif 값이 5보다 높을 경우 문제가 있는 것으로 판단한다.
vif(fit2) 
multicollinearity 문제는 없을 것으로 보인다.

outlier 을 찾아내기 위해 outlierTesT() 를 시행한다.
outlierTest(fit2, cutoff= Inf, n.max=8)
bos2 <- bos[-c(369,372,373,370,413,365,371,366), -c(1,3,7, 9, 10)]
fit3 <- lm(medv~., data = bos2)
summary(fit3) # zn 은 무의미한 변수로 판정되고, chas 도 약한 연관성을 보이나 나머지 변수들은 매우 유의미하게 판정된다.
par(mfrow=c(2,2))
plot(fit3)  

지난 fit, fit2 그래프보다 확연히 좋아진 linearity 가 확인된다. 그러나 여전히 non-linear 하다고 보인다. 
따라서 polynomial 을 더해주는 것이 어떠한지 보도록 한다.
지난 분석들 및 초반의 산점도를 볼 때 lstat 과 medv 사이의 polynomial 관계식이 의심된다.

(fit4 <- lm(medv~. +I(lstat^2), data = bos2))
summary(fit4)
plot(fit4)
새로운 outlier 들이 표시되고 여전히 linearity 는 문제가 있음이 보인다.

(fit5 <- lm(medv~. +I(lstat^2) +I(lstat^3), data = bos2))
summary(fit5)
lstat^3 은 관계성이 무의미하다고 판정된다.

따라서 fit4 model, 즉 crim, tax, age, indus, rad 를 제외하고 lstat^2 의 독립변수가 종속 변수 medv 와 유의미한 관계가 있는 여기에서 
boston 의 집값 medv를 예측하기 위한 다중회귀식의 판정을 멈추도록 한다.




