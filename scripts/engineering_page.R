library(shinyWidgets)
library(plotly)


diff_scatter_plots <- pickerInput(
  inputId = "input_select",
  label = "Gender Distribution of Engineers", 
  choices = c("Percent of Female Engineers versus Total Number of Engineers", 
              "Percent of Male Engineers versus Total Number of Engineers", 
              "Percent of Female Engineers versus Total Number of Female Engineers"),
  options = list(
    title = "Select Engineering Data Plot")
)

interactive <- tabPanel(
  "Interactive Scatter Plot",
  sidebarLayout(
    sidebarPanel(
      diff_scatter_plots
    ),
    mainPanel(
      plotlyOutput("scatter_plot")
    )
  )
)

data_sum <- tabPanel(
  "Average Percentage of Female Engineers Through the Years",
  tableOutput("eng_data_sum"),
  p(
    "This table shows the percent of women engineers compared to the total number of engineers across different companies that have more than 100 total engineers to not include too many outliers. 
    2018 and 2019 are also excluded from this table because the dataset didn't contain enough information on these years to provide adequate information. This table is included to show how many 
    women are receiving jobs in the science and engineering field compared to the total number of people employed in the same sector at different tech companies. The table shows that there has 
    been growth over the five-year time frame. With some staggering and a big jump at the end in 2017. Even though there has been some growth, the percentage of women is still very low, showing 
    that there is still room for improvement."
  )
)

insights <- tabPanel(
  "Insights",
  mainPanel(
    p(h4("Gender Breakdown of Engineers in Various Companies")),
    p(
      "These chart compares female engineers in a company to the total number of engineers in a company. This chart shows that regardless 
      of the total size of the software company or the total number of engineers the percentage of female engineers working for the 
      companies is often below 50%. In fact the larger companies happen to be the largest culprits, of the companies looked att all of the 
      companies with 100 or more engineers have less than 25% female engineers working for them. 
      We will see a similar percentage breakdown when looking at percentage of females who earn an engineering degree, despite the 
      fact that early childhood interest is 50 - 50. This shows that there still is a large gender disparity in the engineering and cs 
      field, probably dude to a combinationg of multiple reasons including: societal discouragement for females, sexism, lack of 
      opportunity, etc. All of these factors plus more probably result in the lack of a condusive envioronment for more females to 
      work in the engineering field to this day."
    ),
    width = 7
  ),
  mainPanel(
    p(h4("What can we do?")),
    p(
      "The lack of diversity in the US tech sector is not a recent phenomenon; it has been a significant and consistent challenge for tech companies 
      for many years. From tech start-ups to Fortune 500 industry anchors, tech companies of all sizes recognize that their workforce continues to 
      draw mainly from a small segment of the talent pool—predominantly white and Asian men from elite educational institutions. Drawing from a narrow 
      talent pool leaves money, innovative ideas, and star employees on the table—and potentially exposes organizations to criticism and reputational risk.

      To understand the magnitude of the problem, consider the fact that women comprise just 23 percent of high school Advanced Placement computer-science 
      exam takers, 19 percent of bachelor’s computer and information science degree recipients, and 26 percent of the computing workforce.The tech sector 
      needs to innovate to expand its technical workforce—and quickly. According to a recent McKinsey Global Institute discussion paper, demand for advanced 
      IT and programming skills will grow by as much as 90 percent over the next 15 years. Business leaders across sectors are already reporting an expected 
      tech skills shortage in their companies within the next three years. And the competition for technical talent is about to become much fiercer across 
      industries as companies of all types grow their technical capabilities. To stay ahead, the tech sector needs to expand its talent pool rapidly by 
      investing in and attracting historically underutilized talent, notably women."
    ),
    p(h5("Focus on Women and Girls")),
    p(
      "As part of a broader diversity effort, it is important for companies to support either girls-only programs or coeducational programs that focus on achieving 
      at least 40 percent representation of girls through proactive recruitment and retention steps. Maintaining a focus on women’s equal representation, with 
      stated goals at the program level, is the only way to avoid replicating the same gender ratios we see in tech today."
    ),
    width = 7
  )
)

engineer_panel <- tabPanel(
  "Women in Engineering", 
  p(h2("Women Engineers in Companies", align = "left")),
  tabsetPanel(
    interactive,
    data_sum,
    insights
  )
)

