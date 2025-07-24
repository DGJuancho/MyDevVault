# 📄 CHANGELOG

Historial de cambios del proyecto `MyDevVault`.

---

## [v1.0] - 2025-07-24

### ✨ Nuevo

- Reconstrucción completa del kit MyDevVault desde cero, estableciendo una base robusta y modular.
- Estructura modular del repositorio con carpetas `scripts/`, `docs/`, `snippets/`, `templates/` y archivos de configuración.
- Scripts principales:
  - `setup.sh`: Script integral para la configuración inicial del entorno, gestión de enlaces simbólicos en `~/bin` y configuración de variables de shell (`PATH`, alias).
  - `init-mydevvault.sh`: Inicialización de la estructura interna base del kit.
  - `crear_proyecto.sh`: Creación automatizada de nuevos proyectos con una estructura profesional predefinida.
  - `link-scripts.sh`: Herramienta interna para la gestión de enlaces simbólicos multiplataforma.
- Alias personalizados para Git y CLI (`aliases.sh`) cargados automáticamente en el entorno de shell.
- Documentación detallada en `docs/` para cada script y componentes del kit.
- Guía de estilo para mensajes de commit (`commit-style-guide.md`) que promueve una convención uniforme.
- Configuración global de Git (`git-setup.md`) con recomendaciones para el entorno de desarrollo.
- Manejo robusto de enlaces simbólicos y configuración de permisos para una integración fluida en sistemas Windows/WSL.

---

## 📌 Notas

- Esta versión marca el primer hito estable del kit MyDevVault, enfocado en la automatización del setup del entorno.
- Próximas versiones incluirán mejoras en la automatización de flujos de trabajo, validaciones de scripts, y la expansión de plantillas específicas por lenguaje o framework.
