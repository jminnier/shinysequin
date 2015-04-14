#' Example RNA-Seq count data.
#'
#' A dataset containing the RNA-Seq counts, a typical output of
#' RNA-Seq bioinformatics algorithms. Each row is a gene identifier and each
#' sample is represented by a column. Some gene information (various IDs,
#' chromosome, start and end positions, etc.) is provided.
#'
#' @format  A data frame with 18094 rows and 17 variables:
#' \describe{
#'  \item{Geneid}{ensembl gene ID}
#'  \item{MGIID}{MGI ID}
#'  \item{MGIsymbol}{MGIsymbol}
#'  }
#'
"countdata"
