import { Router } from 'express'
import { PokemonController } from '../controllers/pokemon.js'

export const pokemonRouter = Router()

/**
 * @swagger
 * tags:
 *   name: Pokémon
 *   description: Grupo de Endpoints
 */

/**
 * @swagger
 * /pokemon:
 *   get:
 *     summary: Lista de todos los Pokémon.
 *     tags:
 *       - Pokémon
 *     responses:
 *       200:
 *         description: Lista de todos los Pokémon.
 */
pokemonRouter.get('/', PokemonController.getAllPokemon)

/**
 * @swagger
 * /pokemon/{key}:
 *   get:
 *     summary: Obtener un Pokémon por clave.
 *     tags:
 *       - Pokémon
 *     parameters:
 *       - in: path
 *         name: key
 *         required: true
 *         description: Nombre o ID del Pokémon.
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Datos del Pokémon.
 *       404:
 *         description: Pokémon no encontrado.
 */
pokemonRouter.get('/:key', PokemonController.getPokemonByKey)