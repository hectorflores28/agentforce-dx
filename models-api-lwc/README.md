# Housing Market Dashboard - Models API LWC

## 📊 Descripción del Proyecto

**Housing Market Dashboard** es una aplicación Salesforce DX que demuestra la integración de inteligencia artificial generativa con Lightning Web Components (LWC) para el análisis de datos inmobiliarios. La aplicación utiliza la API de AI Platform de Salesforce para generar análisis automáticos de mercados inmobiliarios desde la perspectiva de un corredor de bienes raíces.

### 🎯 Objetivo
Proporcionar una interfaz intuitiva que permita a los usuarios obtener análisis detallados y contextualizados de datos del mercado inmobiliario utilizando IA generativa, específicamente el modelo GPT-3.5 Turbo.

## 🏗️ Arquitectura del Proyecto

### Componentes Principales

#### 1. **Lightning Web Component (LWC)**
- **`modelsAPIDashboard`**: Componente principal que proporciona la interfaz de usuario
  - **HTML**: Interfaz responsiva con chat-like interface
  - **JavaScript**: Lógica de comunicación con Apex y manejo de estados
  - **CSS**: Estilos personalizados con Salesforce Lightning Design System (SLDS)
  - **Tests**: Pruebas unitarias con Jest

#### 2. **Clases Apex**
- **`DashboardController.cls`**: Controlador principal que maneja la comunicación con la API de AI Platform
  - Método `createChatGenerations()`: Procesa datos y genera análisis mediante IA
  - Clase interna `ChatMessage`: Estructura para mensajes de chat
  - Integración con `aiplatform.ModelsAPI` para llamadas a GPT-3.5 Turbo

- **`HousingData.cls`**: Almacén de datos inmobiliarios
  - Constante `jsonString`: Datos JSON de mercados inmobiliarios de múltiples condados
  - Incluye métricas como ventas, precios medianos, permisos de construcción, y índices de asequibilidad

### 📁 Estructura del Proyecto

```
models-api-lwc/
├── force-app/main/default/
│   ├── classes/
│   │   ├── DashboardController.cls
│   │   ├── DashboardController.cls-meta.xml
│   │   ├── HousingData.cls
│   │   └── HousingData.cls-meta.xml
│   └── lwc/
│       └── modelsAPIDashboard/
│           ├── modelsAPIDashboard.html
│           ├── modelsAPIDashboard.js
│           ├── modelsAPIDashboard.css
│           ├── modelsAPIDashboard.js-meta.xml
│           └── __tests__/
│               └── modelsAPIDashboard.test.js
├── scripts/
│   ├── apex/
│   └── soql/
├── config/
├── .husky/
├── package.json
├── eslint.config.js
├── jest.config.js
└── sfdx-project.json
```

## 🚀 Características

### ✨ Funcionalidades Principales
- **Análisis Automático**: Generación de análisis inmobiliario mediante IA
- **Interfaz Chat-like**: Experiencia de usuario intuitiva con indicadores de carga
- **Datos en Tiempo Real**: Procesamiento de datos inmobiliarios actualizados
- **Perspectiva Profesional**: Análisis desde el punto de vista de un corredor de bienes raíces

### 📊 Datos Incluidos
- **Métricas por Condado**: Ventas, precios medianos, permisos de construcción
- **Análisis Temporal**: Cambios por trimestre y año
- **Índices de Asequibilidad**: HAI para compradores medianos y primerizos
- **Múltiples Condados**: Datos de diversos mercados inmobiliarios

### 🛠️ Herramientas de Desarrollo
- **ESLint**: Configuración avanzada para Apex, LWC y Aura
- **Prettier**: Formateo automático de código
- **Jest**: Framework de pruebas unitarias
- **Husky**: Hooks de Git para automatización
- **Lint-staged**: Validación de código antes de commits

## 🔧 Instalación y Configuración

### Prerrequisitos
- Salesforce CLI
- Node.js (versión 16 o superior)
- Acceso a un org de Salesforce con AI Platform habilitado

