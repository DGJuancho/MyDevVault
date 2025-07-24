#!/bin/bash

# ============================\n
# 🔗 Script: link-scripts.sh\n
# 📌 Crea enlaces simbólicos multiplataforma (Windows/Linux) en ~/bin\n
# ============================\n

FORCE=false
if [ "$1" == "--force" ]; then
  FORCE=true
fi

# Determinar la ruta raíz del repositorio MyDevVault desde la perspectiva de link-scripts.sh
# Asume que link-scripts.sh está en REPO_ROOT_DIR/scripts/
REPO_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

BIN_DIR="$HOME/bin"
mkdir -p "$BIN_DIR"

# Función para crear enlaces simbólicos en Windows usando PowerShell
create_windows_symlink() {
  local src="$1"
  local tgt="$2"
  local name="$3"

  local win_src
  win_src=$(cygpath -w "$src" | sed 's|/|\\\\|g')
  local win_tgt
  win_tgt=$(cygpath -w "$tgt" | sed 's|/|\\\\|g')

  # echo "🛠️  Ejecutando (mklink): New-Item -ItemType SymbolicLink -Path '$win_tgt' -Target '$win_src'" # Para depuración
  powershell.exe -NoProfile -Command "New-Item -ItemType SymbolicLink -Path '$win_tgt' -Target '$win_src'" > /dev/null # Redirige salida para evitar spam

  if [ $? -eq 0 ]; then
    echo "🪟 Enlace simbólico creado en Windows: $name → $win_src"
  else
    echo "❌ Error: mklink falló para $name"
    echo "   Detalles del comando: New-Item -ItemType SymbolicLink -Path '$win_tgt' -Target '$win_src'"
  fi
}

# Detectar si estamos en Windows
IS_WINDOWS=false
unameOut="$(uname -s)"
if [[ "$unameOut" == MINGW* ]] || [[ "$unameOut" == MSYS* ]]; then
  IS_WINDOWS=true
fi

# Definir los scripts a enlazar y sus rutas relativas a REPO_ROOT_DIR
# El key es el nombre del enlace en ~/bin, el value es la ruta real del script
declare -A SCRIPTS_TO_LINK=(
    ["setup"]="$REPO_ROOT_DIR/scripts/setup.sh"
    ["init-mydevvault"]="$REPO_ROOT_DIR/scripts/init-mydevvault.sh" # Ahora coincide con tu nombre de archivo
    ["crear_proyecto"]="$REPO_ROOT_DIR/scripts/crear_proyecto.sh"
    ["mydevvault_aliases"]="$REPO_ROOT_DIR/aliases.sh" # Este está en la raíz, no en 'scripts/'
)

echo "🔗 Iniciando creación de enlaces simbólicos en '$BIN_DIR'..."

for name in "${!SCRIPTS_TO_LINK[@]}"; do
    source_path="${SCRIPTS_TO_LINK[$name]}"
    target_path="$BIN_DIR/$name"

    echo "⚙️  Procesando enlace para '$name'..."

    # Verificar si el archivo fuente existe
    if [ ! -f "$source_path" ]; then
        echo "⚠️  Advertencia: Script no encontrado en el kit: '$source_path'. Saltando enlace para '$name'."
        continue
    fi

    # Verificar si el destino ya existe como enlace o archivo regular y manejar conflictos
    if [ -L "$target_path" ]; then # Si ya es un enlace simbólico
        current_target=$(readlink "$target_path")
        if [ "$current_target" = "$source_path" ]; then
            echo "✅ Enlace correcto ya existe: $name → $current_target"
            continue # No hacer nada si el enlace ya es correcto
        fi
        echo "♻️  Enlace simbólico existente para '$name' está desactualizado o es incorrecto. Removiendo para actualizar."
        rm "$target_path"
    elif [ -e "$target_path" ]; then # Si existe como archivo regular o directorio
        if [ "$FORCE" = true ]; then
            echo "⚠️  Conflicto con archivo regular/directorio existente → '$target_path'."
            echo "↪️  Reemplazando automáticamente porque estamos en modo --force."
            rm -rf "$target_path" # Usar -rf para eliminar directorios también si es el caso
        else
            echo "⚠️  Conflicto: Un archivo o directorio regular ya existe en '$target_path'. Omitiendo creación de enlace."
            echo "   Ejecuta con '--force' para sobrescribir (ej. 'bash link-scripts.sh --force')."
            continue
        fi
    fi

    # Crear el enlace simbólico
    if [ "$IS_WINDOWS" = true ]; then
        create_windows_symlink "$source_path" "$target_path" "$name"
    else
        ln -s "$source_path" "$target_path"
        if [ $? -eq 0 ]; then
            echo "🔗 Enlace creado: $name → $source_path"
        else
            echo "❌ Error al crear enlace simbólico para $name"
        fi
    fi

    # Otorgar permisos de ejecución si es un script .sh
    if [[ "$source_path" == *.sh ]]; then
        chmod +x "$source_path"
        echo "   Permisos de ejecución concedidos a '$source_path'."
    fi

done

echo -e "\n🏁 Vinculación de scripts completada."
