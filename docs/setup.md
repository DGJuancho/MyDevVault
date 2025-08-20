# ⚙️ Guía de Setup

Este documento detalla el proceso de instalación automatizado de MyDevVault.

---

## 🎯 Objetivo

El script `setup.sh` está diseñado para:

- **Instalación de Scripts:** Copiar los scripts ejecutables (`crear_proyecto`, `init-mydevvault`, `uninstall`) a un directorio accesible desde cualquier lugar de tu terminal.
- **Configuración del Entorno:** Configurar el `PATH` de tu shell para que los scripts sean reconocidos.
- **Carga de Alias:** Configurar tu perfil de shell (`.bashrc` o `.bash_profile`) para cargar automáticamente todos los alias y funciones definidos en tu archivo `~/.config/mydevvault/aliases.sh`.

---

## 💻 Uso del Script

El proceso de instalación se realiza en un solo paso, lo cual simplifica enormemente el setup.

1.  **Navega a la raíz del repositorio**

2.  **Ejecuta el script de setup**
    ```bash
    bash scripts/setup.sh
    ```

El script te guiará a través de la instalación y mostrará mensajes de éxito o advertencias si ya hay configuraciones existentes.

---

## ⚙️ Configuración del Shell

El script modificará tus archivos de perfil (`.bashrc`, `.bash_profile`, etc.) para añadir dos líneas clave:

1.  **Añadir la carpeta `~/bin` al `PATH`**.
2.  **Cargar el archivo `aliases.sh`** desde la nueva ubicación `~/.config/mydevvault/aliases.sh`.

Esto asegura que los alias y scripts de MyDevVault estén siempre disponibles cada vez que abres tu terminal.

---

## 🗑️ Desinstalación

Para revertir completamente los cambios realizados por `setup.sh`, puedes usar el script de desinstalación.

```bash
bash scripts/uninstall.sh
```
