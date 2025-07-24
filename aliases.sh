# ==== Alias útiles de Git ====
alias gs='git status'                   # Ver estado del repositorio
alias ga='git add .'                   # Añadir todos los archivos modificados
alias gai='git add -i'                # Añadir archivos de forma interactiva (por número)
alias gap='git add -p'                # Añadir fragmentos de código (por bloque/hunk)
alias gdiff='git diff --color'        # Ver diferencias con resaltado antes del stage
alias gc='git commit -m'              # Commit con mensaje directo
alias gp='git push'                   # Enviar commits al repositorio remoto
alias gpl='git pull'                  # Traer actualizaciones del repositorio remoto
alias gl='git log --oneline --graph --decorate'  # Historial compacto y visual
alias gll='git log --graph --pretty=format:"%C(yellow)%h%Creset %Cgreen%ad%Creset %C(blue)%an%Creset %C(auto)%d%Creset %s" --date=short'    # visualización ampliada más detalles (autor, fecha, mensaje)ls


# ==== Alias de sistema ====
alias ll='ls -l'                                      # Listado largo de archivos
alias ls='ls -F --color=auto --show-control-chars'    # Listado con formato visual

# ==== Ejecutables Windows bajo MSYS/Git Bash ====
alias node='winpty node.exe'
alias php='winpty php.exe'
alias winget='winpty winget.exe'
