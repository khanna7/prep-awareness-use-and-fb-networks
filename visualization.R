## visualization of Wave 1 and Wave 2 networks for report

   rm(list=ls())

   library(igraph)
   library(intergraph)
   library(network)
   library(sna)

   load("../threshold-analysis/pu-vs-ba-nearest-nghbrs.RData")

   ## Convert igraph objects to network for visualization
   w1.com.resp.net <- asNetwork(w1.com.resp.r0)
   w2.com.resp.net <- asNetwork(w2.com.resp.r0)

   ## Visualization parameters (Wave 1)
   vertex.cex=0.7

   vertex.col="white"
   prep.aware <- which(w1.com.resp.net %v% "prepknow" == 1)
   vertex.col[prep.aware] <- "blue"

   ## Wave 1 visual
   list.vertex.attributes(w1.com.resp.net)

   ## pdf(file="w1-prep-know.pdf")
   ## gplot(w1.com.resp.net,
   ##       vertex.cex=vertex.cex,
   ##       vertex.col=vertex.col,
   ##       usearrows=FALSE,
   ##       edge.lwd=-2,
   ##       edge.lty=3,
   ##       usecurve=TRUE,
   ##       edge.col="gray"
   ##       )
   ## dev.off()   
   
   ## Visualization parameters (Wave 2)
   vertex.cex=0.7

   ## PrEP aware in Wave 2
   vertex.col="white"

   load("/home/khanna7/Projects/UConnect/UConnect_FB/Wave_2/descriptives/w2_resp_igraph.RData")
   load("/home/khanna7/Projects/UConnect/UConnect_FB/w1_w2_com_respondents_from_igraph/w2_com_resp_r0_analysis/prep-awareness-as-networks-wo-ci-w2.RData")

   w2.com.resp.net <- asNetwork(resp.w2.w.data.ig)


   prep.aware <- which(w2.com.resp.net %v% "prepknow" == 1)
   vertex.col[prep.aware] <- "blue"

   ## pdf(file="w2-prep-know.pdf")
   ## gplot(w2.com.resp.net,
   ##       vertex.cex=vertex.cex,
   ##       vertex.col=vertex.col,
   ##       usearrows=FALSE,
   ##       edge.lwd=-2,
   ##       edge.lty=3,
   ##       usecurve=TRUE,
   ##       edge.col="gray"
   ##       )
   ## dev.off()

## Redo Wave 1 and Wave 2 plots for 266 respondents who gave data in Wave 2
   ## Obtain induced Subgraphs for w1 and w2 com respondent networks
   ## w2.com.resp.no.data <- which(is.na(w2.com.resp.net %v% "fb_age")) #28 of these gave no data in Wave 2
   ## w2.com.resp.w.data <- (w2.com.resp.net %v% "vertex.names")[-w2.com.resp.no.data]
   ## w2.com.resp.w.data.vid <- which(w2.com.resp.net %v% "vertex.names" %in% w2.com.resp.w.data)

   w1.com.resp.vnames <- w1.com.resp.net %v% "vertex.names"
   w2.com.resp.vnames <- w2.com.resp.net %v% "vertex.names"
   w1.com.resp.w.w2.data.vid <- which(w1.com.resp.vnames %in% w2.com.resp.vnames)

   w1.com.resp.w.w2.data.net <- get.inducedSubgraph(w1.com.resp.net, v=w1.com.resp.w.w2.data.vid)
   #w2.com.resp.w.data.net <- get.inducedSubgraph(w2.com.resp.net, v=w2.com.resp.w.data.vid)

   ## Plot
      ## Wave 1
      set.seed(7)
      vertex.col=rep("white", network.size(w1.com.resp.w.w2.data.net))
      prep.aware <- which(w1.com.resp.w.w2.data.net %v% "prepknow" == 1)
      vertex.col[prep.aware] <- "blue"

      pdf(file="w1-prep-know-n-266.pdf")
      gplot(w1.com.resp.w.w2.data.net,
            vertex.cex=vertex.cex,
            vertex.col=vertex.col,
            usearrows=FALSE,
            edge.lwd=-2,
            edge.lty=3,
            usecurve=TRUE,
            edge.col="gray"
            )
      dev.off()

      ## Wave 2 
      vertex.col=rep("white", network.size(w2.com.resp.net))
      prep.aware <- which(w2.com.resp.net %v% "prepknow" == 1)
      vertex.col[prep.aware] <- "blue"

      pdf(file="w2-prep-know-n-266.pdf")
      gplot(w2.com.resp.net,
            vertex.cex=vertex.cex,
            vertex.col=vertex.col,
            usearrows=FALSE,
            edge.lwd=-2,
            edge.lty=3,
            usecurve=TRUE,
            edge.col="gray"
            )
      dev.off()

  ## save
  save.image(file="data-on-266-com-fbrespondents-btwn-w1-w2.RData")
