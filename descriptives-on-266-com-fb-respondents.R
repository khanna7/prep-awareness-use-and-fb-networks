## descriptives on common 266 respondents

  rm(list=ls())

  library(igraph)
  library(intergraph)

  load(file="data-on-266-com-fbrespondents-btwn-w1-w2.RData")

  ## Check networks of common respondents at w1 and w2
  w1.com.resp.w.w2.data.ig <- asIgraph(w1.com.resp.w.w2.data.net)
  w2.com.resp.ig <- asIgraph(w2.com.resp.net)

  w1.com.resp.w.w2.data.ig
  w2.com.resp.ig

  ## Check if the ordering is consistent
  identical(V(w1.com.resp.w.w2.data.ig)$vertex.names, V(w2.com.resp.ig)$vertex.names)

  ## Check # of PrEP aware in each wave
  table(V(w1.com.resp.w.w2.data.ig)$prepknow, exclude=NULL)
  table(V(w2.com.resp.ig)$prepknow, exclude=NULL)

  ## List PU and BA
  pu.id <- intersect(which(V(w1.com.resp.w.w2.data.ig)$prepknow == 0),
                     which(V(w2.com.resp.ig)$prepknow == 0)
                     )
  pu.names <- (V(w1.com.resp.w.w2.data.ig)$vertex.names)[pu.id]

  ba.id <- intersect(which(V(w1.com.resp.w.w2.data.ig)$prepknow == 0),
                     which(V(w2.com.resp.ig)$prepknow == 1)
                     )
  ba.names <- (V(w1.com.resp.w.w2.data.ig)$vertex.names)[ba.id]

  save.image(file="pu-vs-ba-correct.RData")
