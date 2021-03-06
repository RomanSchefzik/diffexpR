

library(transport)
library(eva)



###########################################
########################################
########semi-parametric

wasserstein.test.sp<-function(x,y,seedex,permnum){
  
  set.seed(seedex)  
  
  
  #######Wasserstein part
  
  if (length(x)!=0&length(y)!=0){
    
    value<-wasserstein1d(x,y,p=2)
    value.sq<-value^2
    
    
    ##### computation of an approximative p-value (permutation procedure)
    z<-c(x,y)
    nsample<-length(z)
    bsn<-permnum
    shuffle <- sapply(1:bsn, function(j) sample(z, nsample, replace = FALSE))
    
    wass.val<-sapply(1:bsn,function (k) {wasserstein1d(shuffle[1:length(x),k],shuffle[(length(x)+1):nsample,k],p=2)})
    wass.val<-wass.val^2
    
    
    
    ###list of possible exceedance thresholds (decreasing)
    poss.exc.num<-rev(seq(from=10,to=250,by=10))
    
    
    
    
    ##order the values of the permutation-based test statistics
    wass.val.ordered<-sort(wass.val,decreasing=TRUE)
    
    
    ###algorithm
    
    num.extr<-sum(wass.val>=value.sq)
    pvalue.ecdf<-num.extr/bsn
    pvalue.ecdf.pseudo<-(1+num.extr)/(bsn+1)
    
    
    if (num.extr>=10){
      pvalue.wass<-c(pvalue.ecdf,NA,NA)  
    } else {
      
      procedure<-function(x){
        
        r<-1
        
        repeat {
          
          
          ##set threshold for exceedance according to paper
          N.exc<-poss.exc.num[r]
          
          ##compute set of N.exc exceedances
          exceedances<-wass.val.ordered[1:N.exc]
          
          ##check whether the N.exc largest permutation values follow a GPD using an Anderson-Darling test
          gpd.ad.check<-gpdAd(exceedances)
          ad.pval<-gpd.ad.check$p.value
          
          r<-r+1
          
          if(ad.pval>0.05){break}
          
        }
        
        
        ###calculate exceedance threshold for so-obtained N.exc
        t.exc<-(wass.val.ordered[N.exc]+wass.val.ordered[N.exc+1])/2
        
        ###fit GPD distribution to the exceedances using maximum likelihood estimation
        #gpd.fit<-gpdFit(x=wass.val.ordered,u=t.exc,type="mle")
        gpd.fit<-gpdFit(data=wass.val.ordered,threshold=t.exc,method="mle")
        ##extract fitted parameters
        fit.scale<-as.numeric(gpd.fit$par.ests[1])
        fit.shape<-as.numeric(gpd.fit$par.ests[2])
        
        ##check goodness-of-fit of the fitted GPD distribution via Anderson-Darling test 
        #gof.test<-ad.test(exceedances, "pgpd", xi=fit.shape,beta=fit.scale)
        #pvalue.gof<-gof.test$p.value
        #goodfit<-pvalue.gof>0.05
        
        ###compute GPD p-value (see paper)
        pvalue.gpd<-(N.exc/bsn)*(1-pgpd(q=value.sq-t.exc,loc=0,scale=fit.scale,shape=fit.shape))
        pvalue.gpd<-as.numeric(pvalue.gpd)
        
        pvalue.wass<-c(pvalue.gpd,ad.pval,N.exc)
        
        return(pvalue.wass)
        
      }
      
      tr<-try(procedure(25),silent=TRUE)
      
      if(is(tr,"try-error")) {pvalue.wass<-c(pvalue.ecdf.pseudo,NA,NA)}
      else {pvalue.wass<-tr}
      
    }
    
    
    
    ####decomposition of wasserstein distance
    mu.x<-mean(x)
    mu.y<-mean(y)
    
    sigma.x<-sd(x)
    sigma.y<-sd(y)
    
    
    pr<-((1:1000)-0.5)/1000
    
    quant.x<-quantile(x,probs=pr,type=1)
    quant.y<-quantile(y,probs=pr,type=1)
    
    if(sd(quant.x)!=0&sd(quant.y)!=0){
      rho.xy<-cor(quant.x,quant.y,method="pearson")
    } else{
      rho.xy<-0  
    }
    
    
    
    location<-(mu.x-mu.y)^2
    size<-(sigma.x-sigma.y)^2
    shape<-2*sigma.x*sigma.y*(1-rho.xy)
    
    wass.comp.sq<-location+size+shape
    wass.comp<-sqrt(wass.comp.sq)
    
    
    perc.loc<-round(((location/wass.comp.sq)*100),2)
    perc.size<-round(((size/wass.comp.sq)*100),2)
    perc.shape<-round(((shape/wass.comp.sq)*100),2)
    
    
    decomp.error<-abs(value.sq-wass.comp.sq)
    
    
    
  } else {
    value<-NA
    value.sq<-NA
    wass.comp.sq<-NA
    wass.comp<-NA
    location<-NA
    size<-NA
    shape<-NA
    rho.xy<-NA
    pvalue.wass<-c(NA,NA,NA)
    perc.loc<-NA
    perc.size<-NA
    perc.shape<-NA
    decomp.error<-NA
  }
  
  
  ##create output
  output<-c(value,value.sq,wass.comp.sq,wass.comp,location,size,shape,rho.xy,pvalue.wass,perc.loc,perc.size,perc.shape,decomp.error)
  names(output)<-c("d.transport","d.transport^2","d.comp^2","d.comp","location","size","shape","rho","pval","p.ad.gpd","N.exc","perc.loc","perc.size","perc.shape","decomp.error")
  
  
  return(output)
  
}















