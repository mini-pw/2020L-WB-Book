chnk <- read.csv("chunks.csv")
grp <- read.csv("groups.csv")
art <- read.csv("articles.csv")



non_zero_mean <- function(vektor){
  tmp <- vektor[vektor!=0]
  return(mean(tmp))
}




# table of chuncks
purpose <- chnk[,c(-1, -2)]*1            # we get rig of unnesesery columns and multyply by 1 to
DataExplorer::plot_correlation(purpose)                           # convert logical into numeric


reproducibility <- chnk[chnk$reproducibility.scale != -1,c(-1, -17)] * 1 # we get rid of "uncallable.code",
                                                                           # becouse it has reproducibility of -1

tmp <- (reproducibility[,-1]*1 %*% reproducibility[,1]) %>%
          sapply(non_zero_mean) %>% as.data.frame()
colnames(tmp) <- "correlation_with_reproducibility"
tmp$ID <- rownames(tmp)

tmp %>% 
  ggplot(aes(x=reorder(ID, correlation_with_reproducibility), y=correlation_with_reproducibility, fill="red")) +
  geom_col(stat="identity") +
  theme(axis.text.x = element_text(size = 12, angle = 90, vjust=0.5), legend.position='none') +
  xlab("purpose of chunk") + ylab("mean reproducibility")





tmp <- (chnk[,c(-1,-2)]*1 %*% chnk[,1]) %>%
        sapply(non_zero_mean) %>% as.data.frame()
colnames(tmp) <- "length"
tmp$ID <- rownames(tmp)
tmp %>%
  ggplot(aes(x=reorder(ID, length, desc), y=length, fill = "Red")) +
  geom_col(stat="identity") +
  theme(axis.text.x = element_text(size = 12, angle = 90, vjust=0.5), legend.position='none') +
  xlab("purpose of chunk") + ylab("mean length")





# table of groups
purpose <- grp[,c(-1)]*1
DataExplorer::plot_correlation(purpose)



tmp <- (grp[,c(-1)]*1 %*% chnk[,1]) %>% sapply(non_zero_mean) %>% as.data.frame()
colnames(tmp) <- "length"
tmp$ID <- rownames(tmp)
tmp %>%
  ggplot(aes(x=reorder(ID, length, desc), y=length, fill = "Red")) +
  geom_col(stat="identity") +
  theme(axis.text.x = element_text(size = 12, angle = 90, vjust=0.5), legend.position='none') +
  xlab("purpose of chunk") + ylab("mean length")




# table of articles
purpose <- art[,c(-1)]*1
DataExplorer::plot_correlation(purpose)



tmp <- (art[,c(-1)]*1 %*% art[,1]) %>% sapply(non_zero_mean) %>% as.data.frame()
colnames(tmp) <- "length"
tmp$ID <- rownames(tmp)
tmp %>%
  ggplot(aes(x=reorder(ID, length, desc), y=length, fill = "Red")) +
  geom_col(stat="identity") +
  theme(axis.text.x = element_text(size = 12, angle = 90, vjust=0.5), legend.position='none') +
  xlab("purpose of chunk") + ylab("mean length")


