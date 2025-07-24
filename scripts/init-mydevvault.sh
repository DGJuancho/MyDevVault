#!/bin/bash

# Este script inicializa o regenera la estructura interna básica del
# MyDevVault en el directorio actual.
# Se espera que se ejecute desde la raíz del repositorio MyDevVault.

echo "🚀 Asegurando la estructura base de MyDevVault en: $(pwd)"

# 📦 Crear estructura de carpetas si no existen (snippets, templates)
mkdir -p "./snippets/{php,bash,markdown}"
mkdir -p "./templates"
echo "✅ Estructura de carpetas (snippets, templates) verificada/creada."

# 📄 commit-style-guide.md (Plantilla de guía de commits)
# Esta es una plantilla fundamental del kit, se recrea si es necesario
cat <<EOF > "./commit-style-guide.md"
# 🧱 Guía de estilo para mensajes de commit con emojis

Este documento establece una convención clara y concisa para los mensajes de commit, mejorando la legibilidad y el seguimiento del historial del proyecto.

---

## 📌 Estructura general
La estructura recomendada para tus mensajes de commit es:

\`<tipo>\`<emoji>(\`<área_afectada>\`): \`<descripción_breve_y_significativa>\`

- \`\*\*<tipo>\*\*\`: Indica la naturaleza del cambio (ej. \`feat\`, \`fix\`, \`docs\`).
- \`\*\*<emoji>\*\*\`: Un emoji visualmente representativo del tipo de cambio.
- \`\*\*(\`<área_afectada>\`)\*\* (Opcional): Un contexto opcional que especifica la parte del proyecto impactada (ej. \`api\`, \`login\`, \`scripts\`). Incluye paréntesis.
- \`\*\*<descripción_breve_y_significativa>\*\*\`: Un resumen conciso del cambio en no más de 50-70 caracteres.

---

## 🧩 Tipos comunes y emojis sugeridos

Aquí tienes una lista de los tipos de commit más usados y sus emojis asociados:

- \`\*\*feat✨\*\*\`: Una nueva característica o funcionalidad.
- \`\*\*fix🐛\*\*\`: Una corrección de un error (bug).
- \`\*\*refactor🔁\*\*\`: Un cambio que no añade funcionalidad ni corrige errores, sino que mejora el código (ej. refactorización).
- \`\*\*chore🧱\*\*\`: Cambios de mantenimiento que no afectan el código fuente o la funcionalidad (ej. actualizaciones de dependencias, configuraciones de build).
- \`\*\*docs📝\*\*\`: Cambios relacionados con la documentación (ej. READMEs, comentarios en código).
- \`\*\*style🎨\*\*\`: Cambios que no afectan el significado del código (ej. formato, espacios en blanco, punto y coma).
- \`\*\*test✅\*\*\`: Adición o modificación de pruebas.
- \`\*\*perf⚡\*\*\`: Cambios que mejoran el rendimiento.
- \`\*\*build🏗️\*\*\`: Cambios que afectan el sistema de compilación o dependencias externas (ej. npm, gulp).
- \`\*\*ci⚙️\*\*\`: Cambios en la configuración y scripts de CI (Continuous Integration).
- \`\*\*revert⏪\*\*\`: Reversión de un commit anterior.

---

## 🧠 Ejemplos

- \`feat✨(api): agrega nuevo endpoint para autenticación de usuarios\`
- \`fix🐛(login): corrige validación de credenciales en el formulario de acceso\`
- \`chore🧱(estructura): reorganiza carpetas de configuración del proyecto\`
- \`docs📝(README): actualiza sección de uso e instalación del kit\`
- \`refactor🔁(auth): simplifica lógica de manejo de tokens JWT\`
- \`test✅(users): añade pruebas unitarias para el servicio de usuarios\`

---

## 🧰 Atajo útil

Para agilizar tus commits, puedes usar este alias de Git (ya incluido si usaste \`setup.sh\`):

\`\`\`bash
alias gc='git commit -m'
\`\`\`

Así, un commit se vería como: \`gc "feat✨(dashboard): implementa widget de estadísticas"\`
EOF
echo "✅ commit-style-guide.md (plantilla) creada/actualizada."

# 📄 aliases.sh (La versión principal de los alias del kit)
# NOTA: Este es el archivo maestro de aliases, no una copia para un proyecto nuevo.
cat <<EOF > "./aliases.sh"
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
EOF
echo "✅ aliases.sh (maestro del kit) creado/actualizado."

# 📄 git-setup.md (Guía de setup de Git para este kit)
cat <<EOF > "./git-setup.md"
# ⚙️ Configuración recomendada para Git

Este documento te guía para configurar Git y tu entorno para trabajar con MyDevVault.

## 🔒 Ignorar archivos globales

Asegúrate de que Git use tu archivo de ignorados global. Si ya seguiste la configuración de MyDevVault, ya está hecho.

Para verificar o configurar manualmente:

\`\`\`bash
git config --global core.excludesFile ~/.gitignore_global
\`\`\`

## ⚡ Activar alias útiles
Si ya configuraste tu shell con 'MyDevVault' (ejecutando \`setup.sh\`), los alias globales ya están disponibles y se cargan automáticamente al iniciar tu terminal.

## 🧩 Configuración de Git específica del proyecto (si aplica)
Aunque tu nombre de usuario y correo electrónico de Git se configuran globalmente durante el setup inicial de MyDevVault, puedes definir una identidad específica para un proyecto en particular si es necesario. Esto sobrescribirá la configuración global solo para ese repositorio.

\`\`\`bash
# git config --local user.name "Tu Nombre"
# git config --local user.email "tu.email@example.com"
\`\`\`
Para ver la configuración local de un repositorio, usa \`git config --local --list\`.
EOF
echo "✅ git-setup.md (guía del kit) creada/actualizada."

# 📄 README.md (README principal para el kit)
# Solo si no existe o se desea sobrescribir para regenerar la plantilla
if [ ! -f "./README.md" ]; then
    cat <<EOF > "./README.md"
# 🗄️ MyDevVault

Kit personalizable y modular para configurar y automatizar tu entorno de desarrollo y dejarlo listo para la productividad.

---

📦 \`\*\*Contenido\*\*\`
- \`config/gitignore_global\` — Reglas globales para ignorar archivos en Git.
- \`config/gitconfig.example\` — Configuración base de Git que puedes enlazar globalmente.
- \`commit-style-guide.md\` — Plantilla y guía para estandarizar los mensajes de commit.
- \`aliases.sh\` — Archivo maestro que contiene alias comunes de Git y la línea de comandos (CLI) para agilizar el flujo de trabajo.
- \`git-setup.md\` — Guía rápida para la configuración inicial de Git.
- 🗂️ \`scripts/\` — Carpeta que alberga herramientas automatizadas para la inicialización de proyectos, la configuración del entorno, y más.
- 📚 \`docs/\` — Contiene la documentación detallada de cada script, convenciones de desarrollo y pautas de uso.
- 🧩 \`snippets/\` — Colección de fragmentos de código reutilizables.
- 📄 \`templates/\` — Plantillas base para diversos tipos de archivos y estructuras de proyectos.

🚀 \`\*\*Recomendación de uso (Primeras veces)\*\*\`

Para poner en marcha tu entorno MyDevVault, sigue estos pasos:

1.  \`\*\*Clonar el repositorio:\*\*\`
    Clona este repositorio en tu equipo local en una ubicación de fácil acceso (ej. \`git clone <URL_DEL_REPOSITORIO> ~/Desktop/GitHub/MyDevVault\`).

2.  \`\*\*Inicializar la estructura interna del kit:\*\*\`
    Navega a la raíz del repositorio clonado (\`cd ~/Desktop/GitHub/MyDevVault\`) y ejecuta:
    \`\`\`bash
    bash scripts/init-mydevvault.sh
    \`\`\`
    \*Este script asegurará la creación de las carpetas internas y la copia de plantillas básicas dentro del kit.\*

3.  \`\*\*Configurar el entorno global y enlazar herramientas:\*\*\`
    Desde la raíz del kit (\`~/Desktop/GitHub/MyDevVault\`), ejecuta el script principal de configuración:
    \`\`\`bash
    bash scripts/setup.sh
    \`\`\`
    \*Este script configurará Git globalmente (enlazando \`.gitconfig\` y \`.gitignore_global\`), creará enlaces simbólicos en \`~/bin\` para que puedas ejecutar comandos como \`setup\`, \`init-mydevvault\`, y \`crear_proyecto\` desde cualquier lugar de tu terminal, y ajustará tus archivos de shell (\`.bashrc\`, \`.bash_profile\`). \`\*\*Requiere ejecución como administrador la primera vez para crear los enlaces simbólicos globales.\*\*\`\*

4.  \`\*\*Reiniciar la terminal:\*\*\`
    Cierra y vuelve a abrir tu terminal (Git Bash) para que los cambios en el \`PATH\` y los alias se apliquen completamente.

5.  \`\*\*Revisar la documentación:\*\*\`
    Consulta la carpeta \`docs/\` para obtener una guía detallada sobre cómo personalizar la configuración, usar los scripts y entender el flujo de trabajo de MyDevVault.

📘 \`\*\*Propósito\*\*\`
Este kit está diseñado para:
- 🔁 \`\*\*Reutilizar\*\*\` plantillas, fragmentos de código y configuraciones comunes entre diferentes proyectos.
- 📂 \`\*\*Estandarizar\*\*\` flujos de trabajo, estructuras de carpetas y convenciones de código para mantener la consistencia.
- 🔄 \`\*\*Facilitar la migración o reinstalación\*\*\` de tu entorno de desarrollo en nuevos equipos o sistemas operativos.
- 🤝 \`\*\*Servir como base replicable y adaptable\*\*\` para otros desarrolladores con flujos de trabajo similares o como punto de partida para sus propios kits personalizados.

👤 \`\*\*Autoría\*\*\`
Desarrollado y mantenido por [@DGJuancho](https://github.com/DGJuancho)

💼 \`\*\*Aunque fue creado con fines personales, este repositorio está estructurado para ser replicable, escalable y útil como referencia para otros desarrolladores.\*\*\`

📌 \`\*\*Versiones\*\*\`
\`\*\*v1.0 (2025-07-24):\*\*\` Reconstrucción desde cero del kit MyDevVault. Establecimiento de scripts para inicialización de kit, creación de proyectos y configuración de entorno. Se añade manejo robusto de enlaces simbólicos y PATH.
➕ Ver historial completo en \`CHANGELOG.md\`

🙌 \`\*\*Contribuciones\*\*\`
Este repositorio acepta contribuciones a través de pull requests.
Todas las propuestas serán revisadas antes de ser integradas a la rama principal (\`main\`).
Si deseas colaborar, por favor crea un PR claro y bien documentado. ¡Gracias por tu interés!
EOF
    echo "✅ README.md (plantilla) creada."
else
    echo "ℹ️  README.md ya existe. No se creó una nueva plantilla."
fi

# El .gitignore_global del kit está en la carpeta config/, no se genera aquí.
# Si la intención es que init-mydevvault.sh también cree la carpeta config/
# y sus archivos, se debería añadir esa lógica aquí.
# Por ahora, asumo que ya está en el repositorio clonado o que es manual.

# No se inicializa Git si ya es un repositorio Git, ni se hace commit inicial
# ya que este script está diseñado para *poblar* un repositorio existente (clonado o vacío).
if [ -d "./.git" ]; then
    echo "ℹ️  El directorio actual ya es un repositorio Git. No se inicializó de nuevo."
    echo "   Por favor, revisa los cambios generados y haz un commit si es necesario."
else
    echo "ℹ️  El directorio actual no es un repositorio Git. Si este es el 'MyDevVault' principal,"
    echo "   considera inicializar Git manualmente con 'git init' y hacer un commit de estos archivos."
fi

echo "🎉 La estructura interna de MyDevVault ha sido verificada/actualizada."
echo "   Recuerda que el próximo paso es crear y ejecutar 'scripts/setup.sh' (una vez que lo hayamos creado) desde la raíz del kit para configurar tu entorno global."