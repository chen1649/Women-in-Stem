# summary info
library(readxl)
library(lintr)
##Women in Software Engineering stats
women_software_engineer <-
  read.csv("data/Women in Software Engineering stats - Sheet1.csv",
           stringsAsFactors = FALSE)
women_in_stem <- read_excel("data/Women in STEM Labor data.xlsx",
                            col_names = TRUE)

get_info_female_eng <- function(df) {
  info <- list()
  info$mean_percent_female_eng <- mean(df$percent_female_eng)
  info$highest_percent_female_eng <- max(df$percent_female_eng)
  info$lowest_percent_female_eng <- min(df$percent_female_eng)
  info$company_most_female_eng <- df[df$percent_female_eng == "100", "company"]
  info$company_least_female_eng <- df[df$percent_female_eng == "0", "company"]
  return(info)
}
women_software_eng_info <- get_info_female_eng(women_software_engineer)
##Women in STEM Labor Data
get_info_women_stem <- function(df) {
  info <- list()
  info$max_percent_female_cs <- max(df$`Computer occupations`)
  info$year_max_percent_female_cs <-
    df[df$`Computer occupations` == "0.34", "Year of Year"]
  info$max_percent_female_eng <- max(df$Engineers)
  info$year_max_percent_female_eng <-
    df[df$Engineers == "0.16", "Year of Year"]
  info$mean_percent_female_stem <- mean(df$Stem)
  info$increase_in_female_stem <-
    df[6, "Stem"] - df[1, "Stem"]
  return(info)
}
women_stem_info <- get_info_women_stem(women_in_stem)

