# Guía Completa: Repositorio Web de Clases y Despliegue con GitHub Pages (SSH)

Este documento detalla el procedimiento paso a paso para configurar tu repositorio central, conectar tu máquina a GitHub mediante **SSH**, publicar la web con **GitHub Pages** y el flujo de trabajo para vincular futuras clases creadas en RStudio / VS Code.

---

## 1. Arquitectura del Repositorio Web

Para que la web funcione tanto de forma local (en tu computador) como pública en internet, la estructura del proyecto está organizada de la siguiente manera:

```text
04_CIENCIA DE DATOS Y APRENDIZAJE AUTOMÁTICO.../ (Raíz del Repositorio)
│
├── index.html                  <-- Portada principal / Directorio de todas las clases
├── README.md                   <-- Descripción del repositorio en GitHub
├── .gitignore                  <-- Archivos omitidos por git
│
├── Clase1/
│   ├── Datos/                  <-- dataset_clase_1.csv (crudo)
│   ├── Protocolo/
│   │   ├── limpiezaDatos.Rmd   <-- Código reproducible en R
│   │   └── limpiezaDatos.html  <-- Reporte generado (enlazado desde index.html)
│   └── Resultados/
│       └── dataset_clase_1_limpio.csv
│
└── Clase2/ (Futura clase)
    ├── Datos/
    └── Protocolo/
        ├── modeloRegresion.Rmd
        └── modeloRegresion.html <-- Se enlazará en index.html
```

---

## 2. Paso Previo: Habilitar tu Clave SSH en GitHub

En tu computador ya tienes configurada tu clave SSH (`id_ed25519`), pero debes registrar tu **clave pública** en tu cuenta de GitHub para que te permita subir cambios vía SSH sin pedir contraseña.

### 2.1 Copia tu Clave Pública
Tu clave pública generada en `C:\Users\briam\.ssh\id_ed25519.pub` es exactamente la siguiente:

```text
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFX5IfiSJK6r0Nw04EJuYSb0q+Ww4JDX00NFGUG4kQuQ briamsttorres@gmail.com
```

### 2.2 Agrégala a tu cuenta de GitHub
1. Inicia sesión en [GitHub](https://github.com/) con tu usuario **BriamTorres**.
2. Ve a: **Settings** > **SSH and GPG keys** (o entra directo a [https://github.com/settings/keys](https://github.com/settings/keys)).
3. Haz clic en el botón verde **New SSH key**.
4. En **Title**, escribe por ejemplo: `Laptop Briam (Personal)`.
5. En **Key type**, déjalo en `Authentication Key`.
6. En **Key**, pega el texto completo de arriba.
7. Haz clic en **Add SSH key**.

### 2.3 Verifica la Conexión SSH
Abre una terminal (PowerShell o Git Bash) y ejecuta:
```powershell
ssh -T git@github.com
```
*Si te pregunta `Are you sure you want to continue connecting (yes/no)?`, escribe `yes`.*  
Debe responderte:
> `Hi BriamTorres! You've successfully authenticated, but GitHub does not provide shell access.`

---

## 3. Inicializar Git y Subir el Proyecto a GitHub

Abre tu terminal en la carpeta principal de la materia y ejecuta los siguientes comandos:

```powershell
# 1. Ubicarse en el directorio raíz de la materia
cd "c:\Users\briam\Desktop\Especializacion\Semestre1\04_CIENCIA DE DATOS Y APRENDIZAJE AUTOMÁTICO PARA LA TOMA DE DECISIONES"

# 2. Inicializar el repositorio Git
git init

# 3. Configurar tu identidad en el repositorio
git config user.name "Briam Torres"
git config user.email "briamsstorres@gmail.com"

# 4. Agregar todos los archivos (incluyendo index.html, Clase1 con sus reportes, etc.)
git add .

# 5. Crear el primer commit
git commit -m "feat: inicializar repositorio web y agregar reporte Clase 1"

# 6. Definir la rama principal como 'main'
git branch -M main

# 7. Vincular el repositorio remoto mediante SSH
git remote add origin git@github.com:BriamTorres/CienciaDatosRepo.git

# 8. Subir los archivos a GitHub
git push -u origin main
```

---

## 4. Activar la Web Pública (GitHub Pages)

Una vez subido el código, GitHub alojará tu sitio web de forma gratuita:

1. Ve a tu repositorio en GitHub: [https://github.com/BriamTorres/CienciaDatosRepo](https://github.com/BriamTorres/CienciaDatosRepo).
2. Haz clic en la pestaña **Settings** (en la barra superior del repositorio).
3. En el menú lateral izquierdo, haz clic en **Pages**.
4. En la sección **Build and deployment**:
   * **Source:** Selecciona `Deploy from a branch`.
   * **Branch:** Selecciona `main` y en la carpeta deja `/(root)`.
   * Haz clic en **Save**.
5. Espera entre 1 y 2 minutos. GitHub generará un recuadro verde con la URL pública:
   * **URL de tu sitio web:**  
     `https://briamtorres.github.io/CienciaDatosRepo/`

---

## 5. Cómo Agregar una Nueva Clase en el Futuro (Flujo Continuo)

Cada vez que el profesor dicte una nueva clase (por ejemplo, **Clase 2**), sigue estos 3 simples pasos:

### Paso A: Crear los archivos en R
1. Crea la carpeta `Clase2/Protocolo/`.
2. Escribe tu archivo R Markdown (ejemplo: `modeloPrediccion.Rmd`).
3. Haz clic en **`Knit`** en RStudio para generar `modeloPrediccion.html`.

### Paso B: Agregar la entrada en `index.html`
Abre [index.html](file:///c:/Users/briam/Desktop/Especializacion/Semestre1/04_CIENCIA%20DE%20DATOS%20Y%20APRENDIZAJE%20AUTOMÁTICO%20PARA%20LA%20TOMA%20DE%20DECISIONES/index.html) y duplica el bloque de la tarjeta agregando los datos de la nueva clase:

```html
<article class="card">
  <div class="card-header">
    <h2 class="card-title">Clase 02: Modelado Predictivo</h2>
    <span class="card-tag">R Markdown • HTML</span>
  </div>
  <p class="card-description">
    Breve descripción de los modelos, análisis y algoritmos implementados en esta sesión.
  </p>
  <div class="card-actions">
    <!-- Enlace relativo directo al HTML de la clase 2 -->
    <a class="btn btn-primary" href="Clase2/Protocolo/modeloPrediccion.html" target="_blank">
      Abrir Reporte HTML ↗
    </a>
    <a class="btn btn-secondary" href="Clase2/Protocolo/modeloPrediccion.Rmd" target="_blank">
      Código Fuente (.Rmd)
    </a>
  </div>
</article>
```

### Paso C: Subir la actualización a GitHub
En tu terminal:
```powershell
git add .
git commit -m "feat: agregar Clase 2 y actualizar directorio web"
git push
```
En cuestión de segundos, GitHub Pages actualizará tu web pública automáticamente con la nueva clase disponible.

