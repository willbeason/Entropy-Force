n <- 100
ph <- 0.5

ent <- function(p) {
  return(-p*log(p)/log(2))
}

pxy <- function(x,y,n,ph) {
  if((x>=0)&&(x<=n)&&(y>=0)&&(y<=n)) {
    d <- y - x
    if(abs(d)<=1) {
      pp <- (1-x/n)*ph
      pm <- (x/n)*(1-ph)
      pn <- 1 - pp - pm
      p <- c(pm,pn,pp)
      return(p[d+2])
    } else return(0)
  } else return(0)
}

ps <- matrix(0,n+1,n+1)

for(i in 1:(n+1)) {
  for(j in 1:(n+1)) {
    ps[i,j] <- pxy(i-1,j-1,n,ph)
  }
}

ss <- ps*log(ps)

t0 <- integer(n+1)
t1 <- double(n+1)

for(i in 1:(n+1)) {
  t1[i] <- sum(ent(ps[i,max(1,i-1):min(n+1,i+1)]))
}

thedata <- rbind(t0,t1)

for(i in 2:1000) {
  newrow <- double(n)
  for(j in 1:(n+1)) {
    newrow[j] <- thedata[2,j]
    for(k in max(1,j-1):min(n+1,j+1)) {
      newrow[j] <- newrow[j] + ps[j,k]*thedata[i,k]
    }
  }
  thedata <- rbind(thedata,newrow)
  rownames(thedata)[i+1] <- paste0("t",i)
}

thedata[1001,]
which(thedata[1001,]==max(thedata[1001,]))-1
plot(thedata[2,]/max(thedata[2,]),type="l",ylim=c(0,1))
grid()
for(i in c(3,4,5,10,20,30,100,200,300,1001)) {
  lines(thedata[i,]/max(thedata[i,]))
}
lines(thedata[3,]/max(thedata[3,]))
lines(thedata[10,]/max(thedata[10,]))
lines(thedata[1001,]/max(thedata[1001,]))
