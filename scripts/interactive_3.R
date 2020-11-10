# Vivian
# 3 - participation in stem workforce, How are women
# within stem careers spread?
# Are some disproportionate?
# Does the data show some gender disparities still? if so How?
library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)
library(tidyr)
library(readxl)

chart_3 <- tabsetPanel(type = "tab",
            tabPanel("Interactive Data",
            sidebarLayout(sidebarPanel(width = 3,
              selectInput("occupations", "Occupation of Interest",
              choices = c("Computer", "Engineers",
                          "Life and Physical Scientists",
                          "Social Scientists", "Math"),
                          selected = "Computer")
                           ),
              mainPanel(
              plotlyOutput("trendline")
              )
            )
          ),
              tabPanel("Data", tableOutput("data")),
              tabPanel("Insights", 
                       p(h2("Women in STEM Occupations")),
                       textOutput("insights"))
)
chart3_panel <- tabPanel(
   "Occupation Trend Line", chart_3,
   )

stem_df <- read_excel("data/Women in STEM Labor data.xlsx")
# Cleaned data for chart
data_chart <- function(input_df) {
  clean_data <- input_df %>%
    select(`Year of Year`, `Computer occupations`, Engineers,
           `Life and physical scientists`, `Social scientists`,
           `Mathematics occupations`) %>%
    rename(year = `Year of Year`, computer = `Computer occupations`,
           lp_scientists = `Life and physical scientists`,
           social_scientist = `Social scientists`,
           math = `Mathematics occupations`)
  return(clean_data)
}

# trend line in work force by stem field
final_trend_line <- function(put_df, choice) {
  cleaned_df <- new_stem_df(put_df, choice)
  make_trendline <- trend_line(cleaned_df)
  return(make_trendline)
}

# clean data
new_stem_df <- function(input_df, choice) {
  clean_data <- input_df %>%
    select(`Year of Year`, `Computer occupations`, Engineers,
           `Life and physical scientists`, `Social scientists`,
           `Mathematics occupations`) 
  
  colnames(clean_data) <- c("year", "Computer", "Engineers", 
                            "Life and Physical Scientists",
                            "Social Scientists", "Math")
  clean_data <- clean_data %>%
    gather(key = occupation, value = percent, -year) %>%
    filter(occupation == choice)
  
  return(clean_data)
}

# Make trend Line
trend_line <- function(women_df) {
  trend_line <- ggplot(women_df, aes(x = year, y = percent)) +
    geom_line() +
    labs(
      title = "Trend Line of Women in STEM Occupations in the U.S (1970-2019)",
      x = "Year",
      y = "Percent of Women (in Decimal)"
    )
  trend_line <- ggplotly(trend_line, tooltip = "text")
  return(trend_line)
}
