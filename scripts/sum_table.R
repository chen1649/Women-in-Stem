# summary table
library(dplyr)
library(readxl)
library(lintr)

# table one
# set up of dataframe
women_eng <- read.csv("data/Women in Software Engineering stats - Sheet1.csv",
                      stringsAsFactors = FALSE)

women_eng$num_eng <- as.numeric(gsub(",", "", women_eng$num_eng))

women_eng <- women_eng %>%
             select(company, num_female_eng, num_eng,
                    percent_female_eng, last_updated) %>%
             mutate(year = format(as.Date(
                    last_updated, format = "%Y-%m-%d"), "%Y"))

women_eng <- women_eng %>%
             filter(num_eng >= 100)

women_eng <- women_eng[-c(1), ]

# table 1

sum_table <- women_eng %>%
             select(company, num_female_eng, num_eng,
                    percent_female_eng, year) %>%
             group_by(year) %>%
             summarize("Women as Engineers(%)" = mean(percent_female_eng)) %>%
             filter(year != "2019")

# Table Two
# data clean up

field_grad <- read.csv("data/women_bachelor_stem.csv",
                       stringsAsFactors = FALSE)

colnames(field_grad) <- c("Year", "Biological/agricultural_sciences",
                         "Physical_sciences", "Mathematics/statistics", 
                         "Computer_sciences", "Engineering",
                         "Psychology", "Social sciences")

field_grad <- field_grad[-c(1:2), ]

# table 2
sum_table_two <- field_grad %>%
                 select(Year, Computer_sciences) %>%
                 group_by(Year) %>%
                 summarize("Graduated in Computer Science (%)"
                            = Computer_sciences)
 
# table three
# data set up
 
workforce <- read_excel("data/Women in STEM Labor data.xlsx")

workforce <- workforce[, -c(2, 7)]

colnames(workforce) <- c("Year", "Computer Occupation", "Engineers",
                         "Life/Physical Sciences", "Math Occupations",
                         "Social Science", "stem")

workforce$stem <- workforce$stem * 100

laborforce <- read.csv("data/female-labor-force-participation-OECD.csv",
                       stringsAsFactors = FALSE)

laborforce <- laborforce %>%
              select(Code, Year, X...) %>%
              filter(Code == "USA")

colnames(laborforce) <- c("Code", "Year", "Percent_Women")

labor_vs_stem <- inner_join(workforce, laborforce, by = "Year")

#table 3

table_3 <- labor_vs_stem %>%
           group_by(Year) %>%
           summarize("Women in Workforce" = Percent_Women,
                     "Women in STEM Occupations" = stem)
