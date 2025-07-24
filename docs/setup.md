# ⚙️ Script: setup.sh

Este script automatiza la configuración inicial del entorno vinculando archivos clave mediante enlaces simbólicos y adaptándose al sistema operativo.

---

## 🧩 Funcionalidad principal

- Detecta el sistema operativo (Windows, Linux o macOS)
- Crea enlaces simbólicos a archivos como `.gitconfig`, `.bashrc`, `.gitignore_global` desde una carpeta de configuración centralizada (`config/`)
- Asegura una configuración consistente sin sobrescribir los archivos reales

---

## 📚 Archivos involucrados

- `config/gitconfig.example` → Enlazado como `~/.gitconfig`
- `config/aliases.sh` → Enlazado al archivo de inicialización del shell (`~/.bashrc`, `~/.zshrc`, etc.)
- `config/gitignore_global` → Enlazado como `~/.gitignore_global`
- Otros archivos de configuración que desees incluir en la carpeta `config/`

---

## 🚦 Compatibilidad con sistemas operativos

- 🪟 Windows: Usa `mklink` si se ejecuta en PowerShell o CMD
- 🐧 Linux/macOS: Usa `ln -s` para crear enlaces simbólicos

---

## 💻 Ejecución

```bash
bash setup.sh
```

---

## 📝 Consideraciones

- Ejecuta el script desde la raíz del repositorio
- Es posible que necesites permisos elevados si estás creando enlaces fuera del directorio del usuario
- Asegúrate de tener la carpeta `config/` y los archivos base previamente generados

---

## 🔧 Personalización

Puedes modificar el script para:

- Cambiar rutas de destino según tu estructura local
- Añadir enlaces a nuevos archivos de configuración
- Aplicar lógica para validar si un archivo ya existe o si el enlace ya está activo

---

## 📎 Archivos relacionados

- [`init-mydevvault.sh`](./init-mydevvault.md): para inicializar la estructura base del kit
- [`git-setup.md`](./git-setup.md): guía para aplicar configuraciones de Git
