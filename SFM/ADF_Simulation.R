

adf_simulation <- function(n=1000,mean=0,sigma=1,alpha=alpha.,beta=beta.,lag=lag.,sim=1000){
  out <- matrix(NA,sim,1)
  output <- matrix(NA,4,4)
for(a in 1:2){

for(b in 1:4) {
  
      for(p in 1:2) {
        
        for(M in 1:sim) {
          
    xi<-rnorm(1000, mean=0, sd=1)
    eps<-c()
    for (i in 2:length(xi)) {
      eps[i]<-xi[i] + beta[b] * xi[i-1]
    }
    X<-c()
    X[1]<-0
    for (i in 2:length(eps)){
      X[i] <- alpha[a]*X[i-1] + eps[i]
    }
        out[M,1] <- adf.test(X,k=lag[p])$p.value
        
        if(a==1) {
        output[p,b] <- sum(out[,1]<=0.05)/sim
        } else {output[p+2,b] <- sum(out[,1]<=0.05)/sim}
        }
        
  }
  
}
}
return(output)
}


alpha. <- c(1,0.95)
beta. <- c(-0.99,-0.90,0,0.90)
lag. <- c(3,11)
sim <- 1000

table44 <- adf_simulation(sim=10000)
table44
