# ⚙️ Configuración recomendada para Git

Este documento te guía para configurar Git y tu entorno para trabajar con MyDevVault.

## 🔒 Ignorar archivos globales

Asegúrate de que Git use tu archivo de ignorados global. Si ya seguiste la configuración de MyDevVault, ya está hecho.

Para verificar o configurar manualmente:

```bash
git config --global core.excludesFile ~/.gitignore_global
```

## ⚡ Activar alias útiles

Si ya configuraste tu shell con 'MyDevVault' (ejecutando `setup.sh`), los alias globales ya están disponibles y se cargan automáticamente al iniciar tu terminal.

## 🧩 Configuración de Git específica del proyecto (si aplica)

Aunque tu nombre de usuario y correo electrónico de Git se configuran globalmente durante el setup inicial de MyDevVault, puedes definir una identidad específica para un proyecto en particular si es necesario. Esto sobrescribirá la configuración global solo para ese repositorio.

```bash
# git config --local user.name "Tu Nombre"
# git config --local user.email "tu.email@example.com"
```

Para ver la configuración local de un repositorio, usa `git config --local --list`.
