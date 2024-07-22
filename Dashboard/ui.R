library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Tablero Emma"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Tabla General", tabName = "widgets", icon = icon("th")),
      menuItem("Pronóstico", tabName = "pronos", icon = icon("line-chart"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(
                  title = "Seleccione el gráfico a visualizar:",
                  selectInput("plot_type", "Tipo de gráfico:", 
                              choices = c("Distribución de Sentimientos sobre los Ingresos del Hogar" = "dist_hincfel",
                                          "Prioridad de Eliminar la Pobreza por Ingresos del Hogar" = "w4q1_hincfel",
                                          "Prioridad de Facilitar la Vida a las Familias por Ingresos del Hogar" = "w4q2_hincfel",
                                          "Prioridad de Maximizar la Prosperidad Económica por Ingresos del Hogar" = "w4q10_hincfel")),
                  width = 4
                ),
                box(
                  title = "Gráfico",
                  plotOutput("main_plot"),
                  width = 8
                )
              )
      ),
      tabItem(tabName = "widgets",
              h2("Tabla General"),
              tableOutput("table")
      ),
      tabItem(tabName = "pronos",
              h2("Pronóstico"),
              tableOutput("forecast")
      )
    )
  )
)

