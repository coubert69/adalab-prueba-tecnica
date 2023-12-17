import mysql from 'mysql2/promise';

// Configuración de conexión a la base de datos
const DEFAULT_CONFIG = {
    host: 'localhost', //Host
    user: 'xxx', //User de la BBDD
    port: xxx, //Puerto de la BBDD
    password: 'xxxx', //Password de la BBDD
    database: 'adalab-pokeapi'
}

// Conexión a la base de datos
const connectionString = process.env.DATABASE_URL ?? DEFAULT_CONFIG
const connection = await mysql.createConnection(connectionString)

export { connection };