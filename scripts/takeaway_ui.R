
summary_one <- fluidPage(
  h2("Summary Takeaway One"),
  h3("Women Software Engineer percentage in companies"),
  p("In our project, we found that the average percentage of
  female software engineers working in the companies in this
  datatset are 20.2%. All the companies in this sample that
  have more than 100 software engineers employ an average of
   13.3% of women software engineers, while companies in
   that have less than 100 software engineers employ an average
    of 21.5% women software engineers. It appears that companies
    that hire less software engineers, in general, employ a
    higher percentage of women software engineers. Although this
    percentage is still low and women only makes up of one fourth
    of the companies' software engineers, on average. The tables
    below show the number of software engineers and number of female
    software engineers employed by each company in the dataset."),
  h5("Mean percentage of Women Software Engineer in Companies
  that hire more than 100 software engineers"),
  tableOutput("companies_more_soft_eng"),
  br(),
  h5("Mean percentage of Women Software Engineer in Companies
  that hire less than 100 software engineers"),
  tableOutput("companies_less_soft_eng"),
  h5("Broader Implications"),
  p("A broader implication of this takeaway is that larger companies and more
     influencial companies tend to be less gender inclusive,
     while smaller companies that hire less software engineers
     tend to hire more women software engineers,
    thus more gender inclusive. With larger
    companies hiring less women software
    engineers, it can discourage women from
    entering into this field. In addition,
    having less diversity in STEM for these leading
    giants in the industry means that
    the needs of the underepresented group can be
    overlooked. For example, if a company
    has a software engineering team of white males,
    they might develop products
    that are biased because they do not understand the values,
    needs and demands of other racial groups and gender.
    As we incorporate more and more softwares and automations
    in our society, this lack of diversity in STEM could
    lead to larger social inequality.")
)

summary_two <- fluidPage(
  h2("Summary Takeaway Two"),
  p("Another takeaway from this project is that there
  is an increase of women in STEM fields from 1970
  to 2018. However, this increase is small in fields
  such as Computer and Engineering. The increase of women in
  STEM fields is most prominent in Social Science and
  Mathematics. This pattern of women's lack of invovlement
  in Computer and Engineering is observed in other aspects
  of this project as well. Upon observation, I suspect that
  this imbalance in genders is due to the lack of resources,
  encouragement,and different societal expectations for
    men and women."),
  h5("Change in Women in STEM from 1970 to 2018"),
  tableOutput("stem_table"),
  br(),
  h5("Broader Implications"),
  p("Although women in STEM is rising in every field,
  yet Computer occupations and engineering still
  prominently consists of men. In all STEM fields,
  women's participation in Computer occupations
  and engineering have the lowest increase, and this
  shows that although there is improvements in gender
  equity in STEM fields, many areas of career is far from
  gender equality. This implicates that it can lead to
  a negative cycle because young women may not have many
  women role models in STEM to look up to. Causing the
  results of less motivation and inspiration for women to enter
    into the STEM fields.")
)

summary_three <- fluidPage(
  h2("Summary Takeaway Three"),
  p("For the total time span from the year 2000 to 2015,
  three majors had over 50 percent of the graduating class
  being female. Those three are psychology at an average of
  77%, biological and agricultural sciences with an average
  of 58%, and social sciences with an average of 54%. And the
  lowest percentage of female graduates came from computer science
  (21%) and engineering (20%). This could indicate that under the
  STEM fields, women are more likely to major under fields that
  deal more with humanity and the environment instead of
  computer-driven majors. Over the 15 years, all the majors experienced
  little growth or shrinkage. The major with the largest variation
  in percentage from 2000 to 2015 was computer science, the female
  graduates dropped 10%. Based on the data we don't see much growth
  across all the majors listed, for a majority of majors there has
  been close to no movement. This could be from individuals choosing
  other paths besides a college degree to learn skills for the
  workforce or dropouts."),
  br(),
  tableOutput("bachelor_table"),
  h5("Broader Implications"),
  p("A broader implication of this takeaway is that
  women tend to choose degrees in Psychology and
  Biological and Agricultural sciences, making up
  an average of 77% of psychology majors and 58%
  of Biological and Agricultural sciences. Interestingly,
  women tend to choose majors that are not typically
  high-paying career fields, and high-paying career fields
  such as Computer sciences, Engineering, and Mathematics
  have a small portion of women. One of the reasons young
  women are less inclined to choose these subjects is because
  the society still holds prescripbed roles of men and women,
  where women are expected to be more interested in people and
  not so much in numbers and objects. These expectations might
  be passed down to young women by parents and teachers, cuasing
  them to be less interested in subjects like Computer sicences,
  Engineering, and Mathmatic. As a society we need to be more
    careful in young children's education and ensure that we can
    help children discover their real passions and interests
    rather than reinforcing these outdated
    perceptions of what it means to be men and women.")
)

summary_takeaway <-  tabPanel("Summary Takeaways",
summary_one,
  hr(),
  summary_two,
  hr(),
  summary_three
)
