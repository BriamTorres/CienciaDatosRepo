# Conexión a Google Drive en Google Colab

Esta guía resume los métodos para cargar el conjunto de datos directamente desde Google Drive en lugar de usar un archivo local (`dataset_clase_1.csv`).

---

### Datos del Archivo
- **Enlace compartido:**  
  `https://drive.google.com/file/d/1tabUckY1Y1FFlCsShjceSwngC8LEG5W-/view?usp=drive_link`
- **ID del archivo (`FILE_ID`):**  
  `1tabUckY1Y1FFlCsShjceSwngC8LEG5W-`
- **URL de descarga directa:**  
  `https://drive.google.com/uc?export=download&id=1tabUckY1Y1FFlCsShjceSwngC8LEG5W-`

---

## Método 1: Carga Directa con Pandas (Recomendado)
No requiere montar tu Google Drive personal ni conceder permisos adicionales en la sesión de Colab:

```python
import pandas as pd

# ID extraído del enlace de Google Drive
FILE_ID = "1tabUckY1Y1FFlCsShjceSwngC8LEG5W-"
url = f"https://drive.google.com/uc?export=download&id={FILE_ID}"

# Cargar el DataFrame directamente
df = pd.read_csv(url)
df.head()
```

---

## Método 2: Descarga con `gdown`
Útil si prefieres guardar una copia física en el entorno de ejecución temporal de Colab:

```python
!gdown --id 1tabUckY1Y1FFlCsShjceSwngC8LEG5W- -O dataset_clase_1.csv

import pandas as pd
df = pd.read_csv('dataset_clase_1.csv')
df.head()
```

---

## Método 3: Montando Google Drive
Si el docente o la clase requiere montar el almacenamiento de Google Drive personal:

```python
from google.colab import drive
drive.mount('/content/drive')

# Si guardaste el archivo o acceso directo en "Mi Unidad" (MyDrive):
# df = pd.read_csv('/content/drive/MyDrive/dataset_clase_1.csv')
```

---

### Verificación Rápida
Una vez cargado el DataFrame:
```python
print(f"Dimensiones: {df.shape}")
df.info()
```
