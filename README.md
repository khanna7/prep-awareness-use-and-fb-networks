# prep-awareness-use-and-fb-networks
Code repository for PrEP awareness and FB networks

## Local Repository location
`/home/khanna7/Projects/UConnect/UConnect_FB/w1_w2_com_respondents_from_igraph/prep-awareness-use-and-fb-networks`

## File ordering  
   * List persistently unaware (PU) and became aware (BA) individuals amongst the 266 common respondents: `list-pu-and-ba-on-266-com-fb-respondents.R`
   * Compute descriptives of these 266 participants, and compute summary statistics on their overall FB networks: `descriptives-on-266-com-fb-respondents.R`
   * Constrain the FB networks by city and sex (male): `total-fb-friendships-pers-unaware-and-bec-aware.R`. (Also contains code for overall FB network sizes of PU's and BA's at Waves 1 and 2. Results agree with `thresholds-for-prep-adoption.R` below). 
   * Some nearest neighbor properties: `pu-vs-ba-nrst-nghbrs.R`
   * Compute number and % of friends (of 266 common participants) who are PrEP-aware and PrEP-using: `thresholds-for-prep-adoption.R`  
   * Visualize Wave 1 and Wave 2 networks with fixed coordinates at baseline and followup: `visualize-pu-and-ba.R`
   * (Old visualization, not relevant: `visualization.R`)
   
### To add more properties to the network, go to `../w1_w2_com_respondents_from_igraph/w1_com_resp_r0_analysis/correlate_pca_outcome.R`

## CAUTION
   The first item in the list returned byt he `neighborhood` function in igraph, is the node whose neighborhood is being computed. 
