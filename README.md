# Ciencia de Datos y Aprendizaje Automático para la Toma de Decisiones

Especialización - Semestre 1

Este repositorio contiene la estructura organizada para las prácticas, análisis y modelos desarrollados durante la materia.

---

## 📁 Estructura del Proyecto

```text
├── data/
│   ├── raw/                  # Datos originales sin procesar (inmutables)
│   └── processed/            # Datos limpios y listos para modelado
├── notebooks/
│   └── plantilla_informe.Rmd # Plantillas para informes reproducibles (R Markdown)
├── output/
│   ├── figures/              # Gráficas e imágenes generadas
│   └── models/               # Modelos entrenados exportados (.rds)
├── scripts/
│   ├── 00_setup_packages.R   # Instalación y verificación de paquetes clave
│   └── 01_eda.R              # Plantilla para Análisis Exploratorio de Datos
├── .gitignore                # Reglas para control de versiones en R
├── Ciencia_de_Datos_Decisiones.Rproj # Archivo de proyecto nativo para RStudio
└── README.md
```

---

## 🚀 Cómo Trabajar

### Opción A: Desde RStudio
1. Abre el archivo `Ciencia_de_Datos_Decisiones.Rproj` haciendo doble clic.
2. RStudio se abrirá configurando automáticamente este directorio como el directorio de trabajo raíz.
3. Abre y ejecuta `scripts/00_setup_packages.R` para instalar las librerías necesarias.

### Opción B: Desde este Asistente (Antigravity / VS Code)
1. Puedes pedirme directamente que ejecute scripts, cree modelos de Machine Learning, limpie datasets o elabore gráficas.
2. Para ejecutar scripts desde la terminal:
   ```powershell
   Rscript scripts/01_eda.R
   ```

