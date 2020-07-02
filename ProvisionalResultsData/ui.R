#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage(title = "Provisional Results", theme = shinytheme("flatly"), position = "fixed-top", windowTitle = "Global Fund Provisional Results",
                   tabPanel("Country Selection",
                            fluidPage(
                              # Main Panel -----
                              fluidRow(  
                                column(12, align = "center",
                                       br(),br(),br(),
                                       h3("Choose a country to review"),
                                       selectizeInput("countrySelection", "Country of interest", choices = c("All", allCountries)),
                                       h5("If you notice an issue with your results as reported: "),
                                       tags$a(href="https://airtable.com/shrmYgVbfpStMqC83", "click here",target="_blank")
                                )
                              )
                            )#fluidPage
                   ),#tabPanel-duplication
                   tabPanel("Annual by country",
                            fluidPage(
                              br(),br(),br(),
                              column(12, align = "center",
                                     h3("Annual country level data:"),
                                     textOutput("selected_var_tab1"),
                                     br(), br(),
                                     div(DT::dataTableOutput("df_countryAnnually"),  style = style_table)
                              )
                            )#fluidPage
                   ),
                   tabPanel("Annual by grant",
                            fluidPage(
                              br(),br(),br(),
                              column(12, align = "center",
                                     h3("Annual grant level data"),
                                     textOutput("selected_var_tab2"),
                                     br(), br(),
                                     div(DT::dataTableOutput("df_GrantsAnnually"),  style = style_table)
                              )
                            )
                   ),
                   tabPanel("Grant results",
                            fluidPage(
                              br(),br(),br(),
                              column(12, align = "center",
                                     h3("Grant results"),
                                     textOutput("selected_var_tab3"),
                                     br(), br(),
                                     div(DT::dataTableOutput("df_grantResults"),  style = style_table)
                              )
                            )
                   )
))
