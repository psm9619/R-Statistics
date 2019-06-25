# Ch. 06 가설검정

# 01. 가설검정
# P-value -> alpha 의 범위 내에 들어갈 경우, 기존 1-alpha=95%의 범위내에 들어가지 않으므로 영향력이 있는 데이터로 분류, 가설을 검정한다

# 가설검정에서 사용하는 가설의 종류
# - 영가설 (귀무가설 H_0) 
#     : 기존에 알려진 것과 차이가 없음
# - 대안가설 (대립가설 H_1 또는 H_a (alternative hypothesis))
#     : 기존에 알려진 것과 차이가 있음/크다/작다
#     : 연구자가 밝히고자 하는 가설로 연구가설이라고도 한다
#  * 연구자는 영가설 (H_0) 이 참이라는 가정하에 연구하여, 이에 대한 참 거짓의 여부로 모수의 상태를 결정한다

# 가설 선택의 기준 수립: 유의수준과 기각역
# - 1종 오류: H_0 이 참일 때, H_1 을 선택
# - 2종 오류: H_0 이 거짓일 때, H_0 을 선택
# 두 오류를 모두 없앨 수가 없기 떄문에 더 심각한 오류를 선택, 관리하고 다른 오류를 기각하는 것
# 유의 수준 (significant level, alpha -> 기각역 수립의 기준 제시)
# - 가설 검정에서 유의수준이 alpha 인 검정은 제 1종 오류를 범할 확률이 alpha 이하인 검정.
# - 말 그대로 alpha 의 범위이다. P(T< or > t) = alpha/2 로서, 
#   lower lim, upper lim 각각을 c_l = qt(0.025, n-1) , c_u =qt(0.975, n-1)  로 한다. 
# - 각각의 c_l, c_u 를 임계값 critical value 라 하며, 분포의 중앙을 중심으로 T<c_l, T>c_u 의 영역을
#   기각역 (critical region 또는 rejection region) 이라 한다. 
#   1-alpha 의 영역인 c_l <= T <= c_u 는 채택역 (acceptance region) 이라 한다.
#  => 판정: 검정통계량이 기각역에 있을 시, 영가설을 기각하고 대안가설 H_1 을 채택한다, vice versa
# 
# * 대안가설, H_1 (theta!=theta_0) 에 따라서 기각역이 양쪽에 0.5alpha 씩 위치한 양쪽검정 (two-tailed/sided test)이 있고
#   한쪽에 두고 검정하는 (theta > theta_0 또는 theta < theta_0) 한쪽검정 (one-tailed test) 가 있다
#   양쪽 검정의 기각역은 P(T>Cu) = alpha/2 & P(T<Cl) = alpha/2
#   한쪽 검정의 기각역은 P(T>Cu) = alpha 또는 P(T>Cl) = alpha
  

# 모집단의 분산을 모를 때,
# 1. 가설 수립 : H_0, H_1
# 2. 검정통계량 T = (X_bar-u_0)/(s/sqrt(n))~t(n-1) 을 계산
#     * 표본으로부터 구한 검정통계량은 '영가설이 참' 일 떄, 자유도가 n-1 인 t-분포에서 관찰된 값
# 3. 유의수준 5% (alpha = 0.05) 와 비교
#   - T의 위치를 찾기 위해 pt(T, df=n-1) ->유의확률 P-value (T 값까지의 누적통계량) 를 사용한다.
#   - P-value 가 1-alpha 범위 (즉 채택역 내) 이면 H_0, 영가설이 참. alpha 범위 (기각역 내) 이면 영가설 거짓, H_1 이 참이다.
# 4. 3 번에 기반하여 H_0 또는 H_1 채택
#
# R 에서는 t.test(X, mu= u_0) 를 해주면 자동으로 1-sample T-test 를 계산해줌
# One sample t test : 모집단과 표본 평균을 조사, 단일 모집단 검정
# One sided, 1- sample t-test -> t.test(X, mu=u_0, alternative ="greater"/"less")


# 단일 모집단의 비율에 대한 가설검정 (Proportion test)
# 















