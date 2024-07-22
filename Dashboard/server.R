library(shiny)
library(ggplot2)

df_dep <- read.csv("Datos/datos_depurado.csv")
table(df_dep$w4q1)
  
df_filtered <- df_dep[, c("w4q1", "w4q2", "w4q10", "hincfel")]
server <- function(input, output) {
  
  output$main_plot <- renderPlot({
    plot_type <- input$plot_type
    
    if (plot_type == "dist_hincfel") {
      ggplot(df_dep, aes(x = hincfel)) +
        geom_bar() +
        labs(title = "Distribución de Sentimientos sobre los Ingresos del Hogar", 
             x = "Sentimiento sobre los Ingresos del Hogar", 
             y = "Frecuencia")
    } else if (plot_type == "w4q1_hincfel") {
      ggplot(df_dep, aes(x = w4q1, fill = hincfel)) +
        geom_bar(position = "dodge") +
        labs(title = "Prioridad de Eliminar la Pobreza por Ingresos del Hogar", 
             x = "Prioridad de Eliminar la Pobreza", 
             y = "Frecuencia",
             fill = "Sentimiento sobre los Ingresos del Hogar")
    } else if (plot_type == "w4q2_hincfel") {
      ggplot(df_dep, aes(x = w4q2, fill = hincfel)) +
        geom_bar(position = "dodge") +
        labs(title = "Prioridad de Facilitar la Vida a las Familias por Ingresos del Hogar", 
             x = "Prioridad de Facilitar la Vida a las Familias", 
             y = "Frecuencia",
             fill = "Sentimiento sobre los Ingresos del Hogar")
    } else if (plot_type == "w4q10_hincfel") {
      ggplot(df_dep, aes(x = w4q10, fill = hincfel)) +
        geom_bar(position = "dodge") +
        labs(title = "Prioridad de Maximizar la Prosperidad Económica por Ingresos del Hogar", 
             x = "Prioridad de Maximizar la Prosperidad Económica", 
             y = "Frecuencia",
             fill = "Sentimiento sobre los Ingresos del Hogar")
    }
  })
  
  # Output for the table (Tab "Tabla General")
  output$table <- renderTable({
    summary(df_filtered)
    #head(df_dep, 10)  # Just displaying the first 10 rows for simplicity
  })
  
  # Output for the forecast table (Tab "Pronóstico")
  output$forecast <- renderTable({
    # Placeholder for forecast data
    
    priority_importance <- sum(df_dep$w4q1 == "An important priority" | df_dep$w4q1 == "A top priority",na.rm = TRUE)
    total_responses <- nrow(df_dep)
    proportion <- priority_importance / total_responses
    
    forecast_data <- data.frame(
      Pregunta = "Proporción de personas que consideran eliminar la pobreza como una prioridad importante o máxima", 
      Resultado = round(proportion, 2)
    )
    forecast_data
  })
}
