# BOTanicals 🌱

**BOTanicals** es una plantilla base moderna y completa para proyectos Salesforce DX, diseñada para acelerar el desarrollo de aplicaciones en la plataforma Salesforce. Este proyecto proporciona una estructura sólida con herramientas de desarrollo avanzadas y mejores prácticas integradas.

## 🚀 Características Principales

### 📦 Estructura del Proyecto
- **Configuración SFDX estándar** con `sfdx-project.json` optimizado
- **Directorio `force-app`** para metadatos Salesforce (Apex, LWC, Aura, objetos, etc.)
- **Scripts de ejemplo** en `scripts/` para desarrollo rápido
- **Configuración de entorno** en `config/` para scratch orgs

### 🛠️ Herramientas de Desarrollo Integradas

#### **ESLint Configuration**
- Configuración avanzada para Aura y LWC
- Reglas específicas para Lightning Web Components
- Soporte para Jest en archivos de prueba
- Configuración de Locker Service para Aura

#### **Prettier Integration**
- Formateo automático para múltiples tipos de archivo
- Plugins especializados para Apex y XML
- Configuración específica para LWC HTML
- Integración con lint-staged para commits automáticos

#### **Testing Framework**
- **Jest** configurado con `@salesforce/sfdx-lwc-jest`
- Soporte para pruebas unitarias de LWC
- Configuración de cobertura de código
- Modo watch para desarrollo iterativo

#### **Git Hooks con Husky**
- Pre-commit hooks automáticos
- Linting y formateo antes de cada commit
- Ejecución automática de pruebas relacionadas

### 📁 Estructura de Directorios

```
bot-anicals/
├── config/
│   └── project-scratch-def.json    # Configuración de scratch org
├── scripts/
│   ├── apex/
│   │   └── hello.apex              # Ejemplo de Apex anónimo
│   └── soql/
│       └── account.soql            # Ejemplo de consulta SOQL
├── .vscode/                        # Configuración de VS Code
├── .husky/                         # Git hooks
├── force-app/                      # Metadatos Salesforce (se crea al desarrollar)
├── eslint.config.js               # Configuración ESLint
├── jest.config.js                 # Configuración Jest
├── package.json                   # Dependencias y scripts
└── .prettierrc                    # Configuración Prettier
```

## 🚀 Inicio Rápido

### Prerrequisitos
- [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
- [Node.js](https://nodejs.org/) (versión 16 o superior)
- [VS Code](https://code.visualstudio.com/) con extensiones Salesforce

### Instalación

1. **Clonar el proyecto**
   ```bash
   git clone <repository-url>
   cd bot-anicals
   ```

2. **Instalar dependencias**
   ```bash
   npm install
   ```

3. **Configurar Salesforce CLI**
   ```bash
   sfdx auth:web:login -a YourOrgAlias
   ```

4. **Crear scratch org**
   ```bash
   sfdx force:org:create -f config/project-scratch-def.json -a BOTanicalsScratch
   ```

5. **Desplegar metadatos**
   ```bash
   sfdx force:source:deploy -p force-app
   ```

## 📝 Scripts Disponibles

### Desarrollo
```bash
npm run lint                    # Ejecutar ESLint
npm run prettier               # Formatear código
npm run prettier:verify        # Verificar formato
```

### Testing
```bash
npm run test                   # Ejecutar todas las pruebas
npm run test:unit              # Pruebas unitarias
npm run test:unit:watch        # Modo watch para pruebas
npm run test:unit:debug        # Modo debug
npm run test:unit:coverage     # Con cobertura
```

### Scripts de Ejemplo
- **`scripts/apex/hello.apex`**: Ejemplo de Apex anónimo
- **`scripts/soql/account.soql`**: Consulta SOQL de ejemplo

## 🔧 Configuración Avanzada

### VS Code Extensions
El proyecto incluye configuración automática para:
- Salesforce Extension Pack
- ESLint
- Prettier
- Jest Runner

### Configuración de Scratch Org
- **Edición**: Developer
- **Características**: EnableSetPasswordInApi
- **Configuraciones**: Lightning Experience habilitado

### Linting y Formateo
- **ESLint**: Reglas específicas para Aura y LWC
- **Prettier**: Formateo automático con plugins especializados
- **Husky**: Hooks de git para calidad de código

## 🧪 Testing

### Estructura de Pruebas
```bash
force-app/main/default/lwc/
├── componentName/
│   ├── componentName.js
│   ├── componentName.html
│   ├── componentName.css
│   └── __tests__/
│       └── componentName.test.js
```

### Ejecutar Pruebas
```bash
# Todas las pruebas
npm run test:unit

# Modo watch (desarrollo)
npm run test:unit:watch

# Con cobertura
npm run test:unit:coverage
```

## 📦 Dependencias Principales

### Desarrollo
- `@salesforce/sfdx-lwc-jest`: Framework de testing para LWC
- `@salesforce/eslint-config-lwc`: Configuración ESLint para LWC
- `@salesforce/eslint-plugin-aura`: Plugin ESLint para Aura
- `prettier-plugin-apex`: Formateo para código Apex
- `husky`: Git hooks
- `lint-staged`: Linting en commits

## 🎯 Casos de Uso

### Ideal para:
- **Nuevos proyectos Salesforce DX**
- **Equipos que requieren calidad de código**
- **Desarrollo de Lightning Web Components**
- **Proyectos que necesitan testing automatizado**
- **Equipos que trabajan con múltiples desarrolladores**

### Flujo de Trabajo Recomendado
1. Crear nueva funcionalidad en `force-app/`
2. Escribir pruebas unitarias
3. Ejecutar linting y formateo
4. Commit con hooks automáticos
5. Desplegar a scratch org para testing

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 🔗 Enlaces Útiles

- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Lightning Web Components](https://developer.salesforce.com/docs/component-library/documentation/en/lwc)
- [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
- [VS Code Salesforce Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode)

---

**BOTanicals** - Tu base sólida para proyectos Salesforce DX modernos y escalables. 🌱✨
