#Packages used:
library(dplyr)
library(tidyr)
library(ggplot2)

#Main function that returns completed chart
get_bar_chart <- function(input_data) {
  chart_data <- clean_data(input_data)
  final_bar_chart <- degree_bar_chart(chart_data)
  return(final_bar_chart)
}

#Clean data & set up for bar chart
clean_data <- function(input_df) {
  field_names <- input_df[2, 1:8]
  bar_chart_df <- input_df[3:18, 1:8]
  colnames(bar_chart_df) <- field_names
  bar_chart_df <- bar_chart_df %>%
    gather(key = field, value = percent, -Year) %>%
    group_by(field) %>%
    summarise(ave_percent = mean(as.numeric(percent), na.rm = TRUE)) %>%
    mutate(dec_percent = round(ave_percent, 2) / 100)
  return(bar_chart_df)
}

#Make Bar Chart
degree_bar_chart <- function(input_data) {
  degree_bar_chart <- ggplot(input_data) +
    geom_col(mapping = aes(
      x = field,
      y = dec_percent,
      fill = field)) +
    labs(
      title = "Women's share of S&E Bachelor's degrees 2000-2015",
      x = "Science & Engineering Fields",
      y = "Average Percent",
      fill = "Field Names"
    ) +
    geom_text(aes(
      label = paste0(round(dec_percent * 100, 0), " % "),
      x = field,
      y = dec_percent,
      vjust = - .5),
      size = 4) +
    scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank())
  return(degree_bar_chart)
}
