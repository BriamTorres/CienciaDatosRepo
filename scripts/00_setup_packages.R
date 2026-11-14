# ==============================================================================
# 00_setup_packages.R
# Script de instalación y carga de librerías esenciales para Ciencia de Datos
# Especialización: Ciencia de Datos y Aprendizaje Automático para la Toma de Decisiones
# ==============================================================================

paquetes_requeridos <- c(
  # Manipulación y visualización de datos
  "tidyverse",       # ggplot2, dplyr, tidyr, readr, purrr, tibble, etc.
  "readxl",          # Lectura de archivos Excel
  "writexl",         # Exportar a Excel
  "data.table",      # Procesamiento rápido de grandes volúmenes de datos
  "lubridate",       # Manejo de fechas y tiempos

  # Visualización avanzada
  "corrplot",        # Matrices de correlación
  "plotly",          # Gráficos interactivos
  "scales",          # Formato de ejes y etiquetas

  # Machine Learning y Modelado
  "tidymodels",      # Framework moderno de ML en R
  "caret",           # Clasificación y regresión (estándar tradicional)
  "randomForest",    # Bosques aleatorios
  "xgboost",         # Gradient Boosting
  "cluster",         # Algoritmos de clustering (K-Means, jerárquico, etc.)
  "factoextra",      # Visualización de PCA y clustering

  # Reportes y utilidades
  "rmarkdown",       # Generación de informes dinámicos
  "knitr",           # Motor de teñido de reportes
  "kableExtra"       # Tablas estilizadas en HTML/PDF
)

instalar_si_falta <- function(paquete) {
  if (!requireNamespace(paquete, quietly = TRUE)) {
    message(paste("Instalando:", paquete))
    install.packages(paquete, repos = "https://cloud.r-project.org")
  } else {
    message(paste("Ya instalado:", paquete))
  }
}

message("=== Verificando e instalando librerías requeridas ===")
invisible(sapply(paquetes_requeridos, instalar_si_falta))
message("=== ¡Configuración de paquetes completada! ===")

