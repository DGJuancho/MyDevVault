# 🧾 Convenciones de desarrollo

Este documento recopila las convenciones de estilo adoptadas para mantener un flujo de trabajo limpio, claro y coherente en los proyectos dentro del `MyDevVault`.

---

## ✍️ Mensajes de commit

Se adopta una estructura enriquecida con emojis para facilitar la lectura del historial y expresar claramente la intención de cada cambio.

### 📌 Formato recomendado

```
<tipo><emoji>(área): descripción breve y significativa
```

### 🎯 Ejemplos

```
feat✨(api): agrega nuevo endpoint de autenticación
fix🐛(login): corrige validación de credenciales
docs📝(readme): mejora redacción del índice de contenidos
chore🧱(estructura): reorganiza carpetas base del kit
```

### 🧩 Tipos comunes y emojis sugeridos

| Tipo     | Emoji | Descripción                                         |
| -------- | ----- | --------------------------------------------------- |
| feat     | ✨    | Nueva funcionalidad                                 |
| fix      | 🐛    | Corrección de errores                               |
| refactor | 🔁    | Reorganización sin cambiar lógica                   |
| chore    | 🧱    | Cambios estructurales o de soporte                  |
| docs     | 📝    | Cambios en documentación                            |
| style    | 🎨    | Formato, estilo o linting                           |
| test     | ✅    | Pruebas o casos de prueba                           |
| perf     | ⚡    | Mejora de rendimiento                               |
| build    | 🏗️    | Cambios en el sistema de compilación o dependencias |
| ci       | ⚙️    | Cambios en la configuración y scripts de CI         |
| revert   | ⏪    | Reversión de un commit anterior                     |

> Puedes adaptarlo según tus necesidades: agregar tipos, ajustar emojis o definir nuevas áreas.

---

## 🛠️ Alias recomendados

Define atajos útiles en tu entorno para agilizar el flujo de trabajo con Git y la terminal:

### 🔧 Git

| Alias   | Comando                                 | Descripción                                       |
| ------- | --------------------------------------- | ------------------------------------------------- |
| `gs`    | `git status`                            | Ver estado del repositorio                        |
| `ga`    | `git add .`                             | Añadir todos los archivos modificados             |
| `gai`   | `git add -i`                            | Añadir archivos de forma interactiva (por número) |
| `gap`   | `git add -p`                            | Añadir fragmentos de código (por bloque/hunk)     |
| `gdiff` | `git diff --color`                      | Ver diferencias con resaltado antes del stage     |
| `gc`    | `git commit -m`                         | Commit con mensaje directo                        |
| `gp`    | `git push`                              | Enviar commits al repositorio remoto              |
| `gpl`   | `git pull`                              | Traer actualizaciones del repositorio remoto      |
| `gl`    | `git log --oneline --graph --decorate`  | Historial compacto y visual                       |
| `gll`   | `git log --graph --pretty=format:"..."` | Historial detallado con autor, fecha y ramas      |

### 🖥️ Sistema

| Alias | Comando                                   | Descripción                |
| ----- | ----------------------------------------- | -------------------------- |
| `ll`  | `ls -l`                                   | Listado largo de archivos  |
| `ls`  | `ls -F --color=auto --show-control-chars` | Listado con formato visual |

### 🪟 Ejecutables Windows bajo MSYS/Git Bash

| Alias    | Comando             | Descripción                                    |
| -------- | ------------------- | ---------------------------------------------- |
| `node`   | `winpty node.exe`   | Ejecutar Node.js con compatibilidad de consola |
| `php`    | `winpty php.exe`    | Ejecutar PHP con compatibilidad de consola     |
| `winget` | `winpty winget.exe` | Ejecutar Winget con compatibilidad de consola  |

> Todos estos alias están definidos en `aliases.sh` (en la raíz del kit) y se cargan automáticamente al ejecutar `link-scripts.sh`.

---

## 🗂️ Organización sugerida de ramas

- `main`: rama estable, siempre desplegable.
- `dev`: integración de nuevas funciones.
- `feature/<nombre>`: ramas para funcionalidades específicas.
- `fix/<nombre>`: correcciones de errores.

---

## 🔗 Archivos relacionados

- [`../commit-style-guide.md`](../commit-style-guide.md): plantilla de commits original generada por el script
- [`./setup.md`](./setup.md): configuración del entorno
- [`./init-mydevvault.md`](./init-mydevvault.md): estructura base del kit
