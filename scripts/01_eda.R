# ==============================================================================
# 01_eda.R
# Plantilla de Análisis Exploratorio de Datos (EDA)
# ==============================================================================

suppressPackageStartupMessages({
  library(tidyverse)
  library(corrplot)
  library(scales)
})

# 1. Cargar datos
# Modifica la ruta al dataset de tu clase o taller:
# df <- read_csv("data/raw/tu_dataset.csv")

# Demostración con dataset incluido en R (iris/mtcars):
df <- as_tibble(mtcars)

# 2. Estructura general y resumen estadístico
glimpse(df)
summary(df)

# 3. Verificación de valores faltantes (NA)
na_counts <- colSums(is.na(df))
print("Valores nulos por variable:")
print(na_counts)

# 4. Matriz de correlación para variables numéricas
cor_matrix <- cor(df %>% select(where(is.numeric)), use = "complete.obs")

# Guardar gráfico de correlación
png("output/figures/matriz_correlacion.png", width = 800, height = 800, res = 120)
corrplot(cor_matrix, method = "color", type = "upper", 
         tl.col = "black", tl.srt = 45, addCoef.col = "black",
         number.cex = 0.7)
dev.off()

# 5. Visualización de distribución (Ejemplo: MPG vs HP)
p1 <- ggplot(df, aes(x = hp, y = mpg, color = factor(cyl))) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal() +
  labs(
    title = "Relación entre Caballos de Fuerza y Rendimiento",
    subtitle = "Dataset de prueba mtcars",
    x = "Potencia (HP)",
    y = "Millas por Galón (MPG)",
    color = "Cilindros"
  )

ggsave("output/figures/dispersion_ejemplo.png", plot = p1, width = 8, height = 5, dpi = 300)

message("EDA preliminar ejecutado. Gráficas guardadas en 'output/figures/'.")

