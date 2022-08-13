
#TO DO 
# finish income inputs 
# include home loan inputs 
# include hecs and super inputs (later)

output$user_data_input_ui <- renderUI({
  fluidPage(
    fluidRow(
      width = 12,
      tags$h6("Please use the inputs below ...."),
      
      # fluidRow(width = 12,
      box(
        id = 'user_data_input',
        width = 4,
        title = 'Salary/Income', #textOutput('rendered_in_server')
        # collapsible = T,
        # collapsed = T,
        
        fluidRow(
          width = 12,
          
          #yearly salary input
          textInput(inputId = 'salary_input', 
                    label = 'Yearly salary', 
                    value = 60000, 
                    width = NULL, 
                    placeholder = 'Please enter a number'
          )
        ),
        
        fluidRow(
          width = 12,
          
          #salary inclusive of superannuation
          checkboxInput(inputId = 'salary_include_super', 
                        label = "Does your salary include superannuation?", 
                        value = FALSE, 
                        width = NULL)
        )
        
        # DT::dataTableOutput(iris)
      )
      # )
    )
  )
})