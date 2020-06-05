library(ggplot2)
library(dplyr)
library(reshape2)

bincor <- c(NA, 5, 4, NA, NA, 5)
grpstring <- c(NA, 5, 4.5, 5, 4, 5)
mmpf <- c(NA, 5, NA, 5, 0, 1)
realvams <- c(NA, 2.5, 5, 5, 5, 5)
shadow <- c(5, 2.5, 2.5, 5, 4.5, 5)
coutryshapes <- c(0, NA, NA, NA, NA, 4.5)
tmvtnorm <- c(NA, 5, NA, NA, 2.5, 3)
mcmc <- c(NA, 1, NA, 0.5, NA, 4)
drawingdiagrams <- c(NA, 5, 3, 3, NA, 5)
geospatial <- c(1, 5, 4.5, 4.5, NA, 5)
rainbow <- c(NA, 3, 5, 5, NA, 5)
stplanr <- c(NA, NA, NA, 1, NA, 5)
rssampling <- c(NA, 5, NA, NA, 0.5, 5)
fixedpoint <- c(NA, 5, 5, 5, 5, 3.5)
nowcasting <- c(NA, 3.5, 4.5, 5, 5, 4)
rasterimages <- c(2.5, 1.5, 5, 3.5, 5, 4.5)
marks <- data.frame(t(data.frame(bincor, grpstring, mmpf, realvams, shadow, coutryshapes, tmvtnorm,
                                 mcmc, drawingdiagrams, geospatial, rainbow, stplanr, rssampling,
                                 fixedpoint, nowcasting, rasterimages)))
colnames(marks) <- c("ext_resources", "compatibility", "graphics", "add_config", "randomness", "availability")



marks %>%
  melt(id.vars = NULL) %>%
  group_by(variable) %>%
  mutate(n_checked = sum(!is.na(value))) %>%
  ggplot()+
  geom_boxplot(aes(x = variable, y = value, fill = cut(n_checked, c(3, 8, 9.5, 11, 13, 15, 17), labels = c(4, 9, 10, 12, 14, 16))),
               outlier.shape=NA)+
  geom_point(aes(x = variable, y = value), alpha = 0.4, size = 0.8)+
  theme_bw() +
  scale_fill_manual( values = c('#f0f9e8','#ccebc5','#a8ddb5','#7bccc4','#43a2ca','#0868ac'))+
  labs(fill = "Number of articles\nwith a mark",
       y = 'Marks distribution',
       title = 'Summary of marking the articles') +
  scale_x_discrete(name = 'Category',
                   limits = c('ext_resources', 'randomness', 'graphics', 'add_config', 'compatibility', 'availability'),
                   labels = c("External\nresources", "Resistance to\nrandomness", "Graphics", "Additional\nconfiguration",
                              "Compatibility with\nolder versions", "Code availability"))



