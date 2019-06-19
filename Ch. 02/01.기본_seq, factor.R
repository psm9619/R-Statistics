# making sequence in R
seq(from= -4, to = 3, length.out=3)


# factor
# 의미가 중요한 질적자료를 위해 사용
# factor(x, levels = c(...), labels = c(,,,), ordered =T/F)
x <- 1:5 ; x
factor (x, levels = c(5:1), label = c('a','b','d','e', 'z'), ordered=F)
factor (x, levels = c(5:1), label = c('a','b','d','e', 'z'), ordered=T)

week <- factor (c(1:7), levels = c(1:7), 
                labels =  c('일', '월', '화','수', '목','금','토'), ordered = T)
week
factor(week)

# factor() 기존 벡터를 factor 로 변경
# levels -> , (ppt 참조)

name <- c('철수','영희', '길동')
age <- c(21,20,31)
gender <- factor (c("M","F","M"))  #making another factor under gender factor
character <- data.frame(name, age, gender)
str(character)
character
character$name
character$gender
character[1,]
character[,2]
character[3,1]
















