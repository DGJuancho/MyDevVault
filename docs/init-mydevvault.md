# 🛠️ Guía de `init-mydevvault`

Este documento describe el script `init-mydevvault.sh`, una herramienta auxiliar para la configuración interna del repositorio.

---

## 🎯 Objetivo

Recrear la estructura de carpetas y los archivos base de la plantilla del kit `MyDevVault` si por alguna razón no existen o fueron eliminados.

---

## 💻 Uso del script y Consideraciones

## 💻 Uso y Consideraciones

El script está diseñado para ser ejecutado directamente desde la raíz del repositorio.

```bash
bash scripts/init-mydevvault.sh
```

> **Nota:** La función principal de este script es recrear la estructura de carpetas y archivos base del kit. Si ya has ejecutado `setup.sh`, el cual maneja la configuración principal, no es necesario ejecutar este script a menos que hayas eliminado o movido la estructura de directorios internos.
