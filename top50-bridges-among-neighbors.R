## calculate threshold for adoption of PrEP by egos, as a function of the % of their friends
## who are PrEP aware

   rm(list=ls())

   ## libraries 
   library(igraph)

   ## data
   load(file="fb-friendships-with-prepaware-w-uconnect-participants.RData")
   load("../w1_com_resp_r0_analysis/w1-top50-bridges-among-ego-networks.RData") #w1


   ## obtain names of FB friends (i.e. neighborhoods) of PU and BA in Wave 1
      ## persistently unaware
      w1.pu.ngbhd.names <- lapply(w1.pu.ngbhd, function (x)
                                               get.vertex.attribute(w1.com.resp.w.w2.data.ig,
                                                                    "vertex.names", index=x)
                                  )
      deg.pu <- lapply(w1.pu.ngbhd.names, length)

      ##  became aware
      w1.ba.ngbhd.names <- lapply(w1.ba.ngbhd, function (x)
                                               get.vertex.attribute(w1.com.resp.w.w2.data.ig,
                                                                    "vertex.names", index=x)
                                  )
      deg.ba <- lapply(w1.ba.ngbhd.names, length)
   
   ## compute the proportion of top 50 bridges, for each measure, among the FB friends
   ## of PU's, and BA's

      ## persistently unaware
         ## btwn
         num.top50.btwn.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                   length(which(w1_top50_btwn[,2] %in% x))
                                                   )
         unlist(num.top50.btwn.among.pu.friends)
         summary(unlist(num.top50.btwn.among.pu.friends))
         ## evcent
         num.top50.evcent.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_top50_evcent[,2] %in% x))
                                                   )
         unlist(num.top50.evcent.among.pu.friends)
         summary(unlist(num.top50.evcent.among.pu.friends))
         summary(unlist(num.top50.evcent.among.pu.friends)/unlist(deg.pu))
   
         ## kp
         num.top50.kp.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_top50_kp[,2] %in% x))
                                                   )
         unlist(num.top50.kp.among.pu.friends)
         summary(unlist(num.top50.kp.among.pu.friends))
         summary(unlist(num.top50.kp.among.pu.friends)/unlist(deg.pu))

         ## bridging
         num.top50.brid.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_top50_brid[,1] %in% x))
                                                   )
         unlist(num.top50.brid.among.pu.friends)
         summary(unlist(num.top50.brid.among.pu.friends))

         ## ens
         num.top50.ens.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_top50_ens[,2] %in% x))
                                                   )
         unlist(num.top50.ens.among.pu.friends)
         summary(unlist(num.top50.ens.among.pu.friends))

         ## constraint
         num.low50.con.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_low50_con[,2] %in% x))
                                                   )
         unlist(num.low50.con.among.pu.friends)
         summary(unlist(num.low50.con.among.pu.friends))

      ## became aware
         ## btwn
         num.top50.btwn.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                   length(which(w1_top50_btwn[,2] %in% x))
                                                   )
         unlist(num.top50.btwn.among.ba.friends)
         summary(unlist(num.top50.btwn.among.ba.friends))
         ## evcent
         num.top50.evcent.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_top50_evcent[,2] %in% x))
                                                   )
         unlist(num.top50.evcent.among.ba.friends)
         summary(unlist(num.top50.evcent.among.ba.friends))
         summary(unlist(num.top50.evcent.among.ba.friends)/unlist(deg.ba))
         
         ## kp
         num.top50.kp.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_top50_kp[,2] %in% x))
                                                   )
         unlist(num.top50.kp.among.ba.friends)
         summary(unlist(num.top50.kp.among.ba.friends))
         summary(unlist(num.top50.kp.among.ba.friends)/unlist(deg.ba))
   
         ## bridging
         num.top50.brid.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_top50_brid[,1] %in% x))
                                                   )
         unlist(num.top50.brid.among.ba.friends)
         summary(unlist(num.top50.brid.among.ba.friends))

         ## ens
         num.top50.ens.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_top50_ens[,2] %in% x))
                                                   )
         unlist(num.top50.ens.among.ba.friends)
         summary(unlist(num.top50.ens.among.ba.friends))

         ## constraint
         num.low50.con.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_low50_con[,2] %in% x))
                                                   )
         unlist(num.low50.con.among.ba.friends)
         summary(unlist(num.low50.con.among.ba.friends))

   ## ############################################################################################
   ## ######## OLD STUFF BELOW ###################################################################
   ## ######## USE ONLY IF NECESSARY##############################################################
   ## ############################################################################################
   ## ## compare w1 FB networks of pers.unaware to bec.aware
   ## ## a. in terms of % of friends who are amongst top300 by various categories

   ##       ## pers.unaware
   ##       w1.nn.ave.btwn.for.pers.unaware <- w1.nn.ave.btwn[w1.idx.pers.unaware]
   ##       summary(w1.nn.ave.btwn.for.pers.unaware)

   ##       w1.nn.ave.evcent.for.pers.unaware <- w1.nn.ave.evcent[w1.idx.pers.unaware]
   ##       summary(w1.nn.ave.evcent.for.pers.unaware)

   ##       w1.nn.ave.brid.for.pers.unaware <- w1.nn.ave.brid[w1.idx.pers.unaware]
   ##       summary(w1.nn.ave.brid.for.pers.unaware)

   ##       w1.nn.ave.kp.for.pers.unaware <- w1.nn.ave.kp[w1.idx.pers.unaware]
   ##       summary(w1.nn.ave.kp.for.pers.unaware)

   ##       w1.nn.ave.ens.for.pers.unaware <- w1.nn.ave.ens[w1.idx.pers.unaware]
   ##       summary(w1.nn.ave.ens.for.pers.unaware)

   ##       w1.nn.ave.con.for.pers.unaware <- w1.nn.ave.con[w1.idx.pers.unaware]
   ##       summary(w1.nn.ave.con.for.pers.unaware)

   ##       ## bec.aware
   ##       w1.nn.ave.btwn.for.bec.aware <- w1.nn.ave.btwn[w1.idx.bec.aware]
   ##       summary(w1.nn.ave.btwn.for.bec.aware)

   ##       w1.nn.ave.evcent.for.bec.aware <- w1.nn.ave.evcent[w1.idx.bec.aware]
   ##       summary(w1.nn.ave.evcent.for.bec.aware)

   ##       w1.nn.ave.brid.for.bec.aware <- w1.nn.ave.brid[w1.idx.bec.aware]
   ##       summary(w1.nn.ave.brid.for.bec.aware)

   ##       w1.nn.ave.kp.for.bec.aware <- w1.nn.ave.kp[w1.idx.bec.aware]
   ##       summary(w1.nn.ave.kp.for.bec.aware)

   ##       w1.nn.ave.ens.for.bec.aware <- w1.nn.ave.ens[w1.idx.bec.aware]
   ##       summary(w1.nn.ave.ens.for.bec.aware)

   ##       w1.nn.ave.con.for.bec.aware <- w1.nn.ave.con[w1.idx.bec.aware]
   ##       summary(w1.nn.ave.con.for.bec.aware)

   ## save data
   save.image(file="top50-bridges-in-w1-neighbor-networks.RData")
