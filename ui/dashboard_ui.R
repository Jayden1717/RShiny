fluidPage(
  tabsetPanel(id = 'home_tabset',
              tabPanel('Home',
                       tabsetPanel(
                         tabPanel(value = 'amortisation_calculator',
                                  title = 'Amortisation calculator',
                                  uiOutput(outputId = "user_data_input_ui"),
                                  
                                  #potentially create a new ui output for the table section 
                                  #or collapse it into user input ui script
                                  fluidRow(column(4,dataTableOutput('amortisation_table')))
                         ),
                         tabPanel(value = 'Subtab 2',
                                  title = 'SUB TAB 2'
                                  # uiOutput('subtab2_ui')
                         )
                       )
              ),
              tabPanel('Home Page 2',
                       tabsetPanel(
                         tabPanel('Subtab 3',
                                  # uiOutput('subtab3_ui')
                         ),
                         tabPanel('Subtab 4',
                                  # uiOutput('subtab4_ui')
                         )
                       )
              )
  )
)