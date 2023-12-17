//Script para realizar inserts en la BBDD

import axios from 'axios';
import { connection } from './models/mysql/config.js';

async function fetchDataAndInsert() {
    for (let i = 1; i <= 18; i++) {
        try {
            const response = await axios.get(`https://pokeapi.co/api/v2/pokemon/${i}`);
            const responseEvolv = await axios.get(`https://pokeapi.co/api/v2/pokemon-species/${i}`);

            const id = response.data.id;
            const name = response.data.name;
            const types = response.data.types.map(type => type.type.name).join(', ');
            const img = response.data.sprites.front_default;
            const evolv = responseEvolv.data.evolves_from_species ? responseEvolv.data.evolves_from_species.name : null;
            const stats = response.data.stats.reduce((acc, stat) => {
                acc[stat.stat.name] = stat.base_stat;
                return acc;
              }, {});

            await connection.query(
                'INSERT INTO pokemon (id, name, type, img, evolv, stats) VALUES (?, ?, ?, ?, ?, ?);',
                [id, name, types, img, evolv, JSON.stringify(stats)]
            );
        } catch (error) {
            console.error('Error en la llamada a la PokeAPI:', error);
        }
    }

    connection.end();
}

fetchDataAndInsert();
