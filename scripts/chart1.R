#Packages used:
#library(dplyr)
#library(tidyr)
#library(ggplot2)

#Main function that returns completed chart
get_scatter_plot <- function(input_data) {
  final_scatter_plot <- engineer_scatter_plot(input_data)
  return(final_scatter_plot)
}


#Make Scatter Plot
engineer_scatter_plot <- function(input_data){
  engineer_scatter_plot <- ggplot(
    input_data, 
    aes(
      x = num_eng,
      y = percent_female_eng,
      color = percent_female_eng,
      label = company
    )
  ) +
    geom_point(size = 1) +
    labs(
      title = "Percent of Women Engineers in Software Engineering Companies",
      x = "Total Number of Engineers",
      y = "Percent",
      color = "Percent Female Engineers Key"
    ) + 
    geom_text(
      check_overlap = TRUE,
      size = 1.5,
      color = "Red",
      fontface = "bold"
    ) +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank())
  
  return(engineer_scatter_plot)
}


