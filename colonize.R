colony <- 1
scout <- 2

bent <- log(7)

entropy <- cbind(0,0,0)
colnames(entropy) <- c("t","move","colonize")

fib <- function(n) {
  a=-1;b=1;c=0
  for(i in 1:n) {
    a=b;b=c;c=a+b
  }
  return(c)
}

colent <- function(time) {
  if (time <= 5) {
    return(bent)
  } else if (time <= 10) {
    return(0)
  } else return(2*bent)
}


for(i in 1:50) {
  t.new <- entropy[1,1] + 1
  move.new <- entropy[1,2] + (2*log(7))*(1+floor(t.new/5)) + log(10)
  colonize.new <- entropy[1,3] + fib(floor(t.new/5))*log(7) + fib(floor(t.new/5)+1)*log(10)
  entropy <- rbind(c(t.new,move.new,colonize.new), entropy)
  rownames(entropy) <- c()
}

plot(entropy[,1],entropy[,2],type="l",col="red")
lines(entropy[,1],entropy[,3],type="l",col="blue")
