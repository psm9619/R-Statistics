# Ch. 7 여러 모집단의 평균 비교 검정

# 모집단이 2개 일 경우: 독립 or 서로 대응 
# 서로 독립적인 모집단 (ex. 도시, 농촌) -> 2-sample T
# 서로 대응 (ex. 다이어트 약 복용 전 vs. 후) -> paired T

# t.test(A ~ B, data = ...) -> A 가 종속변수 y, B 가 독립변수 x (y=f(x))




# 모집단이 세 개 이상일 때
# A-B, B-C, A-C 로 비교하면 1종 오류를 범할 확률이 많이 늘어남.
# 따라서 ANOVA(Analysis of Variance) 분산분석의 한 가지인 일원분산분석 (One way Anova) 를 사용
# SST (Total Sum of Squares) 총제곱합 sum(i=1~k)sum(j=1~n_i) (yij - y_bar)^2 
# equals to (수학적으로 풀어냈을 때 다음과 같은 값) 
# sum(i=1~k)sum(j=1~ni) (yij - yi_bar)^2 + sum(i=1~k)sum (j=1~k) (yi_bar - y_bar)^2
# SSE (Error Sum of Squares) 오차제곱합 sum(i=1~k)sum(j=1~ni) (yij - yi_bar)^2 
# SSt (Treatment Sum of Squares) 처리제곱합 sum (i=1~k) sum (j=1~k) (yi_bar - y_bar)^2 
# 따라서 SST 총제곱합 = SSE 오차제곱합 + SSt 처리제곱합

# 그리고 블라블라블라.... 나머지 내용은 직접 찾기기




























