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


