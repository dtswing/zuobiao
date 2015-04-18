library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Zuobiao Survey Viz"),

  fluidRow(
    selectInput("question", 
                label = "Question",
                choices = list("如果是出于自愿.我会认可我的孩子和同性结成伴侣关系.","中国传统医学对人体健康的观念比现代主流医学更高明.", "现代中国社会需要儒家思想."),
                selected = "如果是出于自愿.我会认可我的孩子和同性结成伴侣关系.")
  ),
  
  fluidRow(
      column(2,
      helpText("Select population of interest:"),
      selectInput("gender", 
                  label = "性别",
                  choices = list("全选","女性", "男性"),
                  selected = "全部"),
      sliderInput("age", 
                  label = "出生年份",
                  min = 1950, max = 2000, value = c(1950, 2000)),
      checkboxGroupInput("income", 
                         label = ("年收入"), 
                         choices = list("全选","0-25k", "25k-50k","50k-75k","75k-100k","100k-150k","150k-300k"),
                         selected = "全选"),
      selectInput("education", 
                  label = "教育程度",
                  choices = list("全选","初中及以下", "大学","研究生及以上","高中"),
                  selected = "全选"),
      helpText("Select question of interest:")),
      
      column(2,
             helpText("Select population of interest:"),
             selectInput("gender2", 
                         label = "性别",
                         choices = list("全选","女性", "男性"),
                         selected = "全部"),
             sliderInput("age2", 
                         label = "出生年份",
                         min = 1950, max = 2000, value = c(1950, 2000)),
             checkboxGroupInput("income2", 
                                label = ("年收入"), 
                                choices = list("全选","0-25k", "25k-50k","50k-75k","75k-100k","100k-150k","150k-300k"),
                                selected = "全选"),
             selectInput("education2", 
                         label = "教育程度",
                         choices = list("全选","初中及以下", "大学","研究生及以上","高中"),
                         selected = "全选")),
      column(8,
             h1("Results"),
             br(),
             br(),
             textOutput("text1"),
             textOutput("text2"),
             plotOutput("map"))
    )
  )
)
  
