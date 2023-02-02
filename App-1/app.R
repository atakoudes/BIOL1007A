library(shiny)
library(tidyverse)

data(mpg)
mpg_data <- mpg

# Define UI ----
ui <- fluidPage(
  titlePanel("Interactive Bar Chart"),
  
  sidebarLayout(
    sidebarPanel(
      p("This is the sidebar panel"),   #this is some text on the page
      selectInput("x_axis",             #this is a button for the user to change inputs
                  label = "Select a variable to group by",
                  choices = c("Make", "Drive", "Class", "Fuel"),
                  selected = "Class"),
    
      selectInput("y_axis", 
                  label = "Select a variable to display",
                  choices = c("Highway", 
                              "City", 
                              "Displacement", 
                              "Cylinders"),
                  selected = "Highway"
                  ),
      p("This Shiny App allows the user to select certain inputs which will change the figure in real time.
        You can also add images and any sort of HTML customization to the user interface."),
    ),

    
    mainPanel(
      p("This is the main panel"), #this is also some text in the main panel section
      plotOutput("chart"),         #this is where the graph actually gets printed out
      
    )
  )
)

# Server logic ----
server <- function(input, output) {
  output$chart <- renderPlot({
    yvar <- switch(input$y_axis,         #this takes the user input from the "y_axis" button and assigns it to yvar
                    "Highway" = mpg$hwy, #each possible input gets assigned to the appropriate list from the dataframe
                    "City" = mpg$cty, 
                    "Displacement" = mpg$displ, 
                    "Cylinders" = mpg$cyl)
    
    xvar <- switch(input$x_axis, 
                    "Make" = mpg$manufacturer, 
                    "Drive" = mpg$drv, 
                    "Class" = mpg$class, 
                    "Fuel" = mpg$fl)
    
    ggplot(mpg_data, aes(x=reorder(xvar, yvar), y=yvar, fill=reorder(xvar,yvar))) + 
      geom_boxplot(show.legend=F) +
      coord_flip() +
      xlab(input$x_axis) +
      ylab(input$y_axis) +
      theme_classic()

  
  })
  
}

# Run app ----
shinyApp(ui, server, options = list(display.mode = 'showcase'))