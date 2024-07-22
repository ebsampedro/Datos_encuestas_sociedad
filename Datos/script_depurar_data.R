# Cargar librerías necesarias
library(dplyr)
library(tidyr)

# Cargar el conjunto de datos C:\Users\Lenovo\Documents\Emma_dashboard\Datos
df <- read.csv("Emma_dashboard/Datos/CRON2W4e01.csv")

# Diccionario de categorías basado en el diccionario de datos proporcionado
categorias <- list(
  w4q1 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q2 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q3 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q4 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q5 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q6 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q7 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q8 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q9 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q10 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q11 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q12 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q13 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q14 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q15 = c("Not a priority at all", "A small priority", "A medium priority", "An important priority", "A top priority", "No answer"),
  w4q16 = c("Much worse to grow up with their mother only", "Worse to grow up with their mother only", "Makes no difference", "Better to grow up with their mother only", "Much better to grow up with their mother only", "No answer"),
  w4q17 = c("Much worse to grow up with their father only", "Worse to grow up with their father only", "Makes no difference", "Better to grow up with their father only", "Much better to grow up with their father only", "No answer"),
  w4q18 = c("Much worse to grow up with their father and stepmother", "Worse to grow up with their father and stepmother", "Makes no difference", "Better to grow up with their father and stepmother", "Much better to grow up with their father and stepmother", "No answer"),
  w4q19 = c("Much worse to grow up with their mother and stepfather", "Worse to grow up with their mother and stepfather", "Makes no difference", "Better to grow up with their mother and stepfather", "Much better to grow up with their mother and stepfather", "No answer"),
  w4q20 = c("Much worse to grow up with lesbian parents", "Worse to grow up with lesbian parents", "Makes no difference", "Better to grow up with lesbian parents", "Much better to grow up with lesbian parents", "No answer"),
  w4q21 = c("Much worse to grow up with gay male parents", "Worse to grow up with gay male parents", "Makes no difference", "Better to grow up with gay male parents", "Much better to grow up with gay male parents", "No answer"),
  w4q22 = c("...their mother most of the time", "...their father most of the time", "...both parents about an equal amount of the time", "No answer"),
  w4q23 = c("Yes", "No", "No answer"),
  w4q24 = c("Yes", "No", "No answer"),
  w4q25 = c("Yes", "No", "No answer"),
  w4q26 = c("Yes", "No", "No answer"),
  w4q27 = c("More legal rights than the father", "The same legal rights as the father", "Some legal rights but less than the father", "No legal rights at all", "No answer"),
  w4q28 = c("More legal rights than the mother", "The same legal rights as the mother", "Some legal rights but less than the mother", "No legal rights at all", "No answer"),
  w4q29 = c("Yes, and we had children together", "Yes, but we had no children together", "No", "No answer"),
  w4q30 = c("Yes", "No", "No answer"),
  w4q31 = c("With biological mother only", "With biological father only", "With biological mother and stepfather", "With biological father and stepmother", "With (a) grandparent(s)", "With (an) other relative(s)", "With (an) adoptive parent(s)", "Other", "Not applicable", "No answer"),
  w4q32 = c("Not at all", "A little", "Somewhat", "Quite a lot", "A great deal", "No answer"),
  w4q33 = c("Only the people", 1, 2, 3, 4, 5, 6, 7, 8, 9, "Only the politicians", "No answer"),
  w4q34 = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree", "No answer"),
  w4q35 = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree", "No answer"),
  w4q36 = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree", "No answer"),
  w4q37 = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree", "No answer"),
  w4q38 = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree", "No answer"),
  w4q39 = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree", "No answer"),
  w4q40 = c("Not at all", "A little", "Somewhat", "Quite a lot", "A great deal", "No answer"),
  w4q41 = c("Not at all", "A little", "Somewhat", "Quite a lot", "A great deal", "No answer"),
  w4q42 = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree", "No answer"),
  w4q43 = c("Strongly based on evidence", 1, 2, 3, 4, 5, 6, 7, 8, 9, "Strongly based on political beliefs", "No answer"),
  w4q44 = c("Only by experts", 1, 2, 3, 4, 5, 6, 7, 8, 9, "Only by politicians", "No answer"),
  w4q45 = c("Completely based on scientific knowledge", 1, 2, 3, 4, 5, 6, 7, 8, 9, "Completely based on political beliefs", "No answer"),
  w4q46 = c("Always disagree with each other", 1, 2, 3, 4, 5, 6, 7, 8, 9, "Always agree with each other", "No answer"),
  w4q47 = c("Rarely or none of the time", "Some of the time", "Often", "Most or all of the time", "No answer"),
  w4q48 = c("Rarely or none of the time", "Some of the time", "Often", "Most or all of the time", "No answer"),
  hincfel=c("Living comfortably", "Coping", "Difficult", "Very difficult", "Refusal", "Don't know", "No answer")
)

# Función para convertir valores categóricos
convertir_categorias <- function(df, categorias) {
  for (col in names(categorias)) {
    df[[col]] <- factor(df[[col]], levels = 1:length(categorias[[col]]), labels = categorias[[col]], ordered = FALSE)
  }
  return(df)
}

# Aplicar la conversión de categorías al dataframe
df <- convertir_categorias(df, categorias)


# Crear una copia del dataframe original para la depuración
df_depurado <- df

# Verificación de la estructura del dataframe depurado
str(df_depurado)

# Guardar el conjunto de datos depurado
write.csv(df_depurado, "Emma_dashboard/Datos/datos_depurado.csv", row.names = FALSE)

summary(df_depurado)

#################
# Cargar las librerías necesarias
library(ggplot2)

# 1. Distribución de Sentimientos sobre los Ingresos del Hogar
ggplot(df_depurado, aes(x = hincfel)) +
  geom_bar() +
  labs(title = "Distribución de Sentimientos sobre los Ingresos del Hogar", 
       x = "Sentimiento sobre los Ingresos del Hogar", 
       y = "Frecuencia")

# 2. Prioridad de Eliminar la Pobreza por Ingresos del Hogar
ggplot(df_depurado, aes(x = w4q1, fill = hincfel)) +
  geom_bar(position = "dodge") +
  labs(title = "Prioridad de Eliminar la Pobreza por Ingresos del Hogar", 
       x = "Prioridad de Eliminar la Pobreza", 
       y = "Frecuencia",
       fill = "Sentimiento sobre los Ingresos del Hogar")

# 3. Prioridad de Facilitar la Vida a las Familias por Ingresos del Hogar
ggplot(df_depurado, aes(x = w4q2, fill = hincfel)) +
  geom_bar(position = "dodge") +
  labs(title = "Prioridad de Facilitar la Vida a las Familias por Ingresos del Hogar", 
       x = "Prioridad de Facilitar la Vida a las Familias", 
       y = "Frecuencia",
       fill = "Sentimiento sobre los Ingresos del Hogar")

# 4. Prioridad de Maximizar la Prosperidad Económica por Ingresos del Hogar
ggplot(df_depurado, aes(x = w4q10, fill = hincfel)) +
  geom_bar(position = "dodge") +
  labs(title = "Prioridad de Maximizar la Prosperidad Económica por Ingresos del Hogar", 
       x = "Prioridad de Maximizar la Prosperidad Económica", 
       y = "Frecuencia",
       fill = "Sentimiento sobre los Ingresos del Hogar")
