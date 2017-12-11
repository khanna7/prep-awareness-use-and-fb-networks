## descriptives on common 266 respondents

  rm(list=ls())

  ## libraries and data
  library(igraph)
  load(file="pu-vs-ba-correct.RData")

  ## list vertex attributes
  list.vertex.attributes(w1.com.resp.w.w2.data.ig)
  list.vertex.attributes(w2.com.resp.ig)

  ## summarize attributes
     ## age
     summary(V(w1.com.resp.w.w2.data.ig)$fb_age[pu.id]); length(V(w1.com.resp.w.w2.data.ig)$fb_age[pu.id])
     summary(V(w1.com.resp.w.w2.data.ig)$fb_age[ba.id]); length(V(w1.com.resp.w.w2.data.ig)$fb_age[ba.id])

     ## education.new: '0'='grade 0 -12', '1'='HS Diploma or GED',
     ## '2'='some college', '3'=Associate/Bachelors/Masters'
     table(V(w1.com.resp.w.w2.data.ig)$education.new[pu.id],exclude=NULL)/
         sum(table(V(w1.com.resp.w.w2.data.ig)$education.new[pu.id],exclude=NULL))
     table(V(w1.com.resp.w.w2.data.ig)$education.new[ba.id], exclude=NULL)/
         sum(table(V(w1.com.resp.w.w2.data.ig)$education.new[ba.id], exclude=NULL))

     ## employment
     ## '1' = "Full time (30 hours or more a week)"  
     ## '2' = "Not employed"                         
     ## '3' = "Part time (less than 30 hours a week)"
     table(V(w1.com.resp.w.w2.data.ig)$employed.recode[pu.id],exclude=NULL)/
         sum(table(V(w1.com.resp.w.w2.data.ig)$employed.recode[pu.id],exclude=NULL))
     table(V(w1.com.resp.w.w2.data.ig)$employed.recode[ba.id],exclude=NULL)/
         sum(table(V(w1.com.resp.w.w2.data.ig)$employed.recode[ba.id],exclude=NULL))

   ## Full Facebook network information for PU's and BA's
      ## Wave 1
         ## PU
         pu.in.w1 <- which(V(w1.ig)$name %in% pu.names)
         w1.fb.deg.of.pu <- degree(w1.ig, v=pu.in.w1)
         summary(w1.fb.deg.of.pu)
         ## BA
         ba.in.w1 <- which(V(w1.ig)$name %in% ba.names)
         w1.fb.deg.of.ba <- degree(w1.ig, v=ba.in.w1)
         summary(w1.fb.deg.of.ba)

      ## Wave 2
         ## PU
         pu.in.w2 <- which(V(w2.ig)$name %in% pu.names)
         w2.fb.deg.of.pu <- degree(w2.ig, v=pu.in.w2)
         summary(w2.fb.deg.of.pu)
         ## BA
         ba.in.w2 <- which(V(w2.ig)$name %in% ba.names)
         w2.fb.deg.of.ba <- degree(w2.ig, v=ba.in.w2)
         summary(w2.fb.deg.of.ba)

     ## For 266 nodes in common between waves 1 and 2, compute
        ## sizes of Facebook networks (including nonrespondents)
        ## (adapted from simon's email dated 8/6/2015)
        com.resp.w1.ig.idx <- which(V(w1.ig)$name %in% 
                                      V(w1.com.resp.w.w2.data.ig)$vertex.names)
        w1.ig.266.com.ls <- incident_edges(w1.ig, com.resp.w1.ig.idx)
        all.w1.ig.266.com.ls <- do.call(union, w1.ig.266.com.ls) 
        w1.ig.266.com.inc.graph <- subgraph.edges(w1.ig, all.w1.ig.266.com.ls)
        vcount(w1.ig.266.com.inc.graph); ecount(w1.ig.266.com.inc.graph)
        
        com.resp.w2.ig.idx <- which(V(w2.ig)$name %in% V(w1.com.resp.w.w2.data.ig)$vertex.names)
        w2.ig.266.com.ls <- incident_edges(w2.ig, com.resp.w2.ig.idx)
        all.w2.ig.266.com.ls <- do.call(union, w2.ig.266.com.ls)
        w2.ig.266.com.inc.graph <- subgraph.edges(w2.ig, all.w2.ig.266.com.ls)
        vcount(w2.ig.266.com.inc.graph); ecount(w2.ig.266.com.inc.graph)
        