## descriptives on common 266 respondents

  rm(list=ls())

  ## libraries and data
  library(igraph)
  #library(dplyr) (loading dplyr here causes an error with the do.call below)
  load(file="pu-vs-ba-correct.RData")

  ## convert w2.ig to undirected
  w2.ig <- as.undirected(w2.ig)
  
  ## list vertex attributes
  list.vertex.attributes(w1.com.resp.w.w2.data.ig)
  list.vertex.attributes(w2.com.resp.ig)

  identical(V(w1.com.resp.w.w2.data.ig)$name, V(w2.com.resp.ig)$name)
  
  ## For 266 nodes in common between waves 1 and 2, compute
     ## sizes of Facebook networks (including nonrespondents)
     ## (adapted from simon's email dated 8/6/2015)
     com.resp.w1.ig.idx <- which(V(w1.ig)$name %in% 
                                      V(w1.com.resp.w.w2.data.ig)$vertex.names)
     com.resp.w1.ig.names <- sort((V(w1.ig)$name)[com.resp.w1.ig.idx])
     w1.ig.266.com.ls <- incident_edges(w1.ig, com.resp.w1.ig.idx)
     all.w1.ig.266.com.ls <- do.call(union, w1.ig.266.com.ls) 
     w1.ig.266.com.inc.graph <- subgraph.edges(w1.ig, all.w1.ig.266.com.ls)
     vcount(w1.ig.266.com.inc.graph); ecount(w1.ig.266.com.inc.graph)
        
     com.resp.w2.ig.idx <- which(V(w2.ig)$name %in% V(w2.com.resp.ig)$vertex.names)
     com.resp.w2.ig.names <- sort((V(w2.ig)$name)[com.resp.w2.ig.idx])
     w2.ig.266.com.ls <- incident_edges(w2.ig, com.resp.w2.ig.idx)
     all.w2.ig.266.com.ls <- do.call(union, w2.ig.266.com.ls)
     w2.ig.266.com.inc.graph <- subgraph.edges(w2.ig, all.w2.ig.266.com.ls)
     vcount(w2.ig.266.com.inc.graph); ecount(w2.ig.266.com.inc.graph)
  
  ## Common edges between waves 1 and 2
     is.directed(w1.ig.266.com.inc.graph)
     is.directed(w2.ig.266.com.inc.graph) 
     
     w1.ig.266.com.inc.graph.el <- as_edgelist(w1.ig.266.com.inc.graph)
     w2.ig.266.com.inc.graph.el <- as_edgelist(w2.ig.266.com.inc.graph)
  
     dim(w1.ig.266.com.inc.graph.el); dim(w2.ig.266.com.inc.graph.el)
        
     ### alternate method to compute intersection of 2 matrices (begin)###
        #com.els <- rbind(w1.ig.266.com.inc.graph.el, w2.ig.266.com.inc.graph.el)
        #nrow(com.els) == nrow(w1.ig.266.com.inc.graph.el) + nrow(w2.ig.266.com.inc.graph.el)     
  
        #dim(com.els[duplicated(com.els), ,drop = FALSE])
        #nrow(w1.ig.266.com.inc.graph.el) == nrow(com.els[duplicated(com.els), ,drop = FALSE])
        
        #nrow(w2.ig.266.com.inc.graph.el) - nrow(w1.ig.266.com.inc.graph.el)
        ### alternate method to compute intersection of 2 matrices (end)###
  
    df1 <- as.data.frame(w1.ig.266.com.inc.graph.el)
    df2 <- as.data.frame(w2.ig.266.com.inc.graph.el)
  
    int.df1.df2 <- intersect(df1, df2) #load dplyr to get this result
    dim(int.df1.df2)      
        
 ## permute nodes in W1 network so respondents are at the top
    vnames <- V(w1.ig.266.com.inc.graph)$name
    resp.1 <- which(substr(vnames, 1, 4) == "1111")
    resp.2 <- which(substr(vnames, 1, 4) == "2222")
    vnames.nr <- vnames[-c(resp.1, resp.2)]
    vnames.ord <- c(vnames[resp.1], vnames[resp.2], vnames.nr)
  
    w1.ig.266.com.inc.graph <- permute.vertices(w1.ig.266.com.inc.graph, 
                                                    match(vnames, vnames.ord)
                                                    )
  
 ## permute nodes in W2 network so respondents are at the top
    vnames <- V(w2.ig.266.com.inc.graph)$name
    resp.1 <- which(substr(vnames, 1, 4) == "1111")
    resp.2 <- which(substr(vnames, 1, 4) == "2222")
    vnames.nr <- vnames[-c(resp.1, resp.2)]
    vnames.ord <- c(sort(vnames[resp.1]), sort(vnames[resp.2]), vnames.nr)
  
    w2.ig.266.com.inc.graph <- permute.vertices(w2.ig.266.com.inc.graph, 
                                                match(vnames, vnames.ord)
                                                    )
 ## so far the two networks will include all respondents, not just those who are common and provided uconnect data
    head(V(w1.ig.266.com.inc.graph)$name)
    head(V(w2.ig.266.com.inc.graph)$name)
  
 ## extract degrees for these individuals from the networks of incident edges
    w1.ig.266.com.inc.graph.resp.idx <- which(V(w1.ig.266.com.inc.graph)$name %in% com.resp.w1.ig.names)
    w1.ig.266.com.inc.graph.resp.names <- (V(w1.ig.266.com.inc.graph)$name)[w1.ig.266.com.inc.graph.resp.idx] 

    w2.ig.266.com.inc.graph.resp.idx <- which(V(w2.ig.266.com.inc.graph)$name %in% com.resp.w2.ig.names)
    w2.ig.266.com.inc.graph.resp.names <- (V(w2.ig.266.com.inc.graph)$name)[w2.ig.266.com.inc.graph.resp.idx] 
  
    length(which(w1.ig.266.com.inc.graph.resp.names %in% w2.ig.266.com.inc.graph.resp.names)) == length(w1.ig.266.com.inc.graph.resp.names)
           
 ## compute needed metrics on FB graphs of 266 common respondents
    deg.w1.ig.266.com.inc.graph <- degree(w1.ig.266.com.inc.graph, v=w1.ig.266.com.inc.graph.resp.idx)
    deg.w2.ig.266.com.inc.graph <- degree(w2.ig.266.com.inc.graph, v=w2.ig.266.com.inc.graph.resp.idx)
        
    
        

  
  
  w1.resp.name.idx <- 
    union(which(substr(V(w1.ig.266.com.inc.graph)$name, 1, 4) == "1111"),
              which(substr(V(w1.ig.266.com.inc.graph)$name, 1, 4) == "2222"))
  
         w2.resp.name.idx <- 
    union(which(substr(V(w2.ig.266.com.inc.graph)$name, 1, 4) == "1111"),
          which(substr(V(w2.ig.266.com.inc.graph)$name, 1, 4) == "2222"))
  
        w1.resp.name <- (V(w1.ig.266.com.inc.graph)$name)[w1.resp.name.idx]
        w2.resp.name <- (V(w2.ig.266.com.inc.graph)$name)[w2.resp.name.idx]
   
        intersect(w1.resp.name, w2.resp.name)
  
  ## save
  save.image(file="prep-chicago-descriptives.RData")
        