## calculate threshold for adoption of PrEP by egos, as a function of the % of their friends
## who are PrEP aware

   rm(list=ls())

   ## libraries 
   library(igraph)

   ## data
   ## w1 prepA 
   load("../w1_com_resp_r0_analysis/prep-awareness-as-networks-wi-ci-bootstrap.RData") #w1
   w1.nn.ave <- nn.ave

   load("../w2_com_resp_r0_analysis/prep-awareness-as-networks-wo-ci-w2.RData") #w2 (update to v with ci)
   w2.nn.ave <- nn.ave

   load("pu-vs-ba-correct.RData")

   ## nodes persistently unaware of PrEP
      pu.names

   ## nodes unaware in wave 1 but aware in w2
      ba.names

   ## compare w1 FB networks of pers.unaware to bec.aware
   ## a. in terms of num friends
         ## pers unaware
         deg.of.pu.id.in.w1 <- degree(w1.com.resp.w.w2.data.ig, v=pu.id)
         summary(deg.of.pu.id.in.w1)

         ## became aware
         deg.of.ba.id.in.w1 <- degree(w1.com.resp.w.w2.data.ig, v=ba.id)
         summary(deg.of.ba.id.in.w1)

   ## b. in terms of num and % of friends who were PrEP aware
         ## persistently unaware
         w1.pu.ngbhd <- neighborhood(w1.com.resp.w.w2.data.ig, order=1, nodes=pu.id)
         w1.pu.ngbhd <- lapply(w1.pu.ngbhd, function (x) x[-1]) #to not count the seed vertex
         w1.pu.nghbd.names <- lapply(w1.pu.ngbhd, function(x)
                                                  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "vertex.names",
                                                                       index=x)
                                     )
         w1.pu.ngbhd.num <- lapply(w1.pu.ngbhd, length)
         w1.pu.prepknow.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
                                                  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "prepknow",
                                                                       index=x)
                                                 )
         ## became aware
         w1.ba.ngbhd <- neighborhood(w1.com.resp.w.w2.data.ig, order=1, nodes=ba.id)
         w1.ba.ngbhd <- lapply(w1.ba.ngbhd, function (x) x[-1]) #to not count the seed vertex
         w1.ba.nghbd.names <- lapply(w1.ba.ngbhd, function(x)
                                                  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "vertex.names",
                                                                       index=x)
                                     )
         w1.ba.ngbhd.num <- lapply(w1.ba.ngbhd, length)
         w1.ba.prepknow.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
                                                  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "prepknow",
                                                                       index=x)
                                                 )

         ## friends of pers unaware
            ## num who were prep aware
            w1.pu.prepaware.num.friends <- lapply(w1.pu.prepknow.status.of.friends, function(x)
                                                sum(x)
                                               )
            summary(unlist(w1.pu.prepaware.num.friends))

            ## percent who were prepaware 
            w1.pu.percent.prep.aware <- unlist(w1.pu.prepaware.num.friends)/unlist(w1.pu.ngbhd.num)
            summary(w1.pu.percent.prep.aware)

         ## friends of became aware
            ## num who were prep aware
            w1.ba.prepaware.num.friends <- lapply(w1.ba.prepknow.status.of.friends, function(x)
                                                sum(x)
                                               )
            summary(unlist(w1.ba.prepaware.num.friends))

            ## percent who were prepaware 
            w1.ba.percent.prep.aware <- unlist(w1.ba.prepaware.num.friends)/unlist(w1.ba.ngbhd.num)
            summary(w1.ba.percent.prep.aware)

   ## c. in terms of num and % of friends who were PrEP using
         ## persistently unaware
         w1.pu.prepuse.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
                                                  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "prepuse",
                                                                       index=x)
                                                 )
         w1.pu.friend.prepuse.num <- lapply(w1.pu.prepuse.status.of.friends,function(x)
                                            length(which(!is.na(x)))
                                            )
         ## became aware
         w1.ba.prepuse.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
                                                  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "prepuse",
                                                                       index=x)
                                                   )
                                                   
         w1.ba.friend.prepuse.num <- lapply(w1.ba.prepuse.status.of.friends,function(x)
                                            length(which(!is.na(x)))
                                            )
                                            
         ## friends of pers unaware
            ## num who were prep users
            w1.pu.prepuse.num.friends <- lapply(w1.pu.prepuse.status.of.friends, function(x)
                                                sum(x, na.rm=TRUE)
                                               )
            summary(unlist(w1.pu.prepuse.num.friends))

            ## percent who were prepusing 
            w1.pu.percent.prep.using <- unlist(w1.pu.prepuse.num.friends)/unlist(w1.pu.friend.prepuse.num)
            summary(w1.pu.percent.prep.using)
            length(which(w1.pu.prepuse.num.friends == 0))

        ## friends of became aware
            ## num who were prep users
            w1.ba.prepuse.num.friends <- lapply(w1.ba.prepuse.status.of.friends, function(x)
                                                sum(x, na.rm=TRUE)
                                               )
            summary(unlist(w1.ba.prepuse.num.friends))

            ## percent who were prepaware 
            w1.ba.percent.prep.aware <- unlist(w1.ba.prepuse.num.friends)/unlist(w1.ba.friend.prepuse.num)
            summary(w1.ba.percent.prep.aware)
                                                   
   ## save data
   save.image(file="fb-friendships-with-prepaware-w-uconnect-participants.RData")
