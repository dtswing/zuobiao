library(shiny)
library(ggplot2)
library(dplyr)
library(magrittr)

create_segments <- function(data, question, segmentname, genderSelect, birthfloor, birthcap, incomeSelect, educationSelect){
  dataSeg <- data %>% 
    filter(gender %in% genderSelect &  birthyear >= birthfloor & birthyear <= birthcap & income %in% incomeSelect & education %in% educationSelect) %>% 
      mutate(segment = segmentname) 
  return (dataSeg[,c(question,"segment")])
}

plotChart <- function(data, question){
  ggplot(data = data, aes_string(question)) + geom_bar(aes_string(y = "..density..", group = "segment", fill = "factor(..x..)")) + 
          facet_wrap(~segment)+theme(text=element_text(family="STKaiti",size=14)) +
          scale_fill_hue(name = question, breaks = 1:4, 
                      labels = levels(data[,question]))
} 

#test2 <- create_segments(zuobiao,"如果是出于自愿.我会认可我的孩子和同性结成伴侣关系.", "segment 2", "M", 1990, 1995, "0-25k","大学")

#plotChart(rbind(test,test2),"如果是出于自愿.我会认可我的孩子和同性结成伴侣关系.")