### Pasos de Instalación

1. **Clonar el proyecto**
   ```bash
   git clone <repository-url>
   cd models-api-lwc
   ```

2. **Instalar dependencias**
   ```bash
   npm install
   ```

3. **Configurar el org de destino**
   ```bash
   sfdx force:auth:web:login -a YourOrgAlias
   ```

4. **Desplegar el proyecto**
   ```bash
   sfdx force:source:deploy -p force-app/main/default
   ```

5. **Asignar permisos** (si es necesario)
   ```bash
   sfdx force:user:permset:assign -n YourPermissionSet
   ```

### Configuración de AI Platform

1. **Habilitar AI Platform** en tu org de Salesforce
2. **Configurar el modelo GPT-3.5 Turbo** (`sfdc_ai__DefaultGPT35Turbo`)
3. **Verificar permisos** de acceso a la API de AI Platform

## 💻 Uso

### Después del Despliegue

1. **Navegar al componente** en tu aplicación Salesforce
2. **Agregar el componente** a una página Lightning o App Page
3. **Hacer clic en "Analyze"** para generar el análisis
4. **Revisar el análisis** generado por la IA

### Personalización

- **Modificar datos**: Editar `HousingData.cls` para incluir nuevos condados o métricas
- **Ajustar prompts**: Modificar las instrucciones en `DashboardController.cls`
- **Personalizar UI**: Editar los archivos HTML y CSS del componente LWC

## 🧪 Pruebas

### Ejecutar Pruebas Unitarias
```bash
npm run test:unit
```

### Pruebas con Cobertura
```bash
npm run test:unit:coverage
```

### Pruebas en Modo Watch
```bash
npm run test:unit:watch
```

## 🔍 Desarrollo

### Comandos Útiles

```bash
# Linting
npm run lint

# Formateo de código
npm run prettier

# Verificar formato
npm run prettier:verify

# Desplegar cambios
sfdx force:source:deploy -p force-app/main/default

# Recuperar metadatos
sfdx force:source:retrieve -p force-app/main/default
```

### Flujo de Desarrollo

1. **Crear rama** para nueva funcionalidad
2. **Desarrollar** con validación automática (ESLint + Prettier)
3. **Ejecutar pruebas** antes de commit
4. **Hacer commit** (Husky ejecutará validaciones automáticamente)
5. **Desplegar** cambios al org de desarrollo

## 📋 Tecnologías Utilizadas

- **Salesforce DX**: Framework de desarrollo
- **Lightning Web Components (LWC)**: Componentes web modernos
- **Apex**: Lógica de negocio en el servidor
- **AI Platform**: Integración con modelos de IA generativa
- **GPT-3.5 Turbo**: Modelo de lenguaje para análisis
- **Salesforce Lightning Design System (SLDS)**: Framework de diseño
- **Jest**: Framework de pruebas
- **ESLint + Prettier**: Calidad y formato de código
- **Husky**: Automatización de Git hooks

## 🤝 Contribución

### Guías de Contribución

1. **Fork** del repositorio
2. **Crear rama** para tu feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** cambios (`git commit -m 'Add some AmazingFeature'`)
4. **Push** a la rama (`git push origin feature/AmazingFeature`)
5. **Abrir Pull Request**

### Estándares de Código

- Seguir las reglas de ESLint configuradas
- Usar Prettier para formateo automático
- Escribir pruebas unitarias para nuevas funcionalidades
- Documentar cambios significativos

## 📄 Licencia

Este proyecto está licenciado bajo la Licencia MIT.

## 🔗 Enlaces Relacionados

- [Documentación de Salesforce DX](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/)
- [Guía de Lightning Web Components](https://developer.salesforce.com/docs/component-library/documentation/en/lwc)
- [AI Platform Documentation](https://developer.salesforce.com/docs/atlas.en-us.ai_platform.meta/ai_platform/)
- [Salesforce Lightning Design System](https://www.lightningdesignsystem.com/)

---

**Desarrollado como parte del ecosistema Agentforce DX** 🚀
