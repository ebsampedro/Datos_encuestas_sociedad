library(shiny)
library(shinydashboard)
# Cargar ui y server
source("ui.R")
source("server.R")

# Ejecutar la aplicación
shinyApp(ui = ui, server = server)

