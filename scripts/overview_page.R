library(shiny)
library(lintr)

sidebar_content <- sidebarPanel(
                    h3("Notable Women"),
                    br(),
                    h4(p("Grace Hopper")),
                    imageOutput("grace",
                                width = "196px",
                                height = "257px"),
                    p("Grace was a computer scientist in the navy who invented
                      an improved compiler and then went on to create the first
                      English language data compiler with her division."),
                    tags$a(href = "https://www.britannica.com/biography/Grace-Hopper"
                           , "Learn more"),
                    br(),
                    br(),
                    h4(p("Katherine Johnson")),
                    imageOutput("katherine",
                                width = "201px",
                                height = "251px"),
                    p("Katherine was a mathematician who's worked made it
                      possible for the US to send a man in orbit around the
                      earth and got the US further into the international
                      space race."),
                    tags$a(href = "https://www.nasa.gov/content/katherine-johnson-biography"
                           , "Learn more"),
                    br(),
                    br(),
                    h4(p("Marie Curie")),
                    imageOutput("marie",
                                width = "186px",
                                height = "271px"),
                    p("Marie was a pioneer in radioactivity, which led to
                      advancements in science. She was awarded two Nobel
                      prizes in physics and chemistry."),
                    tags$a(href = "https://www.britannica.com/biography/Marie-Curie"
                           , "Learn more")
)



main_content <- mainPanel(
                  h1("Our Research"),
                  p("In our generation, we have seen the rise of STEM-related
                   careers and a growing interest from schools to support them.
                   But in the past, it has been seen as mainly a sector for
                   males, however, this is changing as more programs and
                   organizations are being created to encourage young girls to
                   get involved and find a passion for it. Our project looks
                   into the statistics of women pursuing these careers
                   through schooling and those within the STEM workforce."),
                  br(),
                  tags$blockquote("Diversity drives innovation -
                           when we limit who can contribute,
                           we in turn limit what problems we can solve.
                           - Telle Whitney"),
                  br(),
                  h2("Data Sets and Questions"),
                  tags$a(href = "https://github.com/alison985/women-in-tech-datasets/blob/master/datasets/company_coder_gender_stats/2016-03-18-women_in_software_engineering_stats.csv"
                         , "Engineers Data"),
                  p("This data set looks at a range of companies and how many
                   engineers they employ. It contains both small startups to
                   more well-known companies such as Wells Fargo. Using this
                   data set we can compare the number of women employed as
                   engineers to the total number of engineers to
                   answer these questions:"),
                  p(strong("- When looking at the number of engineers a
                          company has are women equally represented?")),
                  p(strong("- How does this differ from small to
                          larger based companies?")),
                  p(strong("- Is there evidence that it is improving? How?")),
                  br(),
                  tags$a(href = "https://www.nsf.gov/statistics/2018/nsb20181/report/sections/higher-education-in-science-and-engineering/undergraduate-education-enrollment-and-degrees-in-the-united-states?fbclid=IwAR3u37RvFzkKV71x4dYlMxageo5LIAWGUKSlMrU0pbIJkH__7JFXGpc2O00)"
                         , "Graduates Data"),
                  p("Women going to college are pursuing more degrees within
                   the STEM category, this data shows the percent of women
                   graduating with degrees that fit under the STEM fields. It
                   spans over the first fifteen years of the twenty-first
                   century, showing the percentage of women graduating
                   with a degree compared to the whole.
                   Using this data set we can answer:"),
                  p(strong("- What are the most/ least popular stem fields
                            female graduates are coming out with?")),
                  p(strong("- Do we foresee potential growth in the
                                  future based on the data?")),
                  br(),
                  tags$a(href = "https://www.dol.gov/agencies/wb/data/facts-over-time/women-in-the-labor-force?fbclid=IwAR1myw6ytyR83MC__0T-NebIDTVzCXVbJ1NnZZlW2BjHwl0TDNI5YbzEK6Y#womenstem"
                         , "Workforce Data"),
                  p("This data shows how many women are employed in careers
                   that are under the umbrella of STEM. It spans from the
                   year 1970 to 2018, showing the percent of women in the
                   field for each decade. With this we are able to answer:"),
                  p(strong("- How are women within stem careers spread?")),
                  p(strong("- Does the data show some gender disparities
                                  still? If so How?")),
                  br(),
                  h4(a(href = "https://girlswhostem.com/best-stem-organizations-for-girls-and-women/"
                       , "Organizations that help promote STEM
                                  for young girls and women ")))

overview_panel <- tabPanel(
                  "About",
                  titlePanel("Women in STEM"),
                  sidebarLayout(
                    sidebar_content,
                    main_content
  )
)
