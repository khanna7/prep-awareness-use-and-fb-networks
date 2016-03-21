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

   ## nodes persistently unaware of PrEP
      ## w2 unaware
      w2.prep.unaware.idx <- which(V(resp.w2.w.data.ig)$prepknow == 0)
      w2.prep.unaware.names <- V(resp.w2.w.data.ig)$name[w2.prep.unaware.idx]   

      ## w1 unaware
      w1.prep.unaware.idx <- which(V(w1.com.resp.r0)$prepknow == 0)
      w1.prep.unaware.names <- V(w1.com.resp.r0)$name[w2.prep.unaware.idx]   

      ## persistently unaware
      pers.unaware <- intersect(w1.prep.unaware.names, w2.prep.unaware.names)

   ## nodes unaware in wave 1 but aware in w2
      ## w2 unaware
      w2.prep.aware.idx <- which(V(resp.w2.w.data.ig)$prepknow == 1)
      w2.prep.aware.names <- V(resp.w2.w.data.ig)$name[w2.prep.aware.idx]   

      ## became aware
      bec.aware <- intersect(w1.prep.unaware.names, w2.prep.aware.names)

   ## compare w1 FB networks of pers.unaware to bec.aware
   ## a. in terms of % of friends who were PrEP aware
      ## w1 network of pers unaware 
         w1.idx.pers.unaware <- which(V(w1.com.resp.r0)$name %in% pers.unaware)
         w1.nn.ave.for.pers.unaware <- w1.nn.ave[w1.idx.pers.unaware]
         summary(w1.nn.ave.for.pers.unaware)

      ## w1 network of bec aware
         w1.idx.bec.aware <- which(V(w1.com.resp.r0)$name %in% bec.aware)
         w1.nn.ave.for.bec.aware <- unlist(w1.nn.ave[w1.idx.bec.aware])
         summary(w1.nn.ave.for.bec.aware)

   ## b. in terms of num friends
         ## pers unaware
         pers.unaware.fr.prepaware <- list_nghbrs_prepaware[w1.idx.pers.unaware]
         w1.num.fr.for.pers.unaware <- unlist(lapply(pers.unaware.fr.prepaware, function(x) length(x)))
         summary(w1.num.fr.for.pers.unaware)

         ## became aware
         bec.aware.fr.prepaware <- list_nghbrs_prepaware[w1.idx.bec.aware]
         w1.num.fr.for.bec.aware <- unlist(lapply(bec.aware.fr.prepaware, function(x) length(x)))
         summary(w1.num.fr.for.bec.aware)

   ## c. in terms of num friends who were PrEP aware
         ## pers unaware
         w1.num.prepaware.fr.for.pers.unaware <- unlist(lapply(pers.unaware.fr.prepaware,
                                                               function(x) sum(x)))
         summary(w1.num.prepaware.fr.for.pers.unaware)

         ## became aware
         w1.num.prepaware.fr.for.bec.aware <- unlist(lapply(bec.aware.fr.prepaware,
                                                            function(x) sum(x)))
         summary(w1.num.prepaware.fr.for.bec.aware)            

   ## save data
   save.image(file="fb-friendships-with-prepaware-in-uconnect.RData")
