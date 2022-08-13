

#reactive for amortisation table rendering 
amortisation_table_summary <- reactive({
  amortisation_table[, row := .I][period_count == 0 | row == 1]
})


#output amortisation table 
#consider making this a reactTable with colours etc 
output$amortisation_table <- renderDataTable(amortisation_table_summary())












