library(plotly)
library(tidyverse)
library(dplyr)
library(ggplot2)

degree_df <- read.csv("data/women_bachelor_stem.csv",
                      stringsAsFactors = FALSE, header = FALSE)

#Clean data
clean_data <- function(degree_df) {
  colnames(degree_df) <- degree_df[3, ]
  clean_df <- degree_df[4:19, ]
  clean_df <- clean_df %>%
    gather(key = field, value = percent, -Year)
  return(clean_df)
}

#Chart that shows all years for a select field
field_chart <- function(degree_df, field_choice) {
  bar_chart_df <- clean_data(degree_df)
  bar_chart_df <- bar_chart_df %>%
    filter(field == field_choice) %>% #further manipultion based on input
    mutate(dec_percent = round(as.numeric(percent), 2) / 100)

  field_bar_chart <- ggplot(bar_chart_df) +
    geom_col(mapping = aes(
      x = Year,
      y = dec_percent,
      color = Year,
      text = paste0(percent, "%"))) +
    labs(
      title = paste("Women's share of", field_choice,
                    "Bachelor's degrees 2000 - 2015"),
      x = "Year",
      y = "Percent"
    ) +
    theme(
      legend.position = "none"
    ) +
    scale_y_continuous(labels = scales::percent, limits = c(0, 1))
  field_bar_chart <- ggplotly(field_bar_chart, tooltip = "text")
  return(field_bar_chart)
}

#Chart that shows all fields for a select year
year_chart <- function(degree_df, year_choice) {
  bar_chart_df <- clean_data(degree_df)
  bar_chart_df <- bar_chart_df %>%
    filter(Year == year_choice) %>% #further manipulation based on input
    mutate(dec_percent = round(as.numeric(percent), 2) / 100)

  year_bar_chart <- ggplot(bar_chart_df) +
    geom_col(mapping = aes(
      x = field,
      y = dec_percent,
      fill = field,
      text = paste0(percent, "%"))) +
    labs(
      title = paste("Women's share of S&E Bachelor's degrees in",
                    year_choice),
      x = "Science & Engineering Fields",
      y = "Percent"
    ) +
    scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank(),
          legend.title = element_blank())
  year_bar_chart <- ggplotly(year_bar_chart, tooltip = "text")
  return(year_bar_chart)
}

#Chart that shows the average percent of each field
average_chart <- function() {
  ave_chart_df <- clean_data(degree_df) %>%
    group_by(field) %>%
    summarise(ave_percent = mean(as.numeric(percent), na.rm = TRUE)) %>%
    mutate(dec_percent = round(ave_percent, 2) / 100)

  average_bar_chart <- ggplot(ave_chart_df) +
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
  return(average_bar_chart)
}
