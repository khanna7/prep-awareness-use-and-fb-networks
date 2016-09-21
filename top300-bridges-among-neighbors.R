## calculate threshold for adoption of PrEP by egos, as a function of the % of their friends
## who are PrEP aware

   rm(list=ls())

   ## libraries 
   library(igraph)

   ## data
   load(file="fb-friendships-with-prepaware-w-uconnect-participants.RData")
   load("../w1_com_resp_r0_analysis/w1-top300-bridges-among-ego-networks.RData") #w1


   ## obtain names of FB friends (i.e. neighborhoods) of PU and BA in Wave 1
      ## persistently unaware
      w1.pu.ngbhd.names <- lapply(w1.pu.ngbhd, function (x)
                                               get.vertex.attribute(w1.com.resp.w.w2.data.ig,
                                                                    "vertex.names", index=x)
                                  )
      summary(unlist(lapply(w1.pu.ngbhd.names, length)))
      deg.pu <- lapply(w1.pu.ngbhd.names, length)
                       
      ##  became aware
      w1.ba.ngbhd.names <- lapply(w1.ba.ngbhd, function (x)
                                               get.vertex.attribute(w1.com.resp.w.w2.data.ig,
                                                                    "vertex.names", index=x)
                                  )
      summary(unlist(lapply(w1.ba.ngbhd.names, length)))
      deg.ba <- lapply(w1.ba.ngbhd.names, length)

   ## compute the proportion of top 50 bridges, for each measure, among the FB friends
   ## of PU's and BA's

      ## persistently unaware
         ## btwn
         num.top300.btwn.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                   length(which(w1_top300_btwn[,2] %in% x))
                                                   )
         unlist(num.top300.btwn.among.pu.friends)
         summary(unlist(num.top300.btwn.among.pu.friends))
         ## evcent
         num.top300.evcent.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_top300_evcent[,2] %in% x))
                                                   )
         unlist(num.top300.evcent.among.pu.friends)
         summary(unlist(num.top300.evcent.among.pu.friends))

         ## kp
         num.top300.kp.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_top300_kp[,2] %in% x))
                                                   )
         unlist(num.top300.kp.among.pu.friends)
         summary(unlist(num.top300.kp.among.pu.friends))

         ## bridging
         num.top300.brid.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_top300_brid[,2] %in% x))
                                                   )
         unlist(num.top300.brid.among.pu.friends)
         summary(unlist(num.top300.brid.among.pu.friends))

         ## ens
         num.top300.ens.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_top300_ens[,2] %in% x))
                                                   )
         unlist(num.top300.ens.among.pu.friends)
         summary(unlist(num.top300.ens.among.pu.friends))

         ## constraint
         num.low300.con.among.pu.friends <- lapply(w1.pu.ngbhd.names,function(x)
                                                    length(which(w1_low300_con[,2] %in% x))
                                                   )
         unlist(num.low300.con.among.pu.friends)
         summary(unlist(num.low300.con.among.pu.friends))

      ## became aware
         ## btwn
         num.top300.btwn.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                   length(which(w1_top300_btwn[,2] %in% x))
                                                   )
         unlist(num.top300.btwn.among.ba.friends)
         summary(unlist(num.top300.btwn.among.ba.friends))
         ## evcent
         num.top300.evcent.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_top300_evcent[,2] %in% x))
                                                   )
         unlist(num.top300.evcent.among.ba.friends)
         summary(unlist(num.top300.evcent.among.ba.friends))

         ## kp
         num.top300.kp.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_top300_kp[,2] %in% x))
                                                   )
         unlist(num.top300.kp.among.ba.friends)
         summary(unlist(num.top300.kp.among.ba.friends))

         ## bridging
         num.top300.brid.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_top300_brid[,1] %in% x))
                                                   )
         unlist(num.top300.brid.among.ba.friends)
         summary(unlist(num.top300.brid.among.ba.friends))

         ## ens
         num.top300.ens.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_top300_ens[,2] %in% x))
                                                   )
         unlist(num.top300.ens.among.ba.friends)
         summary(unlist(num.top300.ens.among.ba.friends))

         ## constraint
         num.low300.con.among.ba.friends <- lapply(w1.ba.ngbhd.names,function(x)
                                                    length(which(w1_low300_con[,2] %in% x))
                                                   )
         unlist(num.low300.con.among.ba.friends)
         summary(unlist(num.low300.con.among.ba.friends))

   ## save data
   save.image(file="top300-bridges-in-w1-neighbor-networks.RData")
