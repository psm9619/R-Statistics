# Ch. 5 추정 Estimation

# 추측통계학
# - 추정 : 추출된 표본으로부터 특성을 파악하여 이를 바탕으로 모수를 유추
# - 가설검정 : 모수에 대한 가설을 수립, 이로부터 어떤 가설을 선택할 것인지 통계적으로 결정

# 추정의 종류
# 점추정 (이는 오류가 발생할 가능성이 크다)
# 구간추정



# 01. 점추정

# 추정량 (estimator) : 모수를 추측하기 위해 표본으로부터 계산된 통계량 (theta_hat)
# 추정치 (estimate) : 추정량으로부터 결과적으로 계산된, 모수에 대한 추측값 (theta)
# 모수 (theta) : 평균 mu(u), 분산 sigma^2, 비율 P 
# 추정량 (theta_hat) : 평균 X_bar, 분산 s^2, 비율 p_hat

# 좋은 추정량의 조건 
# - 불편성 unbiased : 한쪽으로 치우치지 않음 -> E(theta_hat) = theta
# - 유효성 efficient : 모수에 대한 불편추정량은 한 가지 이상 존재가 가능하다. 
#                 이 때, 모수 theta 에 대한 두 theta_hat1, theta_hat2 에 대해 분산이 작을 수록 더 유효한 추정량이다.
#                 Var (theta_hat_1) < Var (theta_hat_2)  ==> theta_hat_1 이 더 유효함
# - 일치성 consistent 

# 표준오차 (SE (theta_hat))
# 모수의 표준편차 (sigma) 를 알 경우, SE(theta_hat) = sigma/sq.rt(n)
# 일반적으로 표준오차라고 하여 표본의 편차 (s) 를 이용해야 할 경우, SE(theta)_hat = s/sq.rt(n)

# 모비율 (P) 에 대한 점추정
# 표본비율 p_hat = X/n, x는 시행횟수가 n 이고 성공확률이 모집단에서 원하는 결과가 나타날 비율 P 인 이항분포를 따르는 확률 변수
# X ~ B(n,P) 이므로 E(X) = nP, Var(X) = nP(1-P) 
# E(p_hat)=E(X/n) = 1/n*E(X) = 1/n*nP = P
# E(p_hat) = P
# SE(p_hat) = sqrt(Var(p_hat))= sqrt (P(1-P)/n) , 
# 따라서 모비율 P 를 알지 못할 경우, SE(p_hat)_hat = sqrt(p_hat(1-p_hat)/n)



# 02.구간추정

# 신뢰구간 (CI, Confidence interval) 

# 모집단의 분산을 알고 있을 때 (Z 사용) 모평균 u 에 대한 구간추정 방법
# 구간추정을 위해 lower limit, upper limit 을 각각 theta_hat_L, theta_hat_U 이라 할 때
# P(theta_h_L < theta < theta_h_U) = 1- alpha 를 만족하는 구간 (theta_hat_L, theta_hat_U) 을 
# 모수 tehta 에 대한 100(1-alpha)% 신뢰구간 이라 하고, 확률 (1-alpha) 를 신뢰수준 (confidence level) 이라 부른다
# 주로 alpha= 10, 5, 1 % 등을 사용하여 1-alpha = 90, 95, 99 % 신뢰구간을 사용한다.
# P(-1.96 < Z <1.96) = 0.95, 확률변수 Z = (X_bar-u) / (sigma/sqrt(n))
# ** Z 란? 확률변수 X_bar 에서 모수 평균 mu 를 빼고, 이를 표준편차인 sigma/sqrt(n) 으로 나누어 표준 정규분포를 따르는 확률 변수
# -> P(-1.96 < Z= (X_bar-u) / (sigma/sqrt(n)) <1.96) = 0.95, 계산하면
#    P(X_bar - 1.96 * sigma/sqrt(n)  < u < X_bar + 1.96 * sigma/sqrt(n)),
# -> 따라서 모평균에 대한 95% CI는 lowerlim 으로는 표본평균 - 1.96*표준오차, upperlim 으로는 1.96*표준오차

# 모집단 분산을 알지 못할 떄 -> 표본 추정량 사용, t-분포
# 모집단이 미지의 평균과 분산을 갖는 정규분포를 따를 떄,
# 이로부터 추출된 n 개의 확률표본 X1, X2, .. Xn 의 표본평균을 X_bar, 표본분산을 s^2 이라 하면
# T = (X_bar-u) / (s/sqrt(n)) ~ t(n-1) -> 모분산을 모르므로 sigma 대신 s 사용
# 100(1-alpha)% 신뢰구간은 (-t_(alpha/2, n-1) < T < t_(alpha/2, n-1) = 1-alpha
# 이 떄 t_(alpha/2, n-1) 이란, 자유도가 n-1 인 t-분포에서 P(T<t) = alpha/2 를 만족하는 t-분포의 값
# 따라서, alpha=0.05 일떄, lowerlim = - t_(alpha/2, n-1) 은 P(T<t) = 0.025인 값으로 
# qt(누적비율= - 0.025, 자유도 = n-1) 로 구할 수 있다. upperlim 은 qt(0.975, n-1) 


















