# Agentforce DX 🚀

¡Bienvenido al ecosistema de **Agentforce DX**!

Este repositorio centraliza múltiples proyectos Salesforce DX especializados en inteligencia artificial y desarrollo moderno, cada uno con su propio enfoque y utilidades, para acelerar el desarrollo y la innovación en la plataforma Salesforce.

## 🎯 Proyectos Incluidos

### 1. **Agentforce DX - Resort Manager AI Agent** 🏖️
**Directorio:** `agentforcedx/`

Un agente de inteligencia artificial conversacional especializado en la gestión de resorts turísticos, utilizando las capacidades más avanzadas de Salesforce Einstein AI y Agentforce para automatizar y optimizar las operaciones de resorts.

**Características principales:**
- 🤖 **Bot de IA - Resort Manager**: Einstein Service Agent con plantilla AiCopilot__AgentforceAgent
- 📦 **GenAI Planner Bundle**: Planificador ReAct para optimización de operaciones
- 🔌 **5 Plugins Especializados**:
  - Activity Reservation Assistance 📅
  - Customer Complaint Handling 📝
  - Employee Schedule Management 👥
  - Service Quality Monitoring 📊
  - Inventory Status Updates 📦
- 🎯 **Caso de uso**: Coral Cloud Resorts - gestión automatizada de resorts turísticos

### 2. **Housing Market Dashboard** 📊
**Directorio:** `models-api-lwc/`

Aplicación de análisis inmobiliario con IA generativa que demuestra la integración de Lightning Web Components (LWC) con la API de AI Platform de Salesforce para el análisis de datos del mercado inmobiliario.

**Componentes clave:**
- 🏠 **LWC:** `modelsAPIDashboard` - Interfaz chat-like interactiva
- 🧠 **Apex:** `DashboardController.cls` - Integración con AI Platform y GPT-3.5 Turbo
- 📈 **Datos:** `HousingData.cls` - Datos JSON de mercados inmobiliarios de múltiples condados
- 📊 **Análisis**: Generación automática de análisis desde perspectiva de corredor de bienes raíces

### 3. **BOTanicals** 🌱
**Directorio:** `bot-anicals/`

Plantilla base moderna y completa para proyectos Salesforce DX, diseñada para acelerar el desarrollo de aplicaciones en la plataforma Salesforce con herramientas de desarrollo avanzadas y mejores prácticas integradas.

**Características:**
- 📦 **Estructura SFDX estándar** con configuración optimizada
- 🛠️ **Herramientas integradas**: ESLint, Prettier, Jest, Husky
- 🧪 **Testing Framework**: Configuración completa con `@salesforce/sfdx-lwc-jest`
- 🔧 **Git Hooks**: Automatización con Husky y lint-staged
- 📁 **Scripts de ejemplo**: Apex y SOQL para desarrollo rápido

### 4. **Apex Examples** 
**Directorio:** `apex-examples/`

Contiene proyectos de multiples apps asi como fragmentos de codigo Apex

**Características:**
- 📦 **Estructura SFDX estándar** con configuración optimizada
- 🛠️ **Herramientas integradas**: ESLint, Prettier, Jest, Husky
- 🧪 **Testing Framework**: Configuración completa con `@salesforce/sfdx-lwc-jest`
- 🔧 **Git Hooks**: Automatización con Husky y lint-staged
- 📁 **Scripts de ejemplo**: Apex y SOQL para desarrollo rápido

## 🚀 Características Generales del Ecosistema

### ✨ Tecnologías y Herramientas
- **Lightning Web Components (LWC)** - Componentes web modernos
- **Apex** - Lógica de negocio en el servidor
- **AI Platform** - Integración con modelos de IA generativa
- **Einstein Bots** - Agentes conversacionales inteligentes
- **GenAI Plugins** - Extensiones especializadas para IA
- **Salesforce Lightning Design System (SLDS)** - Framework de diseño
- **Jest** - Framework de pruebas unitarias
- **ESLint + Prettier** - Calidad y formato de código
- **Husky** - Automatización de Git hooks

### 🎯 Casos de Uso Especializados
- **Gestión de Resorts**: Automatización completa de operaciones turísticas
- **Análisis Inmobiliario**: IA generativa para análisis de mercados
- **Desarrollo Ágil**: Plantilla base para proyectos Salesforce DX

## 🔧 Instalación y Uso

