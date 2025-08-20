# ==================================
# 📁 MyDevVault - Alias y Funciones
# 📌 Archivo principal de configuración del kit.
# ==================================

# ===========================
# 🔑 Agente SSH
# ===========================

# La siguiente lógica inicia o comprueba si el agente SSH ya está corriendo.
# Esto evita tener que introducir la contraseña de la clave privada cada vez.
SSH_ENV="$HOME/.ssh/agent-info"

function start_agent {
    echo "🔑 Iniciando el agente SSH..."
    (umask 077; ssh-agent > "$SSH_ENV")
    source "$SSH_ENV" > /dev/null
    ssh-add
}

# Comprueba si el agente está corriendo
if [ -f "$SSH_ENV" ]; then
    source "$SSH_ENV" > /dev/null
    if ! kill -0 "$SSH_AGENT_PID" > /dev/null 2>&1; then
        echo "❌ Agente SSH existente no válido. Reiniciando."
        start_agent
    fi
else
    start_agent
fi

# 🚀 Alias de Git
# ==================================
# Alias de Git más comunes para agilizar el flujo de trabajo.
# Por favor, consulta los tipos de commits en la documentación para una mejor práctica.

alias gs='git status'
alias ga='git add .'
alias gai='git add -i'
alias gap='git add -p'
alias gdiff='git diff --color'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gll='git log --graph --pretty=format:"%C(yellow)%h%Creset %Cgreen%ad%Creset %C(blue)%an%Creset %C(auto)%d%Creset %s" --date=short'


# 🖥️ Alias de Sistema
# ==================================
# Alias del sistema para agilizar tareas comunes de la terminal.

alias ll='ls -l'
alias ls='ls -F --color=auto --show-control-chars'

# Alias de navegación
alias gr='cd ~/Desktop/GitHub'


# 🪟 Ejecutables de Windows bajo MSYS/Git Bash
# ==================================
# Permite ejecutar comandos de Windows con la entrada/salida de la terminal de Git Bash.

alias node='winpty node.exe'
alias php='winpty php.exe'
alias winget='winpty winget.exe'