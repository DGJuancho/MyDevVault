# 🛠️ Guía de `crear_proyecto`

Este documento detalla el uso del script `crear_proyecto.sh`, que facilita la creación de nuevos proyectos con una estructura profesional y consistente dentro del entorno del `MyDevVault`.

---

## 🎯 Objetivo

Generar automáticamente una carpeta de proyecto con una estructura modular, lista para iniciar un nuevo repositorio Git.

---

## 🗂️ Estructura típica generada

- `src/` → Código fuente
- `docs/` → Documentación del proyecto
- `tests/` → Pruebas automatizadas
- `README.md` → Descripción inicial del proyecto
- `LICENSE`, `.gitignore`, entre otros archivos, según la plantilla base.

---

## 💻 Uso del Script

Una vez que hayas ejecutado `setup.sh`, el script `crear_proyecto` estará disponible como un comando global en tu terminal.

```bash
crear_proyecto <nombre-del-proyecto>
```

**Ejemplo:**

```bash
crear_proyecto mi-nuevo-proyecto
```

El script creará una nueva carpeta con el nombre que especificaste dentro de tu directorio ~/Desktop/GitHub, inicializará un repositorio de Git y realizará el primer commit con la estructura base.

---

## ✍️ Personalización

Puedes adaptar el script para:

- Usar diferentes plantillas por lenguaje (por ejemplo, `python`, `php`).

- Incluir toolchains específicos (como `venv` para Python o `composer` para PHP).

- Añadir hooks de Git o configuraciones iniciales.

---

## 🔗 Archivos relacionados

[`templates/`](../templates): Plantillas de proyectos que puedes usar como base.
