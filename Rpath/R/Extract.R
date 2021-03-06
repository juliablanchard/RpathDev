#'Extract node data
#'
#'Creates a list object with node specific data using Rsim.output object.
#'
#'@family Rpath functions
#'
#'@param Rsim.output Object generated by rsim.run.
#'@param group Name of the node for which you want to extract data.
#'
#'@return Returns a list object with node specific data.
#'@export 
extract.node <- function(Rsim.output, group){
  #Determine which group number cooresponds to the node
  groupnum <- which(Rsim.output$params$spname == group)
  
  #Create basic monthly and annual data
  node.out <- c()
  node.out$Biomass          <- Rsim.output$out_BB[, groupnum]
  node.out$AnnualBiomass    <- Rsim.output$annual_BB[, groupnum]
  node.out$TotalCatch       <- Rsim.output$out_CC[, groupnum]
  node.out$AnnualTotalCatch <- Rsim.output$annual_CC[, groupnum] 
  
  #Create gear specific data
  node.out$Landings <- data.table(Total = rep(0, nrow(Rsim.output$out_Gear_CC)))
  node.out$Discards <- data.table(Total = rep(0, nrow(Rsim.output$out_Gear_CC)))
  
  #Determine if there are any fishing links to populate the tables
  fishlinks <- which(Rsim.output$Gear_CC_sp == group) 
  if(length(fishlinks) > 0){
    #Set up Landings Table
    landings <- which(Rsim.output$Gear_CC_disp[fishlinks] == 'Landing')
    if(length(landings) > 0){
      for(i in 1:length(landings)){
        gear.land <- Rsim.output$out_Gear_CC[, fishlinks[landings[i]]]
        node.out$Landings <- cbind(node.out$Landings, gear.land)
        setnames(node.out$Landings, 'gear.land', Rsim.output$Gear_CC_gear[fishlinks[i]])
      }
      #Total all landings
      col.names <- names(node.out$Landings)
      node.out$Landings[ , Total := rowSums(.SD), .SDcols = col.names]
    }
    #Set up Discards Table
    discards <- which(Rsim.output$Gear_CC_disp[fishlinks] == 'Discard')
    if(length(discards) > 0){
      for(i in 1:length(discards)){
        gear.disc <- Rsim.output$out_Gear_CC[, fishlinks[discards[i]]]
        node.out$Discards <- cbind(node.out$Discards, gear.disc)
        setnames(node.out$Discards, 'gear.disc', Rsim.output$Gear_CC_gear[fishlinks[i]])
      }
      #Total all landings
      col.names <- names(node.out$Discards)
      node.out$Discards[ , Total := rowSums(.SD), .SDcols = col.names]
    }
  }
  return(node.out)
  }