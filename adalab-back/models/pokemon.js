import { connection } from './mysql/config.js'

export class PokemonModel {
    static async getAllPokemon() {
        const [pokemons] = await connection.query(
            'SELECT * FROM pokemon;'
        )
        return pokemons;
    }

    static async getPokemonByKey({ key }) {
        const [pokemons] = await connection.query(
            'SELECT * FROM pokemon WHERE id = ? OR name = ?;', [key, key]
        )

        return pokemons[0];
    }
}