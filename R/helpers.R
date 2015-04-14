#' Retrieve the counts from a data set.
#'
#' This function retrieves a data set containing the vectors of counts and
#' selected gene identifiers.
#' @param groupvec a character vector of group names (i.e. tissue type), assuming
#' column names of counts include these characters
#' @param id_vars a character vector of gene identifier column names
#' @param data a data frame that includes counts and gene identifiers
#' @examples
#' mycounts <- get_count_data(groupvec=c("tissueA","tissueB","tissueC"),data=countdata, id_vars)
#' head(mycounts)
get_count_data <- function(groupvec, id_vars, data) {
  ind_group <- lapply(groupvec,function(k) grep(k,colnames(data)))
  ind_group_all <- unlist(ind_group)
  if(length(ind_group_all)==0) stop("Items in groupvec do not match column names")
  datacounts <- data[,c(match(id_vars,colnames(data)),ind_group_all)]
  return(datacounts)
}

#' Creates long format count data.
#'
#' @param groupvec a character vector of group names (i.e. tissue type), assuming
#' column names of counts include these characters
#' @param id_vars a character vector of gene identifier column names
#' @param data a data frame that includes counts and gene identifiers
#' @examples
#' mycountslong <- get_count_data_long(groupvec=c("tissueA","tissueB","tissueC"),data=countdata, id_vars = c("Geneid","MGIID","Chr"))
#' head(mycountslong)
get_count_data_long <- function(groupvec, id_vars, data) {
  datacounts <- get_count_data(groupvec, id_vars, data)
  datacountlong <- datacounts%>%reshape2::melt(id.vars=id_vars,value.name="Count",variable.name="Sample")
  datacountlong <- datacountlong%>%tidyr::separate(Sample,c("Group","SampleNum"))
  datacountlong
}
