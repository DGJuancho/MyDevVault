# 🧾 Convenciones y Guías de Estilo

Este documento describe las convenciones de desarrollo y el flujo de trabajo para mantener un historial de Git limpio, coherente y fácil de leer en el kit `MyDevVault`.

---

## ✍️ Mensajes de commit

Se adopta una estructura enriquecida con emojis para facilitar la lectura del historial y expresar claramente la intención de cada cambio.

### 📌 Formato recomendado

```bash
<tipo><emoji>(área): descripción breve y significativa
```

### 🎯 Ejemplos

```bash
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
