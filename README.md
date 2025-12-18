# 📒 Notepases

Proyecto móvil desarrollado en **Flutter**.

> ⚠️ Este repositorio contiene únicamente el código fuente necesario para
> compilación y ejecución del proyecto.
> La lógica de negocio, decisiones de arquitectura y documentación técnica
> detallada se gestionan de forma privada.

---

## 🚀 Instalación

### 1. Clonar el repositorio
```bash
git clone https://github.com/Mario-Fernando24/notepases.git
cd notepases

2. Instalar dependencias
flutter pub get

3. Ejecutar la aplicación
flutter run

📦 Versionamiento

La versión de la aplicación se controla desde pubspec.yaml:

version: x.y.z+build

Tipos de commit permitidos y ejemplos
🔧 chore

Usado para mantenimiento general, configuración o documentación.

git commit -m "chore: update documentation"
git commit -m "chore: internal maintenance"

🐞 fix

Usado para correcciones internas o ajustes de estabilidad.

git commit -m "fix: stability improvements"
git commit -m "fix: minor issue resolved"

♻️ refactor

Usado cuando se modifica código interno sin cambiar el comportamiento visible.

git commit -m "refactor: internal cleanup"
git commit -m "refactor: code reorganization"

🧪 test

Usado para agregar o ajustar pruebas.

git commit -m "test: update test cases"
git commit -m "test: improve test coverage"

🚫 Tipos no permitidos

No se deben utilizar los siguientes tipos de commit:

feat

perf

docs

Mensajes que describan funcionalidades o flujos internos

🛡️ Regla de seguridad

Los mensajes de commit no deben revelar:

Lógica de negocio

Funcionalidades específicas

Decisiones de arquitectura

Detalles técnicos sensibles