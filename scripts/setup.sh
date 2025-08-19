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

# ⚙️  Configurando Git globalmente de forma no destructiva
echo "⚙️  Configurando Git globalmente de forma no destructiva..."

GIT_CONFIG_TARGET="$HOME/.gitconfig"
GIT_CONFIG_SOURCE="$REPO_ROOT_DIR/config/gitconfig.example"

# Verificar si el archivo de configuración global de Git ya existe
if [ -f "$GIT_CONFIG_TARGET" ] || [ -L "$GIT_CONFIG_TARGET" ]; then
    echo "⚠️  Se detectó un archivo .gitconfig existente en tu HOME."
    echo "   Se respetará tu configuración actual y no se sobrescribirá."
    echo "   Puedes revisar la plantilla en '$GIT_CONFIG_SOURCE' y fusionar configuraciones manualmente si lo deseas."
else
    # Si no existe, copiar la plantilla
    echo "✅ No se encontró un archivo .gitconfig existente. Copiando la plantilla del kit."
    cp "$GIT_CONFIG_SOURCE" "$GIT_CONFIG_TARGET"
fi

# ⚙️  Configurando .gitignore_global de forma no destructiva
echo "⚙️  Configurando .gitignore_global de forma no destructiva..."

GITIGNORE_TARGET="$HOME/.gitignore_global"
GITIGNORE_SOURCE="$REPO_ROOT_DIR/config/gitignore_global"

# Obtener el archivo de exclusiones global actual si existe
CURRENT_GITIGNORE_FILE=$(git config --global --get core.excludesfile)

if [ -z "$CURRENT_GITIGNORE_FILE" ]; then
    # Si no hay un archivo de exclusiones global configurado, lo creamos y lo configuramos
    echo "✅ No se encontró un archivo .gitignore global configurado. Creando y configurando uno nuevo."
    cp "$GITIGNORE_SOURCE" "$GITIGNORE_TARGET"
    git config --global core.excludesfile "$GITIGNORE_TARGET"
else
    # Si ya existe, informamos al usuario y le damos la opción de fusionar
    echo "⚠️  Se detectó que ya tienes un archivo .gitignore global configurado en: $CURRENT_GITIGNORE_FILE"
    echo "   Las reglas de MyDevVault no se copiarán para evitar conflictos."
    echo "   Puedes revisar la plantilla en '$GITIGNORE_SOURCE' y añadir las reglas manualmente si lo deseas."
fi

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

# ⚙️  Verificar y configurar archivos de shell para cargar aliases y PATH
echo "⚙️  Verificando archivos de configuración de shell ($HOME/.bashrc, $HOME/.zshrc, etc.)..."

# Directorio de configuración persistente para el kit
MYDEVVAULT_CONFIG_DIR="$HOME/.config/mydevvault"

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
            echo "   ℹ️  '$BIN_DIR' ya está en el PATH en '$config_file'."
        fi

        # Verificar y añadir la carga de alias de MyDevVault si no está
        if ! grep -q "source \"$MYDEVVAULT_CONFIG_DIR/aliases.sh\"" "$config_file"; then
            echo "   ➕ Agregando carga de alias de MyDevVault a '$config_file'."
            echo "" >> "$config_file"
            echo "# MyDevVault: Cargar aliases personalizados" >> "$config_file"
            echo "source \"$MYDEVVAULT_CONFIG_DIR/aliases.sh\"" >> "$config_file"
        else
            echo "   ℹ️  La carga de alias de MyDevVault ya está en '$config_file'."
        fi
    else
        echo "   ℹ️  Archivo de configuración de shell no encontrado: '$config_file'. Saltando."
    fi
done

echo "🎉 Configuración de shell verificada. Puede que necesites reiniciar tu terminal"
echo "   o ejecutar 'source ~/.bashrc' (o tu archivo de perfil) para aplicar los cambios."

echo "🎉 Configuración de MyDevVault completada. ¡Disfruta!"