output$subtab1_ui <- renderUI({
  fluidPage(
    fluidRow(
      width = 12,
      tags$h2("Sub tab 123"),
      fluidRow(width = 12,
               box(
                 id = 'subtab1_box',
                 title = 'TEST', #textOutput('rendered_in_server')
                 collapsible = F,
                 # collapsed = F,
                 width = 12#,
                 # DT::dataTableOutput(iris)
               )
      )
    )
  )
})