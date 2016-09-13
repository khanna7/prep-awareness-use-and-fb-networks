## data
library(igraph)
load(file="fb-friendships-with-prepaware-w-uconnect-participants.RData")
load("../w1_com_resp_r0_analysis/w1_outcomes_all.RData")

## inspect objects
dim(w1.outcomes.all)
colnames(w1.outcomes.all)
w1.com.resp.w.w2.data.ig

##subset dataset with all attributes
id_in_com <- which(w1.outcomes.all$su_id %in% V(w1.com.resp.w.w2.data.ig)$vertex.names)
w1.outcomes.all.w.data <- w1.outcomes.all[id_in_com,]
dim(w1.outcomes.all.w.data)

pu.id
ba.id
## add each attribute to network object

## FIND DATA FOR NEIGHBORS
   ## age
   w1.ba.agecalc.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
    get.vertex.attribute(w1.com.resp.w.w2.data.ig, "fb_age",
                         index=x)
                                           )
   w1.pu.agecalc.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
    get.vertex.attribute(w1.com.resp.w.w2.data.ig, "fb_age",
                         index=x)
                                           )

   ## hivprogever
   w1.ba.hivprogever.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
    get.vertex.attribute(w1.com.resp.w.w2.data.ig, "hivprogever",
                         index=x)
                                           )
   w1.pu.hivprogever.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
    get.vertex.attribute(w1.com.resp.w.w2.data.ig, "hivprogever",
                         index=x)
                                           )

