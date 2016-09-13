## data
rm(list=ls())

library(igraph)
load(file="fb-friendships-with-prepaware-w-uconnect-participants.RData")
load("../w1_com_resp_r0_analysis/w1_outcomes_all.RData")

## inspect objects
dim(w1.outcomes.all)
colnames(w1.outcomes.all)
w1.com.resp.w.w2.data.ig
vertex_attr_names(w1.com.resp.w.w2.data.ig)

##subset dataset with all attributes
id_in_com <- which(w1.outcomes.all$su_id %in% V(w1.com.resp.w.w2.data.ig)$vertex.names)
w1.outcomes.all.w.data <- w1.outcomes.all[id_in_com,]
dim(w1.outcomes.all.w.data)

pu.id
ba.id
## add each attribute to network object

## FIND DATA FOR NEIGHBORS
   ##If neexed, extract from w1.outcomes.all.w.data, and create attribute for 
   ## w1.com.resp.w.w2.data.ig

   ## age
w1.ba.fb_age.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "fb_age",
                       index=x)
)
w1.ba.fb_age.num.friends <- lapply(w1.ba.fb_age.status.of.friends,
                                        function(x)
                                          median(x, na.rm=TRUE)
)
summary(unlist(w1.ba.fb_age.num.friends))

w1.pu.fb_age.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "fb_age",
                       index=x)
)
w1.pu.fb_age.num.friends <- lapply(w1.pu.fb_age.status.of.friends,
                                        function(x)
                                          median(x, na.rm=TRUE)
)
summary(unlist(w1.pu.fb_age.num.friends))

   ## hivprogever
   V(w1.com.resp.w.w2.data.ig)$hivprogever <-
       V(w1.com.resp.w.w2.data.ig)$hivprogever - 1

   w1.ba.hivprogever.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
    get.vertex.attribute(w1.com.resp.w.w2.data.ig, "hivprogever",
                         index=x)
                                           )
   w1.ba.hivprogever.num.friends <- lapply(w1.ba.hivprogever.status.of.friends,
                                           function(x)
                                               sum(x, na.rm=TRUE)
                                               )
   summary(unlist(w1.ba.hivprogever.num.friends))
   w1.ba.hivprogever.pct.friends <- unlist(w1.ba.hivprogever.num.friends)/deg.of.ba.id.in.w1
   summary(w1.ba.hivprogever.pct.friends)

   w1.pu.hivprogever.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
    get.vertex.attribute(w1.com.resp.w.w2.data.ig, "hivprogever",
                         index=x)
                                           )
   w1.pu.hivprogever.num.friends <- lapply(w1.pu.hivprogever.status.of.friends,
                                           function(x)
                                               sum(x, na.rm=TRUE)
                                               )
   summary(unlist(w1.pu.hivprogever.num.friends))
   w1.pu.hivprogever.pct.friends <- unlist(w1.pu.hivprogever.num.friends)/deg.of.pu.id.in.w1
   summary(w1.pu.hivprogever.pct.friends)

## primarycare
V(w1.com.resp.w.w2.data.ig)$primarycare <-
  V(w1.com.resp.w.w2.data.ig)$primarycare - 1

w1.ba.primarycare.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "primarycare",
                       index=x)
)
w1.ba.primarycare.num.friends <- lapply(w1.ba.primarycare.status.of.friends,
                                        function(x)
                                          sum(x, na.rm=TRUE)
)

summary(unlist(w1.ba.primarycare.num.friends))
w1.ba.primarycare.pct.friends <- unlist(w1.ba.primarycare.num.friends)/deg.of.ba.id.in.w1
summary(w1.ba.primarycare.pct.friends)

w1.pu.primarycare.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "primarycare",
                       index=x)
)
w1.pu.primarycare.num.friends <- lapply(w1.pu.primarycare.status.of.friends,
                                        function(x)
                                          sum(x, na.rm=TRUE)
)
summary(unlist(w1.pu.primarycare.num.friends))

w1.pu.primarycare.pct.friends <- unlist(w1.pu.primarycare.num.friends)/deg.of.pu.id.in.w1
summary(w1.pu.primarycare.pct.friends)

## anustest
V(w1.com.resp.w.w2.data.ig)$anustest <-
  V(w1.com.resp.w.w2.data.ig)$anustest - 1

w1.ba.anustest.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "anustest",
                       index=x)
)
w1.ba.anustest.num.friends <- lapply(w1.ba.anustest.status.of.friends,
                                        function(x)
                                          sum(x, na.rm=TRUE)
)

summary(unlist(w1.ba.anustest.num.friends))
w1.ba.anustest.pct.friends <- unlist(w1.ba.anustest.num.friends)/deg.of.ba.id.in.w1
summary(w1.ba.anustest.pct.friends)

w1.pu.anustest.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "anustest",
                       index=x)
)
w1.pu.anustest.num.friends <- lapply(w1.pu.anustest.status.of.friends,
                                        function(x)
                                          sum(x, na.rm=TRUE)
)
summary(unlist(w1.pu.anustest.num.friends))

w1.pu.anustest.pct.friends <- unlist(w1.pu.anustest.num.friends)/deg.of.pu.id.in.w1
summary(w1.pu.anustest.pct.friends)

## comb.ball.gay
   ## 1= family only (not ballroom)
   ## 2 = memballroom

V(w1.com.resp.w.w2.data.ig)$comb.ball.gay <-
  V(w1.com.resp.w.w2.data.ig)$comb.ball.gay - 1

w1.ba.comb.ball.gay.status.of.friends <- lapply(w1.ba.ngbhd, function(x)
  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "comb.ball.gay",
                       index=x)
)
w1.ba.comb.ball.gay.num.friends <- lapply(w1.ba.comb.ball.gay.status.of.friends,
                                     function(x)
                                       length(which(x == 2))
)

summary(unlist(w1.ba.comb.ball.gay.num.friends))
w1.ba.comb.ball.gay.pct.friends <- unlist(w1.ba.comb.ball.gay.num.friends)/deg.of.ba.id.in.w1
summary(w1.ba.comb.ball.gay.pct.friends)

w1.pu.comb.ball.gay.status.of.friends <- lapply(w1.pu.ngbhd, function(x)
  get.vertex.attribute(w1.com.resp.w.w2.data.ig, "comb.ball.gay",
                       index=x)
)
w1.pu.comb.ball.gay.num.friends <- lapply(w1.pu.comb.ball.gay.status.of.friends,
                                     function(x)
                                       length(which(x == 2))
                                          )

summary(unlist(w1.pu.comb.ball.gay.num.friends))

w1.pu.comb.ball.gay.pct.friends <- unlist(w1.pu.comb.ball.gay.num.friends)/deg.of.pu.id.in.w1
summary(w1.pu.comb.ball.gay.pct.friends)
