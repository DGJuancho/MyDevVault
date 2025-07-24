#!/bin/bash

# 🚀 Iniciando configuración de MyDevVault...
echo "🚀 Iniciando configuración de MyDevVault..."

# 🧠 Detectar sistema operativo
SO="$(uname -s)"
case "$SO" in
    Darwin*)   SISTEMA="macOS" ;;
    Linux*)    SISTEMA="Linux" ;;
    MINGW*|MSYS*) SISTEMA="Windows" ;;
    *)         SISTEMA="Desconocido" ;;
esac

echo "🔍 Sistema detectado: $SISTEMA"

# 🗂️ Ruta base del repositorio
# Determinar la ruta real del script, incluso si es un enlace simbólico
SCRIPT_REAL_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
# Obtener el directorio donde se encuentra el script real (e.g., /path/to/MyDevVault/scripts)
SCRIPT_DIR="$(dirname "$SCRIPT_REAL_PATH")"
# La raíz del repositorio es el directorio padre de 'scripts'
REPO_ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "📂 Ruta del repositorio MyDevVault: $REPO_ROOT_DIR"

BIN_DIR="$HOME/bin"

# 📂 Crear ~/bin si no existe
if [ ! -d "$BIN_DIR" ]; then
    echo "📁 Creando carpeta bin: $BIN_DIR"
    mkdir -p "$BIN_DIR"
else
    echo "📁 Carpeta bin ya existe: $BIN_DIR"
fi

# ⚙️ Configurar Git globalmente (usando enlaces simbólicos)
echo "⚙️  Configurando Git globalmente..."

declare -A GIT_CONFIG_LINKS=(
    ["gitconfig.example"]="$HOME/.gitconfig"
    ["gitignore_global"]="$HOME/.gitignore_global"
)

for config_file in "${!GIT_CONFIG_LINKS[@]}"; do
    source_path="$REPO_ROOT_DIR/config/$config_file"
    target_path="${GIT_CONFIG_LINKS[$config_file]}"
    name="$(basename "$target_path")"

    echo "⚙️  Procesando $name..."

    # Verificar si el destino ya existe como enlace o archivo regular y eliminarlo
    if [ -L "$target_path" ]; then
        echo "♻️  Enlace simbólico existente para '$name'. Removiendo para actualizar."
        rm "$target_path"
    elif [ -f "$target_path" ]; then
        echo "⚠️  Archivo regular existente para '$name'. Removiendo para crear enlace."
        rm -f "$target_path"
    fi

    # Ahora intentar crear el enlace simbólico
    if [ "$SISTEMA" == "Windows" ]; then
        # Para Windows, usar PowerShell para crear enlaces simbólicos (mklink)
        win_source=$(cygpath -w "$source_path" | sed 's|/|\\\\|g')
        win_target=$(cygpath -w "$target_path" | sed 's|/|\\\\|g')
        # Captura la salida de PowerShell para depuración, pero no la muestra directamente
        powershell_output=$(powershell.exe -NoProfile -Command "New-Item -ItemType SymbolicLink -Path '$win_target' -Target '$win_source'" 2>&1)
        if [ $? -eq 0 ]; then
            echo "✅ Enlace creado: $name → $win_source"
        else
            echo "❌ Error al crear enlace simbólico para $name."
            echo "   Detalles del error: $powershell_output"
            echo "   Asegúrate de ejecutar Git Bash como administrador si persiste."
        fi
    else
        # Para Linux/macOS, usar ln -s
        ln -s "$source_path" "$target_path"
        if [ $? -eq 0 ]; then
            echo "✅ Enlace creado: $name → $source_path"
        else
            echo "❌ Error al crear enlace simbólico para $name."
        fi
    fi
done

# ⚙️ Configurar identidad de usuario de Git
echo "⚙️  Configurando tu identidad de usuario de Git..."

# Preguntar por el nombre de usuario de Git
read -p "Ingresa tu Nombre Completo para Git (ej. Juan Perez): " GIT_USER_NAME
git config --global user.name "$GIT_USER_NAME"
echo "✅ Git user.name configurado como: $GIT_USER_NAME"

# Preguntar por el correo electrónico de Git
read -p "Ingresa tu Correo Electrónico para Git (ej. tu_correo@ejemplo.com): " GIT_USER_EMAIL
git config --global user.email "$GIT_USER_EMAIL"
echo "✅ Git user.email configurado como: $GIT_USER_EMAIL"

echo "✅ Identidad de Git configurada globalmente."

# 🔗 Llamar a link-scripts.sh para enlazar ejecutables y configurar el PATH
echo "⚙️  Llamando a link-scripts.sh para enlazar ejecutables y configurar el PATH..."
bash "$REPO_ROOT_DIR/scripts/link-scripts.sh"

# ⚙️ Verificar y configurar archivos de shell para cargar aliases y PATH
echo "⚙️  Verificando archivos de configuración de shell ($HOME/.bashrc, $HOME/.zshrc, etc.)..."

# Archivos de configuración de shell a revisar
SHELL_CONFIG_FILES=("$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.bash_profile")

for config_file in "${SHELL_CONFIG_FILES[@]}"; do
    if [ -f "$config_file" ]; then
        echo "   Procesando $config_file..."
        # Verificar y añadir el directorio ~/bin al PATH si no está
        if ! grep -q "export PATH=\"\$HOME/bin:\$PATH\"" "$config_file"; then
            echo "   ➕ Agregando '$BIN_DIR' al PATH en '$config_file'."
            echo "" >> "$config_file"
            echo "# MyDevVault: Añadir scripts al PATH" >> "$config_file"
            echo "export PATH=\"\$HOME/bin:\$PATH\"" >> "$config_file"
        else
            echo "   ℹ️ '$BIN_DIR' ya está en el PATH en '$config_file'."
        fi

        # Verificar y añadir la carga de alias de MyDevVault si no está
        if ! grep -q "source \"\$HOME/bin/mydevvault_aliases\"" "$config_file" && \
           ! grep -q "source \"\$REPO_ROOT_DIR/aliases.sh\"" "$config_file"; then
            echo "   ➕ Agregando carga de alias de MyDevVault a '$config_file'."
            echo "" >> "$config_file"
            echo "# MyDevVault: Cargar aliases personalizados" >> "$config_file"
            echo "source \"\$HOME/bin/mydevvault_aliases\"" >> "$config_file"
        else
            echo "   ℹ️ La carga de alias de MyDevVault ya está en '$config_file'."
        fi
    else
        echo "   ℹ️ Archivo de configuración de shell no encontrado: '$config_file'. Saltando."
    fi
done
echo "🎉 Configuración de shell verificada. Puede que necesites reiniciar tu terminal"
echo "   o ejecutar 'source ~/.bashrc' (o tu archivo de perfil) para aplicar los cambios."

echo "🎉 Configuración de MyDevVault completada. ¡Disfruta!"
echo