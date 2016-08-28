rm(list=ls())

## load datasets
load("/project/khanna7/Projects/UConnect/UConnect_PrEP/Regressions/ego_prep_desrciptives_n622.RData")
load(file="pu-vs-ba-correct.RData")

## identify pu and ba participants
pu_in_ego_data <- which(pu.names %in% ego.data.w.couponinfo$su_id)
ba_in_ego_data <- which(ba.names %in% ego.data.w.couponinfo$su_id)

ego_data_pu_only <- ego.data.w.couponinfo[pu_in_ego_data,]
ego_data_ba_only <- ego.data.w.couponinfo[ba_in_ego_data,]

dim(ego_data_pu_only)
dim(ego_data_ba_only)

## calculate summaries
   ## PU only

   ## ses
   pu.ses.data                    <- subset(ego_data_pu_only, 
                                        select=
                                            c(agecalc.cat,
                                              income.new,
                                              education.new,
                                              jailever,
                                              healthcov,
                                              homeless12mo,
                                              employed.recode
                                              )
                                        )

   ## health
   pu.health.data                 <- subset(ego_data_pu_only,
                                        select=c(hivtest,
                                            primarycare,
                                            mentalcare,
                                            oneonone,
                                        #hivvac,
                                            hiveverdiag,
                                            #stdsyph,
                                            hivprogever,
                                            anustest,
                                            depressed.ind,
                                            labsyphresult
                                                 )
                                        )

  ## sexual behavior data
  pu.sex.behav.data             <- subset(ego_data_pu_only,
                                       select=c(
                                           haveprimary,
                                           nspnocond_mentrans.bin,
                                           nspnocond_women.bin,
                                           #groupsex12mo.3levels,
                                           groupsex12mo.2levels,
                                           bottom.condomless.sex.ind,
                                           partner.pos.or.unknown.ind,
                                           sexdrugs
                                       )
                                       )

  ## social life and networks
  pu.soc.data                    <- subset(ego_data_pu_only,
                                        select=c(
                                            closegay.3levels,
                                            closeblack.3levels,
                                            everboystown,
                                            #memballroom,
                                            ball.walk.binary,
                                            memfamily,
                                            grinderjackd,
                                            facebook,
                                            connected.to.prep.knower.ind,
                                            comb.ball.gay,
                                            recruitclose.bin
                                        )
                                        )

    pu.intravention.data         <- subset(ego_data_pu_only,
                                        select=c(nodrink.nodrugs.ind,
                                            nogroupsex.recode,
                                            en.condom.recode)
                                        )

  ## Month of interview data
     pu.month.of.intvw              <- ego_data_pu_only$int.date.month.new

   ## BA only

   ## ses
   ba.ses.data                    <- subset(ego_data_ba_only, 
                                        select=
                                            c(agecalc.cat,
                                              income.new,
                                              education.new,
                                              jailever,
                                              healthcov,
                                              homeless12mo,
                                              employed.recode
                                              )
                                        )

   ## health
   ba.health.data                 <- subset(ego_data_ba_only,
                                        select=c(hivtest,
                                            primarycare,
                                            mentalcare,
                                            oneonone,
                                        #hivvac,
                                            hiveverdiag,
                                            #stdsyph,
                                            hivprogever,
                                            anustest,
                                            depressed.ind,
                                            labsyphresult
                                                 )
                                        )

  ## sexual behavior data
  ba.sex.behav.data             <- subset(ego_data_ba_only,
                                       select=c(
                                           haveprimary,
                                           nspnocond_mentrans.bin,
                                           nspnocond_women.bin,
                                           #groupsex12mo.3levels,
                                           groupsex12mo.2levels,
                                           bottom.condomless.sex.ind,
                                           partner.pos.or.unknown.ind,
                                           sexdrugs
                                       )
                                       )

  ## social life and networks
  ba.soc.data                    <- subset(ego_data_ba_only,
                                        select=c(
                                            closegay.3levels,
                                            closeblack.3levels,
                                            everboystown,
                                            #memballroom,
                                            ball.walk.binary,
                                            memfamily,
                                            grinderjackd,
                                            facebook,
                                            connected.to.prep.knower.ind,
                                            comb.ball.gay,
                                            recruitclose.bin
                                        )
                                        )

    ba.intravention.data         <- subset(ego_data_ba_only,
                                        select=c(nodrink.nodrugs.ind,
                                            nogroupsex.recode,
                                            en.condom.recode)
                                        )

  ## Month of interview data
     ba.month.of.intvw              <- ego_data_ba_only$int.date.month.new


############################################

  ## SUMMARIZE PU and BA data
     ## ses
     ## Numbers
      apply(pu.ses.data, 2, function(j)
          table(j, useNA="always")
            )

      apply(ba.ses.data, 2, function(j)
          table(j, useNA="always")
            )

      ## Proportions
      apply(pu.ses.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

      apply(ba.ses.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

     ## health    
     ## Numbers
      apply(pu.health.data, 2, function(j)
          table(j, useNA="always")
            )

      apply(ba.health.data, 2, function(j)
          table(j, useNA="always")
            )

      ## Proportions
      apply(pu.health.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )
      apply(ba.health.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

  ## sex.behav data 
     ## Numbers
      apply(pu.sex.behav.data, 2, function(j)
          table(j, useNA="always")
            )

      apply(ba.sex.behav.data, 2, function(j)
          table(j, useNA="always")
            )

      ## Proportions
      apply(pu.sex.behav.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

      apply(ba.sex.behav.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

  ## soc data 
     ## Numbers
      apply(pu.soc.data, 2, function(j)
          table(j, useNA="always")
            )

      apply(ba.soc.data, 2, function(j)
          table(j, useNA="always")
            )


      ## Proportions
      apply(pu.soc.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

      apply(ba.soc.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

  ## intravention data
      apply(pu.intravention.data, 2, function(j)
          table(j, useNA="always")
            )

      apply(ba.intravention.data, 2, function(j)
          table(j, useNA="always")
            )

      ## Proportions
      apply(pu.intravention.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

      apply(ba.intravention.data, 2, function(j)
          table(j, useNA="always")/sum(table(j, useNA="always"))
            )

  ## month of interview
     ## Numbers
      table(pu.month.of.intvw, useNA="always")
      table(ba.month.of.intvw, useNA="always")

      ## Proportions
      table(pu.month.of.intvw, useNA="always")/sum(table(month.of.intvw, useNA="always"))
      table(ba.month.of.intvw, useNA="always")/sum(table(month.of.intvw, useNA="always"))
