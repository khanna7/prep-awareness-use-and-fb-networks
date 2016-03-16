## calculate threshold for adoption of PrEP by egos, as a function of the % of their friends
## who are PrEP aware

   rm(list=ls())

   ## libraries 
   library(igraph)

   ## data
   load(file="pu-vs-ba-correct.RData")
   load("/home/khanna7/Projects/UConnect/UConnect_FB/FB_W1_Identified_4.15.2015/descriptives/w1_igraph_subsets.RData")
   load("/home/khanna7/Projects/UConnect/UConnect_FB/Wave_2/descriptives/w2_igraph_subsets.RData")

   ## obtain id's of pers.unaware and ba in w1.ig and w2.ig
   ## (i.e. full facebook neV(w1.ig)$name[pers.unaware.idx.in.w1.ig]tworks in waves 1 and 2)
   pu.idx.in.w1.ig <- which(V(w1.ig)$name %in% pu.names)
   ba.idx.in.w1.ig <- which(V(w1.ig)$name %in% ba.names)

   pu.idx.in.w2.ig <- which(V(w2.ig)$name %in% pu.names)
   ba.idx.in.w2.ig <- which(V(w2.ig)$name %in% ba.names)

   ## obtain degrees
   ## wave 1
      pu.deg.in.w1.ig <- degree(w1.ig, v=pu.idx.in.w1.ig)
      ba.deg.in.w1.ig <- degree(w1.ig, v=ba.idx.in.w1.ig)

      summary(pu.deg.in.w1.ig); length(pu.deg.in.w1.ig)
      summary(ba.deg.in.w1.ig); length(ba.deg.in.w1.ig)

   ## wave 2
      pu.deg.in.w2.ig <- degree(w2.ig, v=pu.idx.in.w2.ig)
      ba.deg.in.w2.ig <- degree(w2.ig, v=ba.idx.in.w2.ig)

      summary(pu.deg.in.w2.ig)
      summary(ba.deg.in.w2.ig)

   ## obtain sizes of Facebook networks of PU's and BA's when FB networks are
   ## constrained by age, city and sex
   ## get.vertex.attribute(w1.ig, "fb_age")

      ## constrain by city
      city.is.chicago <- which(V(w1.ig)$chicago == 1)
      w1.ig.chicago <- induced_subgraph(w1.ig, city.is.chicago)

      ## constrain by sex
      is.male <- which(V(w1.ig)$sex_male == 1)
      w1.ig.male <- induced_subgraph(w1.ig, is.male)

      ## get FB network sizes by city.is.chicago
      pu.idx.w1.ig.chicago <- which(V(w1.ig.chicago)$name %in% pu.names)
      ba.idx.w1.ig.chicago <- which(V(w1.ig.chicago)$name %in% ba.names)

      ## get FB network sizes by is.male
      pu.idx.w1.ig.male <- which(V(w1.ig.male)$name %in% pu.names)
      ba.idx.w1.ig.male <- which(V(w1.ig.male)$name %in% ba.names)

      ## Summarize results

         ## Chicago 
         length(pu.idx.w1.ig.chicago)
         length(ba.idx.w1.ig.chicago)
         summary(degree(w1.ig.chicago, v=pu.idx.w1.ig.chicago))
         summary(degree(w1.ig.chicago, v=ba.idx.w1.ig.chicago))

         ## male
         length(pu.idx.w1.ig.male)
         length(ba.idx.w1.ig.male)
         summary(degree(w1.ig.male, v=pu.idx.w1.ig.male))
         summary(degree(w1.ig.male, v=ba.idx.w1.ig.male))

   ## save
   save.image(file="pu-vs-ba-fb-network-comparisons.RData")
