# BAR CHART ---------------------------------------------------------------
install.packages("ggplot2")

library(ggplot2)
mtcars
qplot(
  mtcars$cyl,
  geom = 'bar',
  fill = ("blue"),
  colour = ("red"))


# Histograms --------------------------------------------------------------

qplot(
  mtcars$hp,
  geom = "histogram",
  binwidth = 25 , 
  colour  = ("black"),
  xlab = "Horsepower",
  ylab = "Number of cars",
  alpha = (0),
  main = "Histogram"
)


# Pie charts --------------------------------------------------------------
barp <- ggplot(mtcars,aes(x=1,y=sort(mtcars$carb),fill=sort(mtcars$carb)))+
  geom_bar(stat="identity")
print(barp)

barp <- barp + coord_polar(theta='y')
barp <- barp + theme(
  axis.line=element_blank(),
  axis.text.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks=element_blank(),
  axis.title.y =element_blank(),
  panel.background = element_blank())+
  print(barp)

)