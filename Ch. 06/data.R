data <- read.csv("2016.6th.csv", header=T)
str(data)

tmp <- subset(data, data$나이 == 7)
height.p <- tmp$X104.키

save.image("data.rda")
