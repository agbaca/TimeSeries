library("tseries")
snptna<-get.hist.quote('TNA',quote="Close")
length(snptna)
snpretna<-log(lag(snptna))-log(snptna)
length(snpretna)
snpvoltna<-sd(snpretna)*sqrt(250)*100
snpvoltna
voltna<-function(d,logrets)
{
var=0
lam=0
varlist<-c()
for(r in logrets) {
lam=lam*(1-1/d)+1
var=(1-1/lam)*var+(1/lam)*r^2
varlist<-c(varlist,var)
}
sqrt(varlist)}
volestna<-voltna(10,snpretna)
volestna2<-voltna(30,snpretna)
volestna3<-voltna(100,snpretna)
plot(volestna,type="l")
lines(volestna2,type="l",col="red")
lines(volestna3,type="l",col="blue")
