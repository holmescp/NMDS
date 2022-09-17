#Make a function called find_hull using the specified data
find_hull=function(nmds) nmds[chull(nmds$axis1,nmds$axis2), ] 

#n.nmds is the name of my data frame, $whatever is the column
library(plyr)
library(dplyr)
hulls=ddply(nmds,"group",find_hull)
palettegrey<-c("#CCCCCC","#999999","#666666")

#makes a new data frame using find_hull function on your data frame with the specified variable in a column
Nggplot(nmds,aes(x=axis1,y=axis2,color=group,fill=group)) + #This makes the initial equation for the plot
  #ggplot(dataframe,aes(x=columnname,y=columnname,color=as.factor(columnname),fill=as.factor(columnname)))
  geom_polygon(data=hulls,alpha=0.5) + # add the convex hulls for polygons, alpha changes the transparency
  #geom_text(data=mite.nmds,aes(x=axis1,y=axis2,label=sample),alpha=0.5,hjust=-0.25) +  # add the species labels
  geom_point(data=hulls,alpha=1) + # add the point markers
  coord_equal() +
  scale_fill_manual(values=c(palettegrey),name="Groups",labels=c("Female","Tritonymph","Male")) + 
  scale_color_manual(values=c(palettegrey),name="Groups",labels=c("Female","Tritonymph","Male")) +
  theme(axis.text=(element_text(size=10,color="black"))) +
  theme(panel.background=element_rect(fill="white",color="white")) +
  theme(axis.ticks=(element_line(color="black"))) +
  theme(axis.line=(element_line(color="black"))) +
  labs(x="\nNMDS 1",y="NMDS 2\n") 
