import express from 'express';
import swaggerJSDoc from 'swagger-jsdoc';
import swaggerUi from 'swagger-ui-express';

import { pokemonRouter } from './routes/pokemon.js';

const app = express();
app.disable('x-powered-by');

// Configuración de Swagger
const swaggerOptions = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'API de Pokémon',
      version: '1.0.0',
      description: 'API para prueba técnica Adalab',
    },
  },
  apis: ['./routes/*.js'],
};

const swaggerSpec = swaggerJSDoc(swaggerOptions);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// Rutas y controladores aquí
app.use('/pokemon', pokemonRouter);

// Inicia el servidor
const PORT = process.env.PORT ?? 1234;
app.listen(PORT, () => {
  console.log(`Servidor en ejecución en la ruta http://localhost:${PORT}`);
});
