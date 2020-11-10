library(shiny)
library(ggplot2)
library(plotly)

source("scripts/overview_page.R")
source("scripts/interactive_1.R")
source("scripts/interactive_3.R")
source("scripts/interactive_2.R")
women_soft_eng <- read.csv(
                  "data/Women in Software Engineering stats - Sheet1.csv")
women_in_stem <- read_excel("data/Women in STEM Labor data.xlsx")
women_bachelor <- read.csv("data/women_bachelor_stem.csv",
                           header = FALSE, skip = 2,
                           stringsAsFactors = FALSE)

server <- function(input, output) {
          output$grace <- renderImage({
            filename <- normalizePath(file.path("imgs",
                              paste("grace", input$n, ".jpg", sep = "")))
            list(src = filename)
          }, deleteFile = FALSE)
          output$katherine <- renderImage({
            filename <- normalizePath(file.path("imgs",
                              paste("katherine", input$n, ".jpg", sep = "")))
            list(src = filename)
          }, deleteFile = FALSE)
          output$marie <- renderImage({
            filename <- normalizePath(file.path("imgs",
                              paste("marie", input$n, ".jpg", sep = "")))
            list(src = filename)
          }, deleteFile = FALSE)

          # Trend line
          output$trendline <- renderPlotly(
            final_trend_line(stem_df, input$occupations)
          )
          # data table
          output$data <- renderTable({
            data_chart(stem_df)
          })
          # insights
          output$insights <- renderText("This trend line shows the percentages
                              (in decimal) of women within different STEM
                              occupations in the U.S from 1970-2019. Overall,
                              most of the occupations are trending upward
                              throughout the years. Computer occupations
                              have been trending downward since 1990.
                              Out of all them we can see the least
                              participation in Engineering and the
                              most in Social Sciences.")

          #Bar charts for education page
          output$degree_chart <- renderPlotly({
            if (input$chart_type == "Show all fields for a select year") {
              return(year_chart(degree_df, input$year_choice))
            }else{
              return(field_chart(degree_df, input$field_choice))
            }
          })
          #Averages chart for education page
          output$degree_ave_chart <- renderPlot({
            return(average_chart())
          })

          output$companies_more_soft_eng <- renderTable({
            women_soft_eng %>%
              slice(-1) %>%
              filter(num_eng >= 100) %>%
              summarize(mean_perc_female_eng = mean(percent_female_eng))
          })
          output$companies_less_soft_eng <- renderTable({
            women_soft_eng %>%
              slice(-1) %>%
              filter(num_eng < 100) %>%
              summarize(mean_perc_female_eng = mean(percent_female_eng))
          })
          output$stem_table <- renderTable({
            women_in_stem %>%
              summarize(`Computer occupations` = (women_in_stem[6, 3]
                                                  - women_in_stem[1, 3]) * 100,
                        Engineers = (women_in_stem[6, 4]
                                     - women_in_stem[1, 4]) * 100,
                        `Life and physical scientists` = (women_in_stem[6, 5]
                                                          - women_in_stem[1, 5]) * 100,
                        `Mathematics occupations` = (women_in_stem[6, 6]
                                                     - women_in_stem[1, 6]) * 100,
                        `Social scientists` = (women_in_stem[6, 8] - women_in_stem[1, 8]) * 100,
                        Stem = (women_in_stem[6, 9] - women_in_stem[1, 9]) * 100
              )
          })
          output$bachelor_table <- renderTable({
            women_bachelor %>%
              filter(V1 == 2015 | V1 == 2000 | V1 == "Year")
          })
          output$scatter_plot <- renderPlotly({
            if (input$input_select == "Percent of Female Engineers versus Total Number of Engineers") {
              return(female_eng_scatter_plot(engineering_df, input$input_select))
            }else if (input$input_select == "Percent of Male Engineers versus Total Number of Engineers") {
              return(male_eng_scatter_plot(engineering_df, input$input_select))
            }else{
              return(f_v_f_eng_scatter_plot(engineering_df, input$input_select))
            }
          })
          output$eng_data_sum <- renderTable({
            women_eng <- women_soft_eng %>%
              select(company, num_female_eng, num_eng,
                     percent_female_eng, last_updated) %>%
              mutate(year = format(as.Date(
                last_updated, format = "%m/%d/%y"), "%Y"))

            women_eng <- women_eng %>%
              filter(num_eng >= 100)

            women_eng <- women_eng[-c(1), ]

            sum_table <- women_eng %>%
              select(company, num_female_eng, num_eng,
                     percent_female_eng, year) %>%
              group_by(year) %>%
              summarize("Women as Engineers(%)" = mean(percent_female_eng)) %>%
              filter(year != "2019")

            return(sum_table)
           })

}

