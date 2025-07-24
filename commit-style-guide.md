# 🧱 Guía de estilo para mensajes de commit con emojis

Este documento establece una convención clara y concisa para los mensajes de commit, mejorando la legibilidad y el seguimiento del historial del proyecto.

---

## 📌 Estructura general

La estructura recomendada para tus mensajes de commit es:

`<tipo><emoji>(<área_afectada>): <descripción_breve_y_significativa>`

- **`<tipo>`:** Indica la naturaleza del cambio (ej. `feat`, `fix`, `docs`).
- **`<emoji>`:** Un emoji visualmente representativo del tipo de cambio.
- **`(<área_afectada>)` (Opcional):** Un contexto opcional que especifica la parte del proyecto impactada (ej. `api`, `login`, `scripts`). Incluye paréntesis.
- **`<descripción_breve_y_significativa>`:** Un resumen conciso del cambio en no más de 50-70 caracteres.

---

## 🧩 Tipos comunes y emojis sugeridos

Aquí tienes una lista de los tipos de commit más usados y sus emojis asociados:

- **`feat✨`**: Una nueva característica o funcionalidad.
- **`fix🐛`**: Una corrección de un error (bug).
- **`refactor🔁`**: Un cambio que no añade funcionalidad ni corrige errores, sino que mejora el código (ej. refactorización).
- **`chore🧱`**: Cambios de mantenimiento que no afectan el código fuente o la funcionalidad (ej. actualizaciones de dependencias, configuraciones de build).
- **`docs📝`**: Cambios relacionados con la documentación (ej. READMEs, comentarios en código).
- **`style🎨`**: Cambios que no afectan el significado del código (ej. formato, espacios en blanco, punto y coma).
- **`test✅`**: Adición o modificación de pruebas.
- **`perf⚡`**: Cambios que mejoran el rendimiento.
- **`build🏗️`**: Cambios que afectan el sistema de compilación o dependencias externas (ej. npm, gulp).
- **`ci⚙️`**: Cambios en la configuración y scripts de CI (Continuous Integration).
- **`revert⏪`**: Reversión de un commit anterior.

---

## 🧠 Ejemplos

- `feat✨(api): agrega nuevo endpoint para autenticación de usuarios`
- `fix🐛(login): corrige validación de credenciales en el formulario de acceso`
- `chore🧱(estructura): reorganiza carpetas de configuración del proyecto`
- `docs📝(README): actualiza sección de uso e instalación del kit`
- `refactor🔁(auth): simplifica lógica de manejo de tokens JWT`
- `test✅(users): añade pruebas unitarias para el servicio de usuarios`

---

## 🧰 Atajo útil

Para agilizar tus commits, puedes usar este alias de Git (ya incluido si usaste `setup.sh`):

```bash
alias gc='git commit -m'
```

Así, un commit se vería como: `gc "feat✨(dashboard): implementa widget de estadísticas"`

---
