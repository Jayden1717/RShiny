
#Development tabs

#Run parameters and libraries
library(shiny)
library(shinydashboard)

#Run pipeline scripts


#Run UI scripts
ui <- eval(
    parse("ui/dashboard_ui.R")
)

#Run server scripts
server <- function(input, output, session) {
    eval(parse('server/dashboard_server.R'))
    eval(parse('ui/home/subtab1_ui.R'))
}

# Run the application 
shinyApp(ui = ui, server = server)
