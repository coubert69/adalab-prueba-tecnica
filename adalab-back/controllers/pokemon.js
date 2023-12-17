import { PokemonModel } from '../models/pokemon.js'

export class PokemonController {
    static async getAllPokemon(req, res) {
        const pokemons = await PokemonModel.getAllPokemon()
        res.json(pokemons)
    }

    static async getPokemonByKey(req, res) {
        const { key } = req.params
        const pokemon = await PokemonModel.getPokemonByKey({ key })
        if (pokemon) return res.json(pokemon)
        res.status(404).json({ message: 'Pokemon no encontrado' })
    }
}