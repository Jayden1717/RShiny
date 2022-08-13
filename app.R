
#Development tabs
DEV_TABS <- c(
  'amortisation'
)

run_data <- F

#Run parameters and libraries
library(shiny)
library(shinydashboard)

#Run pipeline scripts
if('amortisation' %in% DEV_TABS & run_data) {
  source("global/calc_vars.R")
}

#Run UI scripts
ui <- eval(
  parse("ui/dashboard_ui.R")
)

#Run server scripts
server <- function(input, output, session) {
  eval(parse('server/dashboard_server.R'))
  eval(parse('ui/home/user_data_input_ui.R'))
}

# Run the application 
shinyApp(ui = ui, server = server)
