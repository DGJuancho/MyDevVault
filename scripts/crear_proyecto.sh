#!/bin/bash

# ============================
# ⚙️ Script: crear_proyecto.sh
# 📌 Crea un nuevo proyecto a partir de una plantilla
# ============================

# 1. Verificar si se ingresó un nombre de proyecto
if [ -z "$1" ]; then
    echo "⚠️  Uso: crear_proyecto.sh <NombreDeMiProyecto>"
    exit 1
fi

PROYECTO=$1
PLANTILLA_DIR="./templates/base-project"
PROYECTOS_DIR="$HOME/Desktop/GitHub"

# Verificar si la plantilla existe
if [ ! -d "$PLANTILLA_DIR" ]; then
    echo "❌ Error: Directorio de plantilla no encontrado en '$PLANTILLA_DIR'."
    echo "   Asegúrate de haber creado la plantilla 'base-project' para continuar."
    exit 1
fi

# 2. Crear carpeta del proyecto
PROYECTO_PATH="$PROYECTOS_DIR/$PROYECTO"
if [ -d "$PROYECTO_PATH" ]; then
    echo "⚠️  El directorio del proyecto '$PROYECTO' ya existe. Saliendo para evitar sobrescribir."
    exit 1
fi

echo "✨ Creando proyecto '$PROYECTO' en '$PROYECTOS_DIR'..."

# Copiar la plantilla al nuevo directorio
cp -r "$PLANTILLA_DIR" "$PROYECTO_PATH"
if [ $? -ne 0 ]; then
    echo "❌ Error al copiar la plantilla. Saliendo."
    exit 1
fi

cd "$PROYECTO_PATH" || { echo "❌ No se pudo entrar al directorio del proyecto. Saliendo."; exit 1; }
echo "✅ Plantilla del proyecto copiada."

# 3. Inicializar Git y primer commit
echo "📦 Inicializando Git y realizando primer commit..."
git init >/dev/null 2>&1

# Agregar todos los archivos, incluyendo .gitkeep
git add . >/dev/null 2>&1

# Verificar si hay cambios staged
if git diff --cached --exit-code --quiet; then
    echo "ℹ️  Git inicializado, pero no hubo cambios para el primer commit."
else
    git commit -m "🔧 Estructura inicial del proyecto." >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ Primer commit realizado con éxito."
    else
        echo "⚠️  Git inicializado, pero el primer commit falló. Por favor, revise manualmente."
    fi
fi

echo "🎉 Proyecto '$PROYECTO' creado exitosamente."
echo "Puedes empezar a trabajar en él en: $PROYECTO_PATH"