


# ui <- fluidPage(
#   fluidRow(column(4,dataTableOutput('dto')),
#            column(4,tableOutput('to')))
# )

# server <- function(input,output){
  
  output$amortisation_table <- renderDataTable(amortisation_table)
  # dat$date <- format(dat$date,'%Y-%m-%d')
  # output$to <- renderTable(dat)
  
# }












