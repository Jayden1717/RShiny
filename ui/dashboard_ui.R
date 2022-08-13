fluidPage(
  tabsetPanel(id = 'home_tabset',
              tabPanel('Home',
                       tabsetPanel(
                         tabPanel(value = 'Subtab 1',
                                  title = 'SUB TAB 1',
                                  # fluidRow(column(4,dataTableOutput('amortisation_table'))),
                                  uiOutput(outputId = "subtab1_ui")
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