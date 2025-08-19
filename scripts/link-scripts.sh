#!/bin/bash

# ============================\n
# 🔗 Script: link-scripts.sh\n
# 📌 Copia scripts y archivos de alias a ubicaciones persistentes\n
# ============================\n

FORCE=false
if [ "$1" == "--force" ]; then
  FORCE=true
fi

# Determinar la ruta raíz del repositorio MyDevVault desde la perspectiva de link-scripts.sh
# Asume que link-scripts.sh está en REPO_ROOT_DIR/scripts/
REPO_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Directorio de scripts ejecutables
BIN_DIR="$HOME/bin"
mkdir -p "$BIN_DIR"
echo "📁 Directorio de scripts ejecutables: $BIN_DIR"

# Directorio para archivos de configuración del kit (como los alias)
MYDEVVAULT_CONFIG_DIR="$HOME/.config/mydevvault"
mkdir -p "$MYDEVVAULT_CONFIG_DIR"
echo "📁 Directorio de configuración del kit: $MYDEVVAULT_CONFIG_DIR"

# Definir los scripts a copiar y sus rutas relativas a REPO_ROOT_DIR
# El key es el nombre del archivo de destino, el value es la ruta real del script
declare -A SCRIPTS_TO_COPY=(
    ["setup"]="$REPO_ROOT_DIR/scripts/setup.sh"
    ["init-mydevvault"]="$REPO_ROOT_DIR/scripts/init-mydevvault.sh"
    ["crear_proyecto"]="$REPO_ROOT_DIR/scripts/crear_proyecto.sh"
)

echo "🔗 Copiando scripts ejecutables a '$BIN_DIR'..."

for name in "${!SCRIPTS_TO_COPY[@]}"; do
    source_path="${SCRIPTS_TO_COPY[$name]}"
    target_path="$BIN_DIR/$name"

    echo "⚙️  Procesando script para '$name'..."

    # Verificar si el archivo fuente existe
    if [ ! -f "$source_path" ]; then
        echo "⚠️  Advertencia: Script no encontrado en el kit: '$source_path'. Saltando copia para '$name'."
        continue
    fi

    # Verificar si el destino ya existe como archivo regular o enlace simbólico
    if [ -e "$target_path" ]; then
        if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
            echo "✅ El enlace simbólico para '$name' ya es correcto. No se requiere acción."
            continue
        elif [ "$FORCE" = true ]; then
            echo "⚠️  Conflicto con archivo/enlace existente → '$target_path'."
            echo "↪️  Reemplazando automáticamente en modo --force."
            rm -rf "$target_path"
        else
            echo "⚠️  Conflicto: Un archivo o enlace ya existe en '$target_path'. Omitiendo copia."
            echo "   Ejecuta con '--force' para sobrescribir (ej. 'bash setup.sh --force')."
            continue
        fi
    fi

    # Copiar el script y darle permisos de ejecución
    cp "$source_path" "$target_path"
    chmod +x "$target_path"
    echo "✅ Script copiado y permisos concedidos: $name → $target_path"

done

# Copiar el archivo de alias a su ubicación persistente
echo "⚙️  Copiando archivo de alias a '$MYDEVVAULT_CONFIG_DIR'..."
ALIASES_SOURCE="$REPO_ROOT_DIR/aliases.sh"
ALIASES_TARGET="$MYDEVVAULT_CONFIG_DIR/aliases.sh"

if [ -f "$ALIASES_SOURCE" ]; then
    if [ -f "$ALIASES_TARGET" ] && [ "$FORCE" != true ]; then
        echo "⚠️  Archivo de alias existente en la ubicación de destino. Omitiendo copia."
        echo "   Ejecuta con '--force' para sobrescribir."
    else
        cp "$ALIASES_SOURCE" "$ALIASES_TARGET"
        echo "✅ Archivo de alias copiado: $ALIASES_SOURCE → $ALIASES_TARGET"
    fi
else
    echo "⚠️  Advertencia: Archivo de alias del kit no encontrado: '$ALIASES_SOURCE'. Saltando copia."
fi


echo -e "\n🏁 Operación de copia completada."