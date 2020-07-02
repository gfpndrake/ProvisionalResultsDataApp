#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  # Country Annually:
  output$df_countryAnnually <- DT::renderDataTable({
    df_countryAnnually %>%
      filter(country_name %in% input$countrySelection | input$countrySelection == "All") %>% 
      DT::datatable(
        options = list(
          scrollX = TRUE, scrollY = TRUE, autoWidth = TRUE,
          columnDefs = list(list(targets=c(0), visible=FALSE),
                            list(targets=c(1),     visible=TRUE, width ='200px'),
                            list(targets=c(2),     visible=TRUE, width ='5px'),
                            list(targets=c(3),     visible=TRUE, width ='5px'),
                            list(targets=c(4:9),   visible=TRUE, width ='5px'),
                            list(targets=c(10:11), visible=TRUE, width ='5px'),
                            list(targets=c(12),    visible=TRUE, width ='10px')
          )
        ))
    
  })
  
  # Grants annually
  output$df_GrantsAnnually <- DT::renderDataTable(DT::datatable({
    
    df_grantAnnually %>%
      filter(country_name %in% input$countrySelection | input$countrySelection == "All") %>% 
      return()
  }
  ))
  # Grant results:
  output$df_grantResults <- DT::renderDataTable(DT::datatable({
    df_grantResults %>%
      filter(country_name %in% input$countrySelection | input$countrySelection == "All") %>% 
      return()
  }))
  
  
  # update the tab texts with the selected country:
  output$selected_var_tab1 <- output$selected_var_tab2 <- output$selected_var_tab3 <- renderText({ 
    paste(input$countrySelection)
  })

})
