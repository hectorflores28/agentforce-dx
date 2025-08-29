# Agentforce DX - Resort Manager AI Agent

¡Bienvenido al proyecto **Agentforce DX**!

Este proyecto implementa un agente de inteligencia artificial especializado en la gestión de resorts turísticos, utilizando las capacidades más avanzadas de Salesforce Einstein AI y Agentforce para automatizar y optimizar las operaciones de resorts.

## 🏖️ Descripción del Proyecto

**Agentforce DX** es un agente de IA conversacional diseñado específicamente para **Coral Cloud Resorts**, un operador de resorts turísticos que ofrece actividades de destino, experiencias inolvidables y servicios de reserva, respaldados por un compromiso con el servicio al cliente de primera clase.

El agente actúa como un **Resort Manager** virtual que maneja quejas de clientes, gestiona horarios de empleados y asegura que todo funcione sin problemas en el resort.

## 🤖 Componentes Principales

### Bot de IA - Resort Manager
- **Tipo**: Einstein Service Agent
- **Plantilla**: AiCopilot__AgentforceAgent
- **Usuario**: resort_manager@00dbm00000rhxce.ext
- **Dominio ML**: Resort_Manager

### GenAI Planner Bundle
- **Nombre**: Resort Manager
- **Tipo de Planificador**: AiCopilot__ReAct
- **Descripción**: Agente de IA cuyo trabajo es ayudar a Coral Cloud Resorts a optimizar operaciones, mejorar el servicio al cliente y gestionar actividades del resort de manera efectiva.

### Plugins de IA Generativa
El agente incluye 5 plugins especializados:

1. **Activity Reservation Assistance** 📅
   - Asistencia para reservas de actividades de destino
   - Funciones: Finalizar reservas, obtener horarios disponibles
   - Manejo de consultas relacionadas con reservas

2. **Customer Complaint Handling** 📝
   - Automatización del registro y categorización de quejas de clientes
   - Gestión eficiente de casos de servicio al cliente

3. **Employee Schedule Management** 👥
   - Optimización de la creación y ajuste de horarios de empleados
   - Gestión de recursos humanos del resort

4. **Service Quality Monitoring** 📊
   - Seguimiento y reportes de métricas de servicio al cliente
   - Monitoreo de feedback y calidad de servicio

5. **Inventory Status Updates** 📦
   - Monitoreo y notificaciones sobre niveles de inventario del resort en tiempo real
   - Gestión de stock y recursos

## 🛠️ Tecnologías y Herramientas

### Salesforce DX
- **API Version**: 64.0
- **Login URL**: https://login.salesforce.com
- **Namespace**: Sin namespace (estándar)

### Herramientas de Desarrollo
- **ESLint**: Configuración avanzada para LWC, Aura y Lightning
- **Prettier**: Formateo automático de código con plugins para XML y Apex
- **Jest**: Pruebas unitarias con sfdx-lwc-jest
- **Husky**: Hooks de Git para automatización
- **Lint-staged**: Validación automática en commits

### Scripts Disponibles
```bash
# Linting y formateo
npm run lint                    # Ejecutar ESLint
npm run prettier               # Formatear código
npm run prettier:verify        # Verificar formato

# Pruebas
npm run test                   # Ejecutar todas las pruebas
npm run test:unit             # Pruebas unitarias
npm run test:unit:watch       # Pruebas en modo watch
npm run test:unit:coverage    # Pruebas con cobertura
```

## 📁 Estructura del Proyecto

```
agentforcedx/
├── force-app/main/default/
│   ├── bots/Resort_Manager/           # Configuración del bot de IA
│   ├── genAiPlannerBundles/Resort_Manager/  # Bundle del planificador
│   └── genAiPlugins/                  # 5 plugins especializados
├── specs/                             # Especificaciones YAML
│   ├── agentSpec.yaml
│   └── resortManagerSpec.yaml
├── scripts/                           # Scripts de ejemplo
│   ├── apex/hello.apex
│   └── soql/account.soql
├── config/                           # Configuración SFDX
├── .vscode/                          # Configuración VS Code
├── .husky/                           # Hooks de Git
└── [archivos de configuración]
```

## 🚀 Instalación y Despliegue

### Prerrequisitos
- Salesforce CLI
- Node.js y npm
- VS Code con extensiones de Salesforce

### Pasos de Instalación
1. **Clonar el repositorio**:
   ```bash
   git clone <repository-url>
   cd agentforcedx
   ```

2. **Instalar dependencias**:
   ```bash
   npm install
   ```

3. **Configurar el entorno Salesforce**:
   ```bash
   sfdx force:auth:web:login -a agentforcedx
   ```

4. **Desplegar el proyecto**:
   ```bash
   sfdx force:source:deploy -p force-app/main/default
   ```

5. **Activar el bot** (desde Salesforce Setup):
   - Navegar a Setup > Einstein Bots
   - Activar el bot "Resort Manager"
   - Configurar canales de mensajería según necesidades

## 🎯 Casos de Uso

### Para Clientes
- **Reservas de Actividades**: Asistencia completa en el proceso de reserva
- **Soporte al Cliente**: Manejo de quejas y consultas
- **Información del Resort**: Acceso a información actualizada

### Para Empleados
- **Gestión de Horarios**: Optimización automática de turnos
- **Monitoreo de Calidad**: Seguimiento de métricas de servicio
- **Gestión de Inventario**: Alertas y actualizaciones en tiempo real

## 🔧 Configuración Avanzada

### Variables de Contexto
El bot incluye variables de contexto para:
- **EndUserId**: Identificación del usuario final
- **RoutableId**: ID de la sesión de mensajería
- **EndUserLanguage**: Idioma del usuario

### Canales Soportados
- Apple Business Chat
- Facebook Messenger
- WhatsApp
- LINE
- Mensajería de texto
- Mensajería embebida
- Canales personalizados

## 📝 Desarrollo y Contribución

### Flujo de Trabajo
1. Crear una rama para tu característica
2. Realizar cambios siguiendo las convenciones de código
3. Ejecutar pruebas y linting
4. Crear un Pull Request

### Convenciones de Código
- Usar ESLint y Prettier para formateo automático
- Seguir las mejores prácticas de Salesforce DX
- Documentar cambios en metadatos
- Incluir pruebas unitarias para nuevas funcionalidades

## 📊 Monitoreo y Analytics

El agente incluye capacidades de:
- **Enriquecimiento de Logs**: Para análisis detallado
- **Métricas de Servicio**: Seguimiento de calidad
- **Reportes Automáticos**: Generación de insights

## 🤝 Soporte

Para soporte técnico o preguntas sobre el proyecto:
- Revisar la documentación de Salesforce Einstein Bots
- Consultar la guía de Agentforce
- Abrir un issue en el repositorio

## 📄 Licencia

Este proyecto está licenciado bajo los términos de la Licencia MIT.

---

**Agentforce DX** - Transformando la gestión de resorts con IA conversacional avanzada.
