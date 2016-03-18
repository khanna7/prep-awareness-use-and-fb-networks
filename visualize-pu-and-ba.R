
## Visualize PU's and BA's in Wave 1
   load("pu-vs-ba-correct.RData")
   library(network)
   library(sna)

## Inspect networks at both time points
   w1.com.resp.w.w2.data.net
   w2.com.resp.net

## Inspect PU and BA data
   pu.names; pu.id
   ba.names; ba.id

   (w1.com.resp.w.w2.data.net %v% "prepknow")[pu.id]
   (w1.com.resp.w.w2.data.net %v% "prepknow")[ba.id]

   (w2.com.resp.net %v% "prepknow")[pu.id]
   (w2.com.resp.net %v% "prepknow")[ba.id]

## Visualize
   vertex.col <- "white"
   vertex.col[pu.id] <- "red"
   vertex.col[ba.id] <- "blue"
   vertex.cex <- 0.7

   ## With automatic placement of coordinates
      gplot(w1.com.resp.w.w2.data.net,
            vertex.cex=vertex.cex,
            vertex.col=vertex.col,
            usearrows=FALSE,
            edge.lwd=-2,
            edge.lty=3,
            usecurve=TRUE,
            edge.col="gray"
            )

      gplot(w2.com.resp.net,
            vertex.cex=vertex.cex,
            vertex.col=vertex.col,
            usearrows=FALSE,
            edge.lwd=-2,
            edge.lty=3,
            usecurve=TRUE,
            edge.col="gray"
            )

   ## With fixed placement of coordinates
      ## fixed per wave 1
      coord1 <- gplot(w1.com.resp.w.w2.data.net,
                      vertex.cex=vertex.cex,
                      vertex.col=vertex.col,
                      usearrows=FALSE,
                      edge.lwd=-2,
                      edge.lty=3,
                      usecurve=TRUE,
                      edge.col="gray"
                      )
 
     gplot(w2.com.resp.net,
            vertex.cex=vertex.cex,
            vertex.col=vertex.col,
            usearrows=FALSE,
            edge.lwd=-2,
            edge.lty=3,
            usecurve=TRUE,
            edge.col="gray",
            coord=coord1
            )

      ## fixed per wave 2
      pdf(file="w2-w-pu-and-ba.pdf")
      coord2 <- gplot(w2.com.resp.net,
                      vertex.cex=vertex.cex,
                      vertex.col=vertex.col,
                      usearrows=FALSE,
                      edge.lwd=-2,
                      edge.lty=3,
                      usecurve=TRUE,
                      edge.col="gray"
                      )
     legend("topleft", c("Persistently Unaware(PU)", "Became Aware (BA)"),
            pch=19, col=c("red", "blue"), bty="n",
            title.adj=0)
     dev.off()

     pdf(file="w1-w-pu-and-ba.pdf")
     gplot(w1.com.resp.w.w2.data.net,
            vertex.cex=vertex.cex,
            vertex.col=vertex.col,
            usearrows=FALSE,
            edge.lwd=-2,
            edge.lty=3,
            usecurve=TRUE,
            edge.col="gray",
            coord=coord2
            )
     legend("topleft", c("Persistently Unaware(PU)", "Became Aware (BA)"),
            pch=19, col=c("red", "blue"), bty="n",
            title.adj=0)
     dev.off()

