# 🛠️ Script: crear_proyecto.sh

Este script facilita la creación de proyectos nuevos con una estructura profesional y consistente dentro del entorno del `MyDevVault`.

---

## 🎯 Objetivo

Generar automáticamente una carpeta de proyecto con estructura modular, permitiendo seleccionar nombre, lenguaje base o tipo de plantilla (si aplica).

---

## 🗂️ Estructura típica generada

- `src/` → Código fuente
- `docs/` → Documentación del proyecto
- `tests/` → Pruebas automatizadas
- `README.md` → Descripción inicial del proyecto
- `LICENSE`, `.gitignore`, `setup.sh`, entre otros según plantilla

> La estructura puede variar según lo que hayas definido dentro del script o lo que copies desde plantillas prediseñadas.

---

## 🧪 Uso básico

```bash
bash crear_proyecto.sh
```

> El script puede interactuar contigo y pedir el nombre del proyecto o aceptar argumentos desde línea de comandos (dependiendo de cómo esté programado).

---

## 💬 Opciones comunes (si están implementadas)

- `-n <nombre>` → Define el nombre del proyecto
- `-l <lenguaje>` → Selecciona la plantilla base: `python`, `java`, etc.
- `-d <directorio>` → Ruta de destino donde crear el proyecto

---

## ✏️ Personalización

Puedes adaptar el script para:

- Usar diferentes plantillas por lenguaje
- Incluir toolchains específicos (venv, requirements.txt, build.gradle, etc.)
- Añadir hooks de Git o configuración inicial (como pre-commits o scripts de verificación)

---

## ⚠️ Consideraciones

- Asegúrate de ejecutar el script desde la raíz del kit
- Evita sobrescribir carpetas con el mismo nombre (el script puede validar esto o pedir confirmación)
- Revisa que las rutas de plantillas apunten correctamente al directorio templates/

---

## 🔗 Archivos relacionados

- [`./setup.md`](./setup.md): vincula configuraciones globales del entorno
- [`./init-mydevvault.md`](./init-mydevvault.md): inicializa la estructura base del kit
