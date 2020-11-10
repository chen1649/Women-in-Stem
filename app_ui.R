library(shiny)
library(shinythemes)
source("scripts/overview_page.R")
source("scripts/interactive_3.R")
source("scripts/education_page.R")
source("scripts/takeaway_ui.R")
source("scripts/engineering_page.R")


ui <- navbarPage(
          "final",
          theme = shinytheme("superhero"),
          overview_panel,
          engineer_panel,
          education_panel,
          chart3_panel,
          summary_takeaway
)
