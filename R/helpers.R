#' Retrieve the counts from a data set.
#'
#' This function retrieves a data set containing the vectors of counts and
#' one gene identifier.
#' @examples
#' mycounts <- get_count_data(groupvec=c("tissueA","tissueB","tissueC"),data=countdata, geneid_ind=1)
#' head(mycounts)
get_count_data <- function(groupvec, data, geneid_ind=1) {
  ind_group <- lapply(groupvec,function(k) grep(k,colnames(data)))
  ind_group_all <- unlist(ind_group)
  if(length(ind_group_all)==0) stop("Items in groupvec do not match column names")
  datacounts <- dplyr::bind_cols(data%>%select(geneid_ind),data[,ind_group_all])
  colnames(datacounts)[1] = "geneid"
  return(datacounts)
}

