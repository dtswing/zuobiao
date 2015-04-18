setwd("~/Siying/zuobiao")

library(shiny)
library(ggplot2)
library(dplyr)
library(magrittr)
source("zuobiao.r")

load("zuobiao.Rdata")

zuobiao$gender <- zuobiao$性别
zuobiao$income <- zuobiao$年收入
zuobiao$education <- zuobiao$学历
zuobiao$birthyear <- zuobiao$出生年份

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$map <- renderPlot({
      
      question <- switch(input$question,
                              "如果是出于自愿.我会认可我的孩子和同性结成伴侣关系." = "如果是出于自愿.我会认可我的孩子和同性结成伴侣关系.",
                              "中国传统医学对人体健康的观念比现代主流医学更高明." = "中国传统医学对人体健康的观念比现代主流医学更高明.",
                              "现代中国社会需要儒家思想." = "现代中国社会需要儒家思想.")
        
      genderSelect <- switch(input$gender,
                     "全选" = c("F","M"),
                     "女性" = "F",
                     "男性" = "M")
      
      educationSelect <- switch(input$education,
                                  "全选" = c("初中及以下","大学","研究生及以上","高中"),
                                  "初中及以下" = "初中及以下",
                                  "大学" = "大学",
                                  "研究生及以上" = "研究生及以上",
                                  "高中" = "高中")
      
      incomeSelect <- switch(input$income,
                                  "全选" = c("0-25k", "25k-50k","50k-75k","75k-100k","100k-150k","150k-300k"),
                                  "0-25k" = "0-25k",
                                  "25k-50k" = "25k-50k",
                                  "50k-75k" = "50k-75k",
                                  "75k-100k" = "75k-100k",
                                  "100k-150k" = "100k-150k",
                                  "150k-300k" = "150k-300k"
                                  )
      
      birthfloor <- input$age[1]
      birthcap <- input$age[2]
      
      genderSelect2 <- switch(input$gender2,
                                  "全选" = c("F","M"),
                                  "女性" = "F",
                                  "男性" = "M")
      
      educationSelect2 <- switch(input$education2,
                                     "全选" = c("初中及以下","大学","研究生及以上","高中"),
                                     "初中及以下" = "初中及以下",
                                     "大学" = "大学",
                                     "研究生及以上" = "研究生及以上",
                                     "高中" = "高中")
      
      incomeSelect2 <- switch(input$income2,
                                     "全选" = c("0-25k", "25k-50k","50k-75k","75k-100k","100k-150k","150k-300k"),
                                     "0-25k" = "0-25k",
                                     "25k-50k" = "25k-50k",
                                     "50k-75k" = "50k-75k",
                                     "75k-100k" = "75k-100k",
                                     "100k-150k" = "100k-150k",
                                     "150k-300k" = "150k-300k"
      )
      
      birthfloor2 <- input$age2[1]
      birthcap2 <- input$age2[2]
    
      group1 <- create_segments(zuobiao, question, "group 1", genderSelect, birthfloor, birthcap, incomeSelect, educationSelect)
      group2 <- create_segments(zuobiao, question, "group 2", genderSelect2, birthfloor2, birthcap2, incomeSelect2, educationSelect2)
      plotChart(rbind(group1, group2), question)
    })
})
