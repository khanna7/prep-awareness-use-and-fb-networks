library(igraph)
load(file="fb-friendships-with-prepaware-w-uconnect-participants.RData")
load("../w1_com_resp_r0_analysis/w1_outcomes_all.RData")

dim(w1.outcomes.all)
colnames(w1.outcomes.all)
w1.com.resp.w.w2.data.ig

id_in_com <- which(w1.outcomes.all$su_id %in% V(w1.com.resp.w.w2.data.ig)$vertex.names)
w1.outcomes.all.w.data <- w1.outcomes.all[id_in_com,]
dim(w1.outcomes.all.w.data)