### Prerrequisitos
- [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
- [Node.js](https://nodejs.org/) (versión 16 o superior)
- [VS Code](https://code.visualstudio.com/) con extensiones Salesforce

### Instalación por Proyecto

#### 1. Agentforce DX (Resort Manager)
```bash
cd agentforcedx
npm install
sfdx force:auth:web:login -a agentforcedx
sfdx force:source:deploy -p force-app/main/default
```

#### 2. Housing Market Dashboard
```bash
cd models-api-lwc
npm install
sfdx force:auth:web:login -a housing-dashboard
sfdx force:source:deploy -p force-app/main/default
```

#### 3. BOTanicals (Plantilla Base)
```bash
cd bot-anicals
npm install
sfdx force:auth:web:login -a botanicals
sfdx force:org:create -f config/project-scratch-def.json -a BOTanicalsScratch
sfdx force:source:deploy -p force-app
```

#### 4. Apex Examples
```bash
cd apex-examples/project/
npm install
sfdx force:auth:web:login -a apex-examples
sfdx force:org:create -f config/project-scratch-def.json -a Project
sfdx force:source:deploy -p force-app
```

## 📁 Estructura del Repositorio

```
agentforce-dx/
│ 
├── agentforcedx/                    # Resort Manager AI Agent
│  
├── models-api-lwc/                  # Housing Market Dashboard
│   
├── bot-anicals/                     # Plantilla Base
│   
├── apex-examples/                       # Directorio de Multiples Proyectos
│   
└ README.md                          # Este archivo
```

## 🛠️ Scripts Disponibles (por proyecto)

### Desarrollo
```bash
npm run lint                    # Ejecutar ESLint
npm run prettier               # Formatear código
npm run prettier:verify        # Verificar formato
```

### Testing
```bash
npm run test                   # Ejecutar todas las pruebas
npm run test:unit             # Pruebas unitarias
npm run test:unit:watch       # Pruebas en modo watch
npm run test:unit:coverage    # Pruebas con cobertura
```

## 🎯 Casos de Uso por Proyecto

### Agentforce DX - Resort Manager
- **Para Clientes**: Reservas de actividades, soporte al cliente, información del resort
- **Para Empleados**: Gestión de horarios, monitoreo de calidad, gestión de inventario
- **Canales Soportados**: Apple Business Chat, Facebook Messenger, WhatsApp, LINE, SMS

### Housing Market Dashboard
- **Análisis Automático**: Generación de análisis inmobiliario mediante IA
- **Interfaz Intuitiva**: Chat-like interface con indicadores de carga
- **Datos en Tiempo Real**: Procesamiento de datos inmobiliarios actualizados
- **Perspectiva Profesional**: Análisis desde punto de vista de corredor de bienes raíces

### BOTanicals
- **Nuevos Proyectos**: Base sólida para iniciar desarrollos Salesforce DX
- **Equipos Colaborativos**: Herramientas de calidad de código integradas
- **Desarrollo Ágil**: Testing automatizado y hooks de Git
- **Mejores Prácticas**: Configuración estándar con ESLint, Prettier, Jest

### apex-examples
- **Multiples Implementaciones**: Una base solida para empezar a implementar codigo en cualquier organización solo es adaptar y asegurarse que la solución y el mapeo es el adecuado.

## 🔍 Configuración Avanzada

### AI Platform (Housing Market Dashboard)
1. Habilitar AI Platform en tu org de Salesforce
2. Configurar el modelo GPT-3.5 Turbo (`sfdc_ai__DefaultGPT35Turbo`)
3. Verificar permisos de acceso a la API de AI Platform

### Einstein Bots (Agentforce DX)
1. Activar el bot "Resort Manager" desde Setup > Einstein Bots
2. Configurar canales de mensajería según necesidades
3. Personalizar variables de contexto y flujos de conversación

### Herramientas de Desarrollo (Todos los proyectos)
- **VS Code Extensions**: Salesforce Extension Pack, ESLint, Prettier, Jest Runner
- **Git Hooks**: Automatización con Husky para calidad de código
- **Testing**: Configuración completa con Jest y cobertura de código

## 📝 Desarrollo y Contribución

### Flujo de Trabajo Recomendado
1. **Fork** del repositorio
2. **Crear rama** para tu característica (`git checkout -b feature/amazing-feature`)
3. **Desarrollar** con validación automática (ESLint + Prettier)
4. **Ejecutar pruebas** antes de commit
5. **Commit** cambios (`git commit -m 'Add some amazing feature'`)
6. **Push** a la rama (`git push origin feature/amazing-feature`)
7. **Abrir Pull Request**

### Convenciones de Código
- Seguir las reglas de ESLint configuradas
- Usar Prettier para formateo automático
- Escribir pruebas unitarias para nuevas funcionalidades
- Documentar cambios significativos en metadatos

## 🤝 Soporte y Recursos

### Documentación
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/)
- [Lightning Web Components](https://developer.salesforce.com/docs/component-library/documentation/en/lwc)

### Herramientas
- [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
- [VS Code Salesforce Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode)

## 📄 Licencia

Este proyecto está licenciado bajo los términos de la **Licencia MIT**.

---

**Agentforce DX** - Transformando el desarrollo Salesforce con IA conversacional y herramientas modernas. 🚀✨