library(tidyverse)
library(treemapify)

# https://cran.r-project.org/web/packages/treemapify/vignettes/introduction-to-treemapify.html
# https://r-charts.com/part-whole/treemapify/

# get df
group <- paste("Group", 1:9)
subgroup <- c("A", "C", "B", "A", "A",
              "C", "C", "B", "B")
value <- c(7, 25, 50, 5, 16,
           18, 30, 12, 41)

df <- data.frame(group, subgroup, value) 
df


#///////////////////////////////////////


# plot with color based on values
ggplot(df, aes(area = value, fill = value, label = group)) +
        geom_treemap() +
        geom_treemap_text(colour = "white",
                          place = "centre",
                          size = 15, 
                          grow = TRUE)


# plot with color based on arbitrary discrete values
ggplot(df, aes(area = value, fill = group, label = value)) +
        geom_treemap() +
        geom_treemap_text(colour = "white",
                          place = "centre",
                          size = 15) +
        scale_fill_brewer(palette = "Blues")

# plot with subgroups/text overlays
ggplot(df, aes(area = value, fill = value,
               label = group, subgroup = subgroup)) +
        geom_treemap() +
        geom_treemap_subgroup_border(colour = "white", size = 5) +
        geom_treemap_subgroup_text(place = "centre", grow = TRUE,
                                   alpha = 0.25, colour = "black",
                                   fontface = "italic") +
        geom_treemap_text(colour = "white", place = "centre",
                          size = 15, grow = TRUE)
