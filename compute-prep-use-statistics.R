## descriptives on common 266 respondents

  rm(list=ls())

  library(igraph)
  library(intergraph)

  load(file="data-on-266-com-fbrespondents-btwn-w1-w2.RData")
  load("w2-prepuse-data.RData")

  ## Check networks of common respondents at w1 and w2
  w1.com.resp.w.w2.data.ig
  w2.com.resp.ig

  ## Check if the ordering of names is consistent
  identical(V(w1.com.resp.w.w2.data.ig)$vertex.names, V(w2.com.resp.ig)$vertex.names)

  ## Check # and % of PrEP users in each wave
  table(V(w1.com.resp.w.w2.data.ig)$prepuse, exclude=NULL)
  table(V(w2.com.resp.ig)$prepuse, exclude=NULL)

  table(V(w1.com.resp.w.w2.data.ig)$prepknow, exclude=NULL)/
      sum(table(V(w1.com.resp.w.w2.data.ig)$prepknow, exclude=NULL))
  table(V(w2.com.resp.ig)$prepknow, exclude=NULL)/
      sum(table(V(w2.com.resp.ig)$prepknow, exclude=NULL))

