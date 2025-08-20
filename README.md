# 🗄️ MyDevVault

Kit personalizable y modular para configurar y automatizar tu entorno de desarrollo y dejarlo listo para la productividad.

---

📘 **Propósito**
Este kit está diseñado para:

- 🔁 **Reutilizar** plantillas, fragmentos de código y configuraciones comunes entre diferentes proyectos.
- 📂 **Estandarizar** flujos de trabajo, estructuras de carpetas y convenciones de código para mantener la consistencia.
- 🔄 **Facilitar la migración o reinstalación** de tu entorno de desarrollo en nuevos equipos o sistemas operativos.
- 🤝 **Servir como base replicable y adaptable** para otros desarrolladores con flujos de trabajo similares o como punto de partida para sus propios kits personalizados.

---

## 🚀 **Guía de inicio rápido**

El script de instalación automatizado `setup.sh` se encarga de todo el proceso. Simplemente clona el repositorio y ejecútalo.

```bash
git clone http://github.com/DGJuancho/MyDevVault.git ~/MyDevVault
cd ~/MyDevVault
bash scripts/setup.sh
```

---

## 📂 **Estructura del Repositorio**

El kit está organizado de forma modular para una fácil navegación. Las siguientes son carpetas y archivos claves:

- `script/` — Contiene todos los scripts ejecutables (`setup`, `crear_proyecto`, entre otros).
- `docs/` — Toda la documentación detallada. **Es tu primera parada para entender el kit.**
- `config/` — Archivos de configuración de ejemplo (.gitignore_global, .gitconfig).
- `templates/` — Plantillas base para proyectos.
- `snippets/` — Fragmentos de código reutilizables.
- `aliases.sh` — Archivo maestro con todos los alias de la terminal.
- `CHANGELOG.md` — Historial de cambios del kit.

---

👤 **Autoría**
Desarrollado y mantenido por [@DGJuancho](https://github.com/DGJuancho)

---

🙌 Contribuciones
Este repositorio acepta contribuciones. Si deseas colaborar, por favor, lee nuestra [guía de convenciones](docs/convenciones.md) y usa el template de Pull Request.
