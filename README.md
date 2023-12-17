# Adalab prueba técnica  
# Fase 1: FrontEnd
*Tecnologías*: Vue.js + CSS  
*Consideraciones*: No responsive  
*Ruta Pública*: https://venerable-babka-516137.netlify.app/  

### Despliegue local
1. Después de haber clonado el repositorio navegamos a la ruta del frontend con "cd adalab-front" en consola de comandos.
2. Ejecutamos "npm install"
3. Ejecutamos "npm run dev"


# Fase 2: BackEnd
*Tecnologías*: Node.js + Express + Swagger  

### BBDD
La base de datos es una mysql cuya configuración se encuentra en el fichero "./models/mysql/config.js"
1. Creamos una BBDD mysql
2. Rellenamos el fichero config mencionado arriba con la configuración correcta a la BBDD
3. Utilizamos el dump incluído en la raiz del proyecto "dump-adalab-pokeapi.sql"  
### Despliegue local
1. Después de haber clonado el repositorio navegamos a la ruta del backend con "cd adalab-back" en consola de comandos.
2. Ejecutamos "npm install"
3. Ejecutamos "node index.js"
4. En la ruta "/api-docs" se encuentra la documentación del API y sus endpoints
