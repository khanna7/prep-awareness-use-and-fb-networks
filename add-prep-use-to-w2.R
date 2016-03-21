## add 'prepuse' data to wave2
   rm(list=ls())

   ## libraries and data
   library(igraph)
   load("pu-vs-ba-correct.RData")
   load("../w2_com_resp_r0_analysis/prepuse-as-networks-wo-ci-w2.RData")

   ## add prepuse to w2
   V(resp.w2.w.data.ig)$prepuse   
   V(resp.w2.w.data.ig)$name   
   V(w2.com.resp.ig)$vertex.names
   identical(V(resp.w2.w.data.ig)$name, V(w2.com.resp.ig)$vertex.names)

   V(w2.com.resp.ig)$prepuse <- V(resp.w2.w.data.ig)$prepuse   

   save.image(file="w2-prepuse-data.RData")
