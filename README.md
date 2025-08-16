# Agentforce DX
¡Bienvenido al ecosistema de **Agentforce DX**!
Aquí encontrarás todo lo necesario para iniciar, desarrollar y desplegar proyectos de IA y aplicaciones en Salesforce. Este repositorio centraliza múltiples proyectos Salesforce DX, cada uno con su propio enfoque y utilidades, para acelerar el desarrollo y la innovación en la plataforma.

## Proyectos Incluidos
- **Housing Market Dashboard** (ModelsAPILWC): Aplicación de análisis inmobiliario con IA generativa.
- **BOTanicals**: Plantilla base Salesforce DX lista para desarrollo, con herramientas modernas y ejemplos.

## Housing Market Dashboard
Este proyecto demuestra cómo implementar inteligencia artificial generativa en aplicaciones de Salesforce para el análisis de datos inmobiliarios.
![Housing Market Dashboard](image.png)

### 📊 Descripción del proyecto
Housing Market Dashboard es una aplicación basada en Lightning Web Components (LWC) que utiliza la API de AI Platform para analizar datos del mercado inmobiliario y generar resúmenes intuitivos. La aplicación toma datos detallados de condados y proporciona un análisis desde la perspectiva de un corredor de bienes raíces.

### 🛠️ Componentes Clave
- **LWC:** `housing-dashboard.html`
  - Interfaz de usuario interactiva para visualizar los análisis generados por IA.
  - Diseño responsivo con indicadores de carga para una mejor experiencia de usuario.
  - Contiene el botón "Analyze" para iniciar el proceso de análisis.
- **Clases de Apex:**
  - `DashboardController.cls`: Facilita la comunicación con la API de AI Platform para generar resúmenes de datos. Utiliza el modelo GPT-3.5 Turbo para el análisis.
  - `HousingData.cls`: Almacena una constante con datos JSON de mercados inmobiliarios de varios condados, incluyendo estadísticas como ventas, precios medianos y asequibilidad.

## BOTanicals
**BOTanicals** es una plantilla base para proyectos Salesforce DX, ideal para iniciar nuevos desarrollos en la plataforma. Incluye:
- Estructura estándar de metadatos Salesforce (Apex, LWC, Aura, objetos, permisos, etc.).
- Configuración avanzada de ESLint y Prettier para mantener la calidad y formato del código.
- Soporte para pruebas unitarias con Jest (`sfdx-lwc-jest`).
- Scripts de ejemplo en Apex y SOQL para pruebas rápidas.
- Archivos de configuración para VSCode y Husky para hooks de git.
- Listo para extender y personalizar según las necesidades del usuario.

## 🚀 Características Generales
- Análisis de datos en tiempo real y generación de resúmenes bajo demanda (Housing Market Dashboard).
- Plantilla lista para desarrollo ágil y colaborativo (BOTanicals).
- Integración con AI Platform y modelos GPT para análisis avanzados.
- Presentación clara de información compleja en un formato fácil de entender.

## 💻 Tecnologías
- Lightning Web Components (LWC)
- Apex
- AI Platform
- JSON para la estructura de datos
- Salesforce Lightning Design System (SLDS)
- Herramientas de calidad y automatización (ESLint, Prettier, Jest, Husky)

## 🔧 Instalación y Uso
1. Clona este repositorio en tu entorno de desarrollo Salesforce DX.
2. Despliega los componentes en el entorno de destino utilizando SFDX.
3. Añade el componente LWC correspondiente a tu aplicación o página Lightning.
4. Navega al componente en tu aplicación Salesforce.
5. Haz clic en el botón "Analyze" (si aplica) para generar un resumen detallado.
6. Revisa el análisis generado por la IA o utiliza la plantilla para tu propio desarrollo.

## 📝 Contribuciones y Desarrollo
¿Interesado en contribuir o extender este ecosistema? ¡Tus aportes son bienvenidos! Por favor, sigue estas pautas:
- Haz fork del repositorio.
- Crea una rama para tu característica (git checkout -b feature/amazing-feature).
- Haz commit de tus cambios (git commit -m 'Add some amazing feature').
- Haz push a la rama (git push origin feature/amazing-feature).
- Abre un Pull Request.

## Licencia
Este proyecto está licenciado bajo los términos de la Licencia MIT.