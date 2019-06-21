---
---

### Chi-squared distribution
```{r}

k <- 10
n <- 500

c1 <- rep(NA, n)
c2 <- rep(NA, n)
c3 <- rep(NA, n)
c4 <- rep(NA, n)

for (i in 1:n) {
  c1[i] <- mean(rchisq(2, k))
  c2[i] <- mean(rchisq(4, k))
  c3[i] <- mean( rchisq(32, k))
  c4[i] <- mean( rchisq(64, k))
}
options(digits=4)
c(mean(c1), sd(c1))
c(mean(c2), sd(c2))
c(mean(c3), sd(c3))
c(mean(c4), sd(c4))

par(mfrow=c(2,2))
hist(c1,  prob=TRUE, xlim=c(0,25),
     main = "", col = "orange")
hist(c2,  prob=TRUE,  xlim=c(0,25),
     main = "", col = "green")
hist(c3,  prob=TRUE,  xlim=c(0,25),
     main = "", col = "blue")
hist(c4,  prob=TRUE,  xlim=c(0,25),
     main = "", col = "yellow")
```




### student's t-distribution

```{r}

k <- 10
n <- 500

t1 <- rep(NA, n)
t2 <- rep(NA, n)
t3 <- rep(NA, n)
t4 <- rep(NA, n)

for (i in 1:n) {
  t1[i] <- mean(rt(2, k))
  t2[i] <- mean(rt(4, k))
  t3[i] <- mean(rt(32, k))
  t4[i] <- mean(rt(64, k))
}
options(digits=4)
c(mean(t1), sd(t1))
c(mean(t2), sd(t2))
c(mean(t3), sd(t3))
c(mean(t4), sd(t4))

par(mfrow=c(2,2))
hist(t1,  prob=TRUE, ylim = c(0,4),
     main = "", col = "orange")
hist(t2,  prob=TRUE,  ylim = c(0,4),
     main = "", col = "green")
hist(t3,  prob=TRUE,  ylim = c(0,4),
     main = "", col = "blue")
hist(t4,  prob=TRUE,  ylim = c(0,4),
     main = "", col = "yellow")

```


### F-distribution

```{r}

k1 <- 10
k2 <- 3
n <- 500

f1 <- rep(NA, n)
f2 <- rep(NA, n)
f3 <- rep(NA, n)
f4 <- rep(NA, n)

for (i in 1:n) {
  f1[i] <- mean(rt(2, k1, k2))
  f2[i] <- mean(rt(4, k1, k2))
  f3[i] <- mean(rt(32, k1, k2))
  f4[i] <- mean(rt(64, k1, k2))
}
options(digits=4)
c(mean(f1), sd(f1))
c(mean(f2), sd(f2))
c(mean(f3), sd(f3))
c(mean(f4), sd(f4))

par(mfrow=c(2,2))
hist(f1,  prob=TRUE, ylim = c(0,3),
     main = "", col = "orange")
hist(f2,  prob=TRUE,  ylim = c(0,3),
     main = "", col = "green")
hist(f3,  prob=TRUE,  ylim = c(0,3),
     main = "", col = "blue")
hist(f4,  prob=TRUE,  ylim = c(0,3),
     main = "", col = "yellow")
```













