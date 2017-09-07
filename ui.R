library(shiny)

fluidPage(
  # Application title
  titlePanel("iDep-rstudio"),
  actionButton('insertBtn', 'Insert'),
  actionButton('removeBtn', 'Remove'),
  tags$div(id = 'placeholder')
)