###########################################
########################################
########asymptotic

##load asymptotic reference distribution
load("/Users/schefzik/Desktop/Simulations/L2_Asymptotics/ref_distr.dat")


##function for p-value for one-sided test (as test statistic is always >=0)
#pval.one<-function(d){
#  output<-1-empcdf.ref(d)
#  return(output)    
#}





wasserstein.test.asy<-function(x,y){
  
  set.seed(24)  

  if (length(x)!=0&length(y)!=0){
    
    value<-wasserstein1d(x,y,p=2)
    value.sq<-value^2
    
    ###compute p-value based on asymptotoc theory (brownian bridge)
    
    pr<-seq(from=0,to=1,by=1/10000)
    empir.cdf.y<-ecdf(y)
    
    
    parts.trf<-((empir.cdf.y(quantile(x,probs=pr,type=1)))-pr)^2  
    
    trf.int<-(1/length(pr))*sum(parts.trf)
    test.stat<-(length(x)*length(y)/(length(x)+length(y)))*trf.int
    
    #pvalue.wass<-pval.one(test.stat)
    pvalue.wass<-1-empcdf.ref(test.stat)
    
    ####decomposition of wasserstein distance
    mu.x<-mean(x)
    mu.y<-mean(y)
    
    sigma.x<-sd(x)
    sigma.y<-sd(y)
    
    
    pr<-((1:1000)-0.5)/1000
    
    quant.x<-quantile(x,probs=pr,type=1)
    quant.y<-quantile(y,probs=pr,type=1)
    
    if(sd(quant.x)!=0&sd(quant.y)!=0){
      rho.xy<-cor(quant.x,quant.y,method="pearson")
    } else{
      rho.xy<-0  
    }
    
    
    
    location<-(mu.x-mu.y)^2
    size<-(sigma.x-sigma.y)^2
    shape<-2*sigma.x*sigma.y*(1-rho.xy)
    
    wass.comp.sq<-location+size+shape
    wass.comp<-sqrt(wass.comp.sq)
    
    
    perc.loc<-round(((location/wass.comp.sq)*100),2)
    perc.size<-round(((size/wass.comp.sq)*100),2)
    perc.shape<-round(((shape/wass.comp.sq)*100),2)
    
    
    decomp.error<-abs(value.sq-wass.comp.sq)
    
    
  } else {
    value<-NA
    value.sq<-NA
    wass.comp.sq<-NA
    wass.comp<-NA
    location<-NA
    size<-NA
    shape<-NA
    rho.xy<-NA
    pvalue.wass<-NA
    perc.loc<-NA
    perc.size<-NA
    perc.shape<-NA
    decomp.error<-NA
  }
  
  
  ##create output
  output<-c(value,value.sq,wass.comp.sq,wass.comp,location,size,shape,rho.xy,pvalue.wass,perc.loc,perc.size,perc.shape,decomp.error)
  names(output)<-c("d.transport","d.transport^2","d.comp^2","d.comp","location","size","shape","rho","pval","perc.loc","perc.size","perc.shape","decomp.error")
  
  
  return(output)
  
}




###################################
#######overall function

wasserstein.test<-function(x,y,seedex=24,permnum=10000,method){
  if(method=="SP")
    RES<-wasserstein.test.sp(x,y,seedex,permnum)
  if(method=="asy")  
    RES<-wasserstein.test.asy(x,y)  
  return(RES) 
}




####################################
##################test example 1

v<-rnorm(500)
w<-rnorm(500)

wasserstein.test(v,w,method="SP")
wasserstein.test(v,w,seedex=34,permnum=1000,method="SP")
wasserstein.test(v,w,method="asy")





##################test example 2

v<-rnorm(500)
w<-rnorm(500,1,2)

wasserstein.test(v,w,method="SP")
wasserstein.test(v,w,seedex=34,permnum=1000,method="SP")
wasserstein.test(v,w,method="asy")
