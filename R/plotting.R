
#' A dotplot function
#'
#' This function plots a dotplot.
#'
dotplot_genes <- function(sel_groups, sel_genes, gene_col, data, log2y=TRUE) {
  datalong <- get_count_data_long(groupvec = sel_groups, id_vars = gene_col, data = data)
  #Need to adapt to allow for counts OR rpkm data OR cpms
  datalong$gene <- datalong[,gene_col]
  subdat <- datalong%>%dplyr::filter(gene%in%sel_genes)
  if(log2y) {
    subdat$y = log2(subdat$Count)
    ylab <- "log2(Count)"
  }else{
    subdat$y = subdat$Count
    ylab = "Count"
  }

  p <- ggplot(subdat,aes(x=Group,y=y,fill=Group)) +
    ggplot2::geom_boxplot()+
    ggplot2::ylab(ylab)+
    ggplot2::facet_grid(~gene,scales="free_y") +
    ggplot2::geom_point(size=3)+
    ggplot2::stat_summary(fun.y=mean, geom="point", shape=5, size=3)+
    ggplot2::scale_fill_discrete(name="Group",breaks=sort(sel_groups),
                        labels=sel_groups,
                        guide=ggplot2::guide_legend(keyheight=4,keywidth=2))+
    ggplot2::theme_bw(base_family="mono") +
    ggplot2::theme(
      plot.title=element_text(face="bold",size = rel(2)),
      strip.text = element_text(face="bold",size=rel(2)),
      strip.background=element_rect(fill="lightgrey"),
      axis.title = element_text(size=rel(2),color="blue"),
      axis.text = element_text(size=rel(2)),
      legend.text=element_text(size=rel(2)),
      legend.title=element_text(size=rel(2)),
      legend.position="bottom",legend.direction="vertical"
    )+
    ggplot2::guides(fill = ggplot2::guide_legend(nrow = 3))

  print(p)
}
