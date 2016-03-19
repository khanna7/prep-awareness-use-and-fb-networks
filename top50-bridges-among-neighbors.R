## calculate threshold for adoption of PrEP by egos, as a function of the % of their friends
## who are PrEP aware

   rm(list=ls())

   ## libraries 
   library(igraph)

   ## data
   load(file="fb-friendships-with-prepusers-in-uconnect.RData")
   load("../w1_com_resp_r0_analysis/w1-top50-bridges-among-ego-networks.RData") #w1


   ## compare w1 FB networks of pers.unaware to bec.aware
   ## a. in terms of % of friends who are amongst top300 by various categories

         ## pers.unaware
         w1.nn.ave.btwn.for.pers.unaware <- w1.nn.ave.btwn[w1.idx.pers.unaware]
         summary(w1.nn.ave.btwn.for.pers.unaware)

         w1.nn.ave.evcent.for.pers.unaware <- w1.nn.ave.evcent[w1.idx.pers.unaware]
         summary(w1.nn.ave.evcent.for.pers.unaware)

         w1.nn.ave.brid.for.pers.unaware <- w1.nn.ave.brid[w1.idx.pers.unaware]
         summary(w1.nn.ave.brid.for.pers.unaware)

         w1.nn.ave.kp.for.pers.unaware <- w1.nn.ave.kp[w1.idx.pers.unaware]
         summary(w1.nn.ave.kp.for.pers.unaware)

         w1.nn.ave.ens.for.pers.unaware <- w1.nn.ave.ens[w1.idx.pers.unaware]
         summary(w1.nn.ave.ens.for.pers.unaware)

         w1.nn.ave.con.for.pers.unaware <- w1.nn.ave.con[w1.idx.pers.unaware]
         summary(w1.nn.ave.con.for.pers.unaware)

         ## bec.aware
         w1.nn.ave.btwn.for.bec.aware <- w1.nn.ave.btwn[w1.idx.bec.aware]
         summary(w1.nn.ave.btwn.for.bec.aware)

         w1.nn.ave.evcent.for.bec.aware <- w1.nn.ave.evcent[w1.idx.bec.aware]
         summary(w1.nn.ave.evcent.for.bec.aware)

         w1.nn.ave.brid.for.bec.aware <- w1.nn.ave.brid[w1.idx.bec.aware]
         summary(w1.nn.ave.brid.for.bec.aware)

         w1.nn.ave.kp.for.bec.aware <- w1.nn.ave.kp[w1.idx.bec.aware]
         summary(w1.nn.ave.kp.for.bec.aware)

         w1.nn.ave.ens.for.bec.aware <- w1.nn.ave.ens[w1.idx.bec.aware]
         summary(w1.nn.ave.ens.for.bec.aware)

         w1.nn.ave.con.for.bec.aware <- w1.nn.ave.con[w1.idx.bec.aware]
         summary(w1.nn.ave.con.for.bec.aware)

   ## save data
   save.image(file="top50-bridges-in-w1-neighbor-networks.RData")
