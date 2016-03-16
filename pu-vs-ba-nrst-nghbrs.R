###############################
## Analyze PrEP awareness as a function of network structure:
## with confidence intervals
###############################

rm(list=ls())

## Libraries & Data

   library(igraph)

   load(file="pu-vs-ba-correct.RData")
   load(file="../w1_com_resp_r0_analysis/prep-awareness-as-networks-wo-ci.RData")

## Outcome variable: became aware (success), persistently unaware (failure)
   w1.com.resp.w.w2.data.ig

## Set outcome variable "ba" = 1 or 0
   ba <- rep(NA, vcount(w1.com.resp.w.w2.data.ig))
   ba[ba.id] <- 1
   ba[pu.id] <- 0
   V(w1.com.resp.w.w2.data.ig)$ba <- ba
   table(V(w1.com.resp.w.w2.data.ig)$ba, useNA="always")

## List vertex attributes as well
   list.vertex.attributes(w1.com.resp.w.w2.data.ig)

## Now use nearest neighbor methods to identify differences between became aware and unaware
   clu <- clusters(w1.com.resp.w.w2.data.ig)
   w1.com.resp.w.w2.data.ig.gc <- induced.subgraph(w1.com.resp.w.w2.data.ig, 
                                         clu$membership == which.max(clu$csize))

   clu 
   w1.com.resp.w.w2.data.ig.gc
   summary(nn.ave) #for proportion of neighbors who are PrEP-aware

   ## nearest neighbor analysis for pa-bu differences by other attributes

      ## egos became aware by % neighbors who became aware (or remained persistenntly unaware)w
      nn.ave.ba <- sapply(V(w1.com.resp.w.w2.data.ig.gc),
                                  function(x) mean(V(w1.com.resp.w.w2.data.ig.gc)[nei(x)]$ba, na.rm=T))

      par(mfrow=c(2,1))
      hist(nn.ave.ba[V(w1.com.resp.w.w2.data.ig.gc)$ba == 1], col="blue",
           ylim=c(0, 50), xlab="Proportion of Facebook friends who became aware",
           main="Egos who became aware", breaks=seq(0, 1, by=0.2))

      hist(nn.ave.ba[V(w1.com.resp.w.w2.data.ig.gc)$ba == 0], col="yellow",
           ylim=c(0, 50), xlab="Proportion of Facebook friends who became aware",
           main="Egos who remained persistently unaware",
           breaks=seq(0, 1, by=0.2))

      dev.off()
      summary(nn.ave.ba[V(w1.com.resp.w.w2.data.ig.gc)$ba == 1])
      summary(nn.ave.ba[V(w1.com.resp.w.w2.data.ig.gc)$ba == 0])

      ## egos became aware by % neighbors who were PrEP aware (or not)
      nn.ave.prep.aware <- sapply(V(w1.com.resp.w.w2.data.ig.gc),
                                  function(x) mean(V(w1.com.resp.w.w2.data.ig.gc)[nei(x)]$prepknow))

      par(mfrow=c(2,1))
      hist(nn.ave.prep.aware[V(w1.com.resp.w.w2.data.ig.gc)$ba == 1], col="blue",
           ylim=c(0, 50), xlab="Proportion of Facebook friends who were PrEP aware in Wave 1",
           main="Number of individuals who became PrEP aware", breaks=seq(0, 1, by=0.2))

      hist(nn.ave.prep.aware[V(w1.com.resp.w.w2.data.ig.gc)$ba == 0], col="yellow",
           ylim=c(0, 50), xlab="Proportion of Facebook friends who were PrEP unaware",
           main="Number of individuals who remained persistently unaware",
           breaks=seq(0, 1, by=0.2))

      summary(nn.ave.prep.aware[V(w1.com.resp.w.w2.data.ig.gc)$ba == 1]); length(nn.ave.prep.aware[V(w1.com.resp.w.w2.data.ig.gc)$ba == 1])
      summary(nn.ave.prep.aware[V(w1.com.resp.w.w2.data.ig.gc)$ba == 0]); length(nn.ave.prep.aware[V(w1.com.resp.w.w2.data.ig.gc)$ba == 0])

      ## egos became aware by % neighbors who used PrEP (or not)
      nn.ave.prep.use <- sapply(V(w1.com.resp.w.w2.data.ig.gc),
                                  function(x) mean(V(w1.com.resp.w.w2.data.ig.gc)[nei(x)]$prepuse, na.rm=TRUE))

      par(mfrow=c(2,1))
      hist(nn.ave.prep.use[V(w1.com.resp.w.w2.data.ig.gc)$ba == 1], col="blue",
           ylim=c(0, 50), xlab="Proportion of Facebook friends who used PrEP",
           main="Number of inidividuals who became PrEP aware",
           breaks=seq(0, 1, by=0.2))

      hist(nn.ave.prep.use[V(w1.com.resp.w.w2.data.ig.gc)$ba == 0], col="yellow",
           ylim=c(0, 50), xlab="Proportion of Facebook friends who used PrEP",
           main="Number of individuals who remained persistently unaware",
           breaks=seq(0, 1, by=0.2))

      summary(nn.ave.prep.use[V(w1.com.resp.w.w2.data.ig.gc)$ba == 1]); length(nn.ave.prep.use[V(w1.com.resp.w.w2.data.ig.gc)$ba == 1])
      summary(nn.ave.prep.use[V(w1.com.resp.w.w2.data.ig.gc)$ba == 0]); length(nn.ave.prep.use[V(w1.com.resp.w.w2.data.ig.gc)$ba == 0])

   save.image(file="pv-vs-ba-nearest-nghbrs.RData")

