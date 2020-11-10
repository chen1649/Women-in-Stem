# Kajal
# 1 - num engineers,  When looking at the number of engineers a company has
#     are women equally represented? how does this differ from small to 
#     larger based companies?

library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)
library(tidyr)
library(readxl)

engineering_df <- read.csv("data/Women in Software Engineering stats - Sheet1.csv", stringsAsFactors = FALSE)

#function that returns completed chart
get_scatter_plot <- function(input_data) {
  final_scatter_plot <- engineer_scatter_plot(input_data)
  return(final_scatter_plot)
}

#Make Scatter Plots
#Female Engineer Scatter plot
female_eng_scatter_plot <- function(input_data, input_select){
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
    theme(axis.text.x = element_blank())
  
  return(engineer_scatter_plot)
}
#Male Engineer Scatter Plot
male_eng_scatter_plot <- function(input_data, input_select){
  engineer_scatter_plot <- ggplot(
    input_data, 
    aes(
      x = num_eng,
      y = 100 - percent_female_eng,
      color = (100 - percent_female_eng),
      label = company
    )
  ) +
    geom_point(size = 1) +
    labs(
      title = "Percent of Male Engineers in Software Engineering Companies",
      x = "Total Number of Engineers",
      y = "Percent",
      color = "Percent Male Engineers Key"
    ) + 
    geom_text(
      check_overlap = TRUE,
      size = 1.5,
      color = "Red",
      fontface = "bold"
    ) +
    theme(axis.text.x = element_blank())
  
  return(engineer_scatter_plot)
}
#Percent of female engineers versus the number of female engineers
f_v_f_eng_scatter_plot <- function(input_data, input_select){
  engineer_scatter_plot <- ggplot(
    input_data, 
    aes(
      x = num_female_eng,
      y = percent_female_eng,
      color = (percent_female_eng),
      label = company
    )
  ) +
    geom_point(size = 1) +
    labs(
      title = "Percent of Female Engineers versus Total Number of Female Engineers in Software Engineering Companies",
      x = "Total Number of Female Engineers",
      y = "Percent",
      color = "Percent Female Engineers Key"
    ) + 
    geom_text(
      check_overlap = TRUE,
      size = 1.5,
      color = "Red",
      fontface = "bold"
    ) +
    theme(axis.text.x = element_blank())
  
  return(engineer_scatter_plot)
}




