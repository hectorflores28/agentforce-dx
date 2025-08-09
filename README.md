# Agentforce DX
¡Bienvenido al ecosistema de **Agentforce DX**! 
Aquí encontrarás todo lo necesario para iniciar, desarrollar y desplegar proyectos de IA en Salesforce.

## Housing Market Dashboard
Este proyecto demuestra cómo implementar inteligencia artificial generativa en aplicaciones de Salesforce para el análisis de datos inmobiliarios.
![Housing Market Dashboard](image.png)

### 📊 Descripción del proyecto
Housing Market Dashboard es una aplicación basada en Lightning Web Components (LWC) que utiliza la API de AI Platform para analizar datos del mercado inmobiliario y generar resúmenes intuitivos. La aplicación toma datos detallados de condados y proporciona un análisis desde la perspectiva de un corredor de bienes raíces.

### 🛠️ Componentes Clave
LWC: housing-dashboard.html
-    Interfaz de usuario interactiva para visualizar los análisis generados por IA.
-    Diseño responsivo con indicadores de carga para una mejor experiencia de usuario.
-    Contiene el botón "Analyze" para iniciar el proceso de análisis.
Clases de Apex:
-    DashboardController.cls: Facilita la comunicación con la API de AI Platform para generar resúmenes de datos. Utiliza el modelo GPT-3.5 Turbo para el análisis.
-    HousingData.cls: Almacena una constante con datos JSON de mercados inmobiliarios de varios condados, incluyendo estadísticas como ventas, precios medianos y asequibilidad.

### 🚀 Características
Análisis de datos en tiempo real: Genera resúmenes de mercados inmobiliarios bajo demanda.
Interfaz Intuitiva: Presentación clara de información compleja en un formato fácil de entender.
Integración con AI Platform: Utiliza el modelo GPT-3.5 Turbo para crear análisis profesionales y relevantes.

### 💻 Tecnologías
- Lightning Web Components (LWC)
- Apex
- AI Platform
- JSON para la estructura de datos
- Salesforce Lightning Design System (SLDS)

### 🔧 Instalación y Uso
1. Clona este repositorio en tu entorno de desarrollo Salesforce DX.
2. Despliega los componentes en el entorno de destino utilizando SFDX.
3. Añade el componente LWC housing-dashboard a tu aplicación o página Lightning.
4. Navega al componente en tu aplicación Salesforce.
5. Haz clic en el botón "Analyze" para generar un resumen detallado del mercado inmobiliario.
6. Revisa el análisis generado por la IA, que resalta las tendencias clave y conclusiones sobre los datos.

### 📝 Contribuciones y Desarrollo
¿Interesado en contribuir o extender este proyecto? ¡Tus aportes son bienvenidos! Por favor, sigue estas pautas:
- Haz fork del repositorio.
- Crea una rama para tu característica (git checkout -b feature/amazing-feature).
- Haz commit de tus cambios (git commit -m 'Add some amazing feature').
- Haz push a la rama (git push origin feature/amazing-feature).
- Abre un Pull Request.

### Licencia
Este proyecto está licenciado bajo los términos de la Licencia MIT.