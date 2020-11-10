# chart 3

#Packages used:
library(dplyr)
library(ggplot2)
library(tidyr)

#trend line in work force by stem field
final_trend_line <- function(put_df) {
  cleaned_df <- new_stem_df(put_df)
  make_trendline <- trend_line(cleaned_df)
  return(make_trendline)
}

#clean data
new_stem_df <- function(input_df) {
 clean_data <- input_df %>%
  select(`Year of Year`, `Computer occupations`, Engineers,
         `Life and physical scientists`, `Social scientists`,
         `Mathematics occupations`) %>%
  rename(year = `Year of Year`, comp_occupation = `Computer occupations`,
         lp_scientists = `Life and physical scientists`,
         social_scientist = `Social scientists`,
         math_occupations = `Mathematics occupations`)
  return(clean_data)
}

# Make trend Line
trend_line <- function(women_df) {
 trend_line <- ggplot(women_df, aes(x = year)) +
  geom_line(aes(y = comp_occupation, color = "Computer Occuppation")) +
  geom_line(aes(y = Engineers, color = "Engineers")) +
  geom_line(aes(y = lp_scientists, color = "Life and Physical Scientists")) +
  geom_line(aes(y = social_scientist, color = "Social Scientists")) +
  geom_line(aes(y = math_occupations, color = "Math Occupations")) +
  labs(
    title = "Trend Line of Women in STEM Occupations in the U.S (1970-2019)",
    x = "Year",
    y = "Percent of Women (in Decimal)",
    colour = "Occupations"
         )
 return(trend_line)
}

