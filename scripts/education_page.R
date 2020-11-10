library(shinyWidgets)
library(plotly)

#To pick which chart is to be shown
degree_chart_type <- prettyRadioButtons(
  inputId = "chart_type",
  label = h4("Chart Type"),
  choices = list("Show all years for a select field",
                 "Show all fields for a select year"),
  selected = "Show all years for a select field"
)

#Condition to pick a select year (and show all fields)
year_condition <- conditionalPanel(
  condition = "input.chart_type == 'Show all fields for a select year'",
  sliderTextInput(
    inputId = "year_choice",
    label = h4("Year of Interest"),
    choices = c(2000:2015),
    selected = "2000"
  )
 )

#Condition to pick a select field (and show all years)
field_condition <- conditionalPanel(
  condition = "input.chart_type == 'Show all years for a select field'",
  selectInput(
    inputId = "field_choice",
    label = h4("Field of Interest"),
    choices = list("Physical sciences", "Biological and agricultural sciences",
                   "Mathematics and statistics", "Computer sciences",
                   "Psychology", "Social sciences", "Engineering")
  )
)

#Tab that has the interactive bar graphs w/ widgets
interactive_tab <- tabPanel("Interactive Bar Graph",
                     sidebarLayout(
                       sidebarPanel(
                         degree_chart_type,
                         year_condition,
                         field_condition
                       ),
                       mainPanel(
                         plotlyOutput("degree_chart")
                       )
                     )
                    )

#Tab showing the averages graph
average_tab <- tabPanel(
                "Averages Graph",
                plotOutput("degree_ave_chart")
               )

#Link to website listing progrmas helping women in STEM
stem_pro <- tags$a(href =
  "https://girlswhostem.com/best-stem-organizations-for-girls-and-women/",
  "Programs helping women in STEM")

#Tab with justification/insights for all of the charts
sum_info_tab <- tabPanel("Insights",
                         mainPanel(
                           p(h4("STEM Field Popularity")),
                           p("These bar charts help show an overview of women's
                             participation in education in STEM fields
                             from 2000- 2015. While the percentage of women in
                             STEM in education and the
                             workforce has been growing overall, there are
                             still major differences between the individual
                             fields, and some fields have seen very little
                             growth. Most of these fields percentage rates
                             have fluctuated within 3% from 2000 - 2015. During
                             this 15 year period,Pyschology and
                             Biological/Agricultural sciences stayed the most
                             popular fields, while Computer sciences and
                             Engineering were the least popular. On average,
                             women have earned more
                             than 50% of the bachelor's degrees in Psychology,
                             Biological/Agricultural sciences, and Social
                             sciences; however, they are only earning an
                             average of 21% of Computer science degrees. This
                             highlights the fact that there is still a huge
                             gender gap in the CS field. Over the 15 year
                             period, CS has seen the biggest decline, with a
                             8% drop in bachelor's degrees received. This also
                             shows up in the Engineering field, where women are
                             only earning an average of 20% of the degrees."
                           ),
                           width = 6
                         ),
                         mainPanel(
                           p(h4("Future Predictions")),
                           p("This data shows that not all STEM fields have
                             been having participation by women grow over the
                             past decade, and there are still big gender gaps.
                             While the future for growth in certain
                             fields looks bleak based on this data, there is
                             still hope. With the continued growth of STEM
                             fields in general, more programs are being
                             introduced into the education system to help
                             boost participation by women, especially in the
                             computer science field."),
                           stem_pro,
                           width = 6
                         )
                )

education_panel <- tabPanel("Education",
                     p(h2("Women's Education in STEM Fields",
                          align = "center")),
                     tabsetPanel(
                       interactive_tab,
                       average_tab,
                       sum_info_tab
                     )
                   )
