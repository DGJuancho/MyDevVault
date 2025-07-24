# 🗄️ MyDevVault

Kit personalizable y modular para configurar y automatizar tu entorno de desarrollo y dejarlo listo para la productividad.

---

📦 **Contenido**

- `config/gitignore_global` — Reglas globales para ignorar archivos en Git.
- `config/gitconfig.example` — Configuración base de Git que puedes enlazar globalmente.
- `commit-style-guide.md` — Plantilla y guía para estandarizar los mensajes de commit.
- `aliases.sh` — Archivo maestro que contiene alias comunes de Git y la línea de comandos (CLI) para agilizar el flujo de trabajo.
- `git-setup.md` — Guía rápida para la configuración inicial de Git.
- 🗂️ `scripts/` — Carpeta que alberga herramientas automatizadas para la inicialización de proyectos, la configuración del entorno, y más.
- 📚 `docs/` — Contiene la documentación detallada de cada script, convenciones de desarrollo y pautas de uso.
- 🧩 `snippets/` — Colección de fragmentos de código reutilizables.
- 📄 `templates/` — Plantillas base para diversos tipos de archivos y estructuras de proyectos.

🚀 **Recomendación de uso (Primeras veces)**

Para poner en marcha tu entorno MyDevVault, sigue estos pasos:

1.  **Clonar el repositorio:**
    Clona este repositorio en tu equipo local en una ubicación de fácil acceso (ej. `git clone <URL_DEL_REPOSITORIO> ~/Desktop/GitHub/MyDevVault`).

2.  **Inicializar la estructura interna del kit:**
    Navega a la raíz del repositorio clonado (`cd ~/Desktop/GitHub/MyDevVault`) y ejecuta:

    ```bash
    bash scripts/init-mydevvault.sh
    ```

    _Este script asegurará la creación de las carpetas internas y la copia de plantillas básicas dentro del kit._

3.  **Configurar el entorno global y enlazar herramientas:**
    Desde la raíz del kit (`~/Desktop/GitHub/MyDevVault`), ejecuta el script principal de configuración:

    ```bash
    bash scripts/setup.sh
    ```

    \*Este script configurará Git globalmente (enlazando `.gitconfig` y `.gitignore_global`), creará enlaces simbólicos en `~/bin` para que puedas ejecutar comandos como `setup`, `init-mydevvault`, y `crear_proyecto` desde cualquier lugar de tu terminal, y ajustará tus archivos de shell (`.bashrc`, `.bash_profile`). **Requiere ejecución como administrador la primera vez para crear los enlaces simbólicos globales.\***

4.  **Reiniciar la terminal:**
    Cierra y vuelve a abrir tu terminal (Git Bash) para que los cambios en el `PATH` y los alias se apliquen completamente.

5.  **Revisar la documentación:**
    Consulta la carpeta `docs/` para obtener una guía detallada sobre cómo personalizar la configuración, usar los scripts y entender el flujo de trabajo de MyDevVault.

📘 **Propósito**
Este kit está diseñado para:

- 🔁 **Reutilizar** plantillas, fragmentos de código y configuraciones comunes entre diferentes proyectos.
- 📂 **Estandarizar** flujos de trabajo, estructuras de carpetas y convenciones de código para mantener la consistencia.
- 🔄 **Facilitar la migración o reinstalación** de tu entorno de desarrollo en nuevos equipos o sistemas operativos.
- 🤝 **Servir como base replicable y adaptable** para otros desarrolladores con flujos de trabajo similares o como punto de partida para sus propios kits personalizados.

👤 **Autoría**
Desarrollado y mantenido por [@DGJuancho](https://github.com/DGJuancho)

💼 **Aunque fue creado con fines personales, este repositorio está estructurado para ser replicable, escalable y útil como referencia para otros desarrolladores.**

📌 **Versiones**
**v1.0 (2025-07-24):** Reconstrucción desde cero del kit MyDevVault. Establecimiento de scripts para inicialización de kit, creación de proyectos y configuración de entorno. Se añade manejo robusto de enlaces simbólicos y PATH.
➕ Ver historial completo en `CHANGELOG.md`

🙌 Contribuciones
Este repositorio acepta contribuciones a través de pull requests.
Todas las propuestas serán revisadas antes de ser integradas a la rama principal (`main`).
Si deseas colaborar, por favor crea un PR claro y bien documentado. ¡Gracias por tu interés!
