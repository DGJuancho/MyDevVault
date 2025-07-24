#!/bin/bash

# Este script crea un nuevo directorio de proyecto con una estructura básica
# y lo inicializa como un repositorio Git.

# 1. Verifica si se ingresó un nombre de proyecto
if [ -z "$1" ]; then
    echo "⚠️  Uso: ./crear_proyecto.sh <NombreDeMiProyecto>"
    exit 1
fi

PROYECTO=$1
# La ruta del gitignore global se mantiene, ya que es una configuración de usuario
GITIGNORE_GLOBAL="$HOME/.gitignore_global"
# La carpeta donde se crearán los proyectos (se mantiene fija en ~/Desktop/GitHub)
PROYECTOS_DIR="$HOME/Desktop/GitHub"

echo "✨ Creando proyecto '$PROYECTO' en '$PROYECTOS_DIR'..."

# 2. Crear carpeta del proyecto y entrar en ella
mkdir -p "$PROYECTOS_DIR/$PROYECTO"
if [ $? -ne 0 ]; then
    echo "❌ Error al crear la carpeta del proyecto. Saliendo."
    exit 1
fi
cd "$PROYECTOS_DIR/$PROYECTO" || { echo "❌ No se pudo entrar al directorio del proyecto. Saliendo."; exit 1; }

echo "📂 Directorio del proyecto '$PROYECTO' creado y navegando a él."

# 3. Estructura básica de carpetas
echo "📁 Creando estructura básica (src/, docs/)..."
mkdir -p src docs
echo "✅ Estructura básica creada."

# 4. Crear plantilla Markdown inicial en docs/README.md
echo "📄 Creando docs/README.md inicial..."
cat > docs/README.md <<EOF
# Documentación

Aquí puedes añadir notas sobre el diseño, decisiones técnicas, diagramas o referencias importantes del proyecto.

## 📄 Índice rápido

- [Estructura del código](../src/)
- [Requisitos](#)
- [Notas](#)

> Sugerencia: puedes usar esta plantilla como punto de partida para documentación más avanzada con herramientas como MkDocs o Docusaurus.
EOF
echo "✅ docs/README.md creado."

# 5. Crear README principal
echo "📄 Creando README.md principal..."
echo "# $PROYECTO" > README.md
echo "✅ README.md principal creado."

# 6. Copiar reglas globales de Git ignore
echo "🚫 Copiando reglas de .gitignore_global si existen..."
if [ -f "$GITIGNORE_GLOBAL" ]; then
    cp "$GITIGNORE_GLOBAL" .gitignore
    echo "✅ .gitignore creado desde tu configuración global ($GITIGNORE_GLOBAL)."
else
    touch .gitignore
    echo "⚠️  No se encontró el archivo .gitignore_global en '$GITIGNORE_GLOBAL'. Se creó un .gitignore vacío."
fi

# 7. Inicializar Git y primer commit
echo "📦 Inicializando Git y realizando primer commit..."
git init > /dev/null 2>&1 # Redirigir salida a /dev/null para no mostrar "Initialized empty Git repository..."

git add . > /dev/null 2>&1 # Redirigir salida a /dev/null

# Verificar si hay cambios staged antes de intentar el commit
if git diff --cached --exit-code --quiet; then
    echo "ℹ️  Git inicializado, pero no hubo cambios nuevos para el primer commit (posiblemente ya estaban en el índice)."
else
    git commit -m "🔧 Estructura inicial del proyecto." > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ Primer commit realizado con éxito."
    else
        echo "⚠️  Git inicializado, pero el primer commit falló. Por favor, revise manualmente el estado de Git."
    fi
fi

echo "🎉 Proyecto '$PROYECTO' creado exitosamente."
echo "Puedes empezar a trabajar en él en: $PROYECTOS_DIR/$PROYECTO"