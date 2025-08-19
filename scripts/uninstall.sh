#!/bin/bash

# ============================
# 🗑️ Script: uninstall.sh
# 📌 Desinstala MyDevVault, revirtiendo los cambios de setup.sh
# ============================

echo "🗑️  Iniciando desinstalación de MyDevVault..."

# 🧠 Detectar sistema operativo
SO="$(uname -s)"
case "$SO" in
    Darwin*)   SISTEMA="macOS" ;;\
    Linux*)    SISTEMA="Linux" ;;\
    MINGW*|MSYS*) SISTEMA="Windows" ;;\
    *)         SISTEMA="Desconocido" ;;\
esac

# 🗂️ Obtener rutas clave
BIN_DIR="$HOME/bin"
MYDEVVAULT_CONFIG_DIR="$HOME/.config/mydevvault"

# ============================
# 1. Eliminar scripts copiados en ~/bin
# ============================
echo "1️⃣  Removiendo scripts de '$BIN_DIR'..."
declare -A SCRIPTS_TO_REMOVE=(
    ["setup"]=1
    ["init-mydevvault"]=1
    ["crear_proyecto"]=1
    ["uninstall"]=1
)

for name in "${!SCRIPTS_TO_REMOVE[@]}"; do
    target_path="$BIN_DIR/$name"
    if [ -f "$target_path" ]; then
        rm "$target_path"
        if [ $? -eq 0 ]; then
            echo "✅ '$name' removido con éxito."
        else
            echo "❌ Error al remover '$name'. Por favor, elimínelo manualmente."
        fi
    else
        echo "ℹ️  '$name' no encontrado en '$BIN_DIR'. Saltando."
    fi
done

# ============================
# 2. Eliminar directorio de configuración
# ============================
echo "2️⃣  Removiendo directorio de configuración '$MYDEVVAULT_CONFIG_DIR'..."
if [ -d "$MYDEVVAULT_CONFIG_DIR" ]; then
    rm -r "$MYDEVVAULT_CONFIG_DIR"
    if [ $? -eq 0 ]; then
        echo "✅ Directorio removido con éxito."
    else
        echo "❌ Error al remover el directorio. Por favor, elimínelo manualmente."
    fi
else
    echo "ℹ️  Directorio no encontrado. Saltando."
fi

# ============================
# 3. Eliminar líneas del archivo de configuración del shell (Método mejorado)
# ============================\n
echo "3️⃣  Limpiando archivos de configuración del shell..."

SHELL_CONFIG_FILES=("$HOME/.bashrc" "$HOME/.bash_profile")
for config_file in "${SHELL_CONFIG_FILES[@]}"; do
    if [ -f "$config_file" ]; then
        echo "   Procesando $config_file..."
        
        # Crear un archivo temporal sin las líneas de MyDevVault
        grep -v 'MyDevVault' "$config_file" | grep -v 'export PATH="$HOME/bin:$PATH"' | grep -v 'source "/c/Users/jnunez.DATAPOWERP/.config/mydevvault/aliases.sh"' > "$config_file.tmp"
        
        # Reemplazar el archivo original con el temporal
        mv "$config_file.tmp" "$config_file"
        
        echo "   ✅ Líneas de configuración removidas de '$config_file'."
    else
        echo "   ℹ️  Archivo de configuración de shell no encontrado: '$config_file'. Saltando."
    fi
done

echo "🎉 Desinstalación completada. Puede que necesites reiniciar tu terminal"
echo "   o ejecutar 'source ~/.bashrc' para que los cambios surtan efecto."
echo "   Recuerda eliminar el repositorio MyDevVault si ya no lo necesitas."