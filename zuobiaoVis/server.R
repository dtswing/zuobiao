setwd("~/Siying/zuobiao")

library(shiny)
library(ggplot2)
library(dplyr)
library(magrittr)
source("zuobiao.r")

zuobiao <- load("zuobiao.Rdata")

zuobiao$gender <- zuobiao$性别
zuobiao$income <- zuobiao$年收入
zuobiao$education <- zuobiao$学历
zuobiao$birthyear <- zuobiao$出生年份

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$map <- renderPlot({
      
      args$question <- switch(input$question,
                              "如果是出于自愿.我会认可我的孩子和同性结成伴侣关系." = "如果是出于自愿.我会认可我的孩子和同性结成伴侣关系.",
                              "中国传统医学对人体健康的观念比现代主流医学更高明." = "中国传统医学对人体健康的观念比现代主流医学更高明.",
                              "现代中国社会需要儒家思想." = "现代中国社会需要儒家思想.")
      
      args$genderSelect <- switch(input$gender,
                     "全选" = c("F","M"),
                     "女性" = "F",
                     "男性" = "M")
      
      args$incomeSelect <- switch(input$incomeSelect,
                                  "全选" = c("F","M"),
                                  "女性" = "F",
                                  "男性" = "M")
      
      args$educationSelect <- switch(input$educationSelect,
                                  "全选" = c("0-25k", "25k-50k","50k-75k","75k-100k","100k-150k","150k-300k"),
                                  "0-25k" = "0-25k",
                                  "25k-50k" = "25k-50k",
                                  "50k-75k" = "50k-75k",
                                  "75k-100k" = "75k-100k",
                                  "100k-150k" = "100k-150k",
                                  "150k-300k" = "150k-300k"
                                  )
      
      args$birthfloor <- input$age[1]
      args$birthcap <- input$age[2]
      
      create_segments(zuobiao,args)
    })
})
