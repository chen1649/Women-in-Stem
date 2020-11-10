###Summary Takeaway
library(readxl)
library(dplyr)
lint("takeaway_server.R")
women_soft_eng <-
  read.csv("../data/Women in Software Engineering stats - Sheet1.csv")
women_in_stem <- read_excel("../data/Women in STEM Labor data.xlsx")
women_bachelor <- read.csv("../data/women_bachelor_stem.csv",
                           header = FALSE, skip = 2,
                           stringsAsFactors = FALSE)
server <- function(input, output) {
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
            `Social scientists` = (women_in_stem[6, 8] -
                                     women_in_stem[1, 8]) * 100,
            Stem = (women_in_stem[6, 9] - women_in_stem[1, 9]) * 100
  )
})
output$bachelor_table <- renderTable({
  women_bachelor %>%
    filter(V1 == 2015 | V1 == 2000 | V1 == "Year")
})
}
