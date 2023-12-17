<template>
  <main>
    <!-- Formas -->
    <div class="triangulo-izda"></div>
    <div class="triangulo-dcha"></div>
    <div class="semicirculo-izda"></div>
    <div class="semicirculo-dcha"></div>
    <div class="content">
      <input
        v-model="search"
        type="text"
        name="search"
        id="search"
        placeholder="Filtra pokemons por nombre..."
      />
      <div class="cards" v-if="dataLoaded">
        <PokemonCard v-for="(obj, index) in computedData" :key="index" :data="obj" />
      </div>
    </div>
  </main>
</template>

<script setup>
//Importaciones necesarias
import { onMounted, ref, computed } from 'vue'
import PokemonCard from '@/components/PokemonCard.vue'

//Declaración de variables
const pokemonDataFromAPI = ref([])
const search = ref(null)
const dataLoaded = ref(false)

//Propiedades computadas
const computedData = computed(() => {
  let myObj = pokemonDataFromAPI.value

  if (search.value) {
    myObj = myObj.filter((pokemon) => {
      const nombrePokemon = pokemon.nombre.toLowerCase()
      const textoBuscado = search.value.toLowerCase()

      return nombrePokemon.includes(textoBuscado)
    })
  }

  return myObj
})

onMounted(async () => {
  const fetchPokemonData = async (i) => {
    const res = await fetch(`https://pokeapi.co/api/v2/pokemon/${i}`)
    const data = await res.json()
    const pokemon = {
      id: data.id,
      nombre: data.name,
      tipo: data.types,
      imagen: data.sprites.front_default,
      stats: data.stats,
      evolucion: null
    }

    const resSpecies = await fetch(`https://pokeapi.co/api/v2/pokemon-species/${i}`)
    const speciesData = await resSpecies.json()
    pokemon.evolucion = speciesData.evolves_from_species

    pokemonDataFromAPI.value.push(pokemon)
  }

  // Crear una matriz de promesas para todas las solicitudes de Pokemon
  const pokemonPromises = []
  for (let i = 1; i <= 18; i++) {
    pokemonPromises.push(fetchPokemonData(i))
  }

  // Esperar a que todas las solicitudes se completen antes de continuar
  await Promise.all(pokemonPromises)

  // Ordenar el array por ID antes de renderizar las tarjetas
  pokemonDataFromAPI.value.sort((a, b) => a.id - b.id)

  // Establecer dataLoaded en true después de cargar todos los datos
  dataLoaded.value = true
})
</script>

<style>
main {
  width: 100%;
  min-height: 100vh;
  height: auto;
  margin: 0;
  padding: 0;
  background-color: #ffe62c;
  position: relative;
}

.triangulo-izda,
.triangulo-dcha,
.semicirculo-izda,
.semicirculo-dcha {
  position: fixed;
  width: 0;
  height: 0;
  z-index: 1;
}

.triangulo-izda {
  top: 0;
  left: 0;
  border-style: solid;
  border-width: 0 0 100px 100px;
  border-color: transparent transparent black transparent;
  transform: scaleY(-1) scaleX(-1);
}

.triangulo-dcha {
  top: 0;
  right: 0;
  border-style: solid;
  border-width: 0 0 100px 100px;
  border-color: transparent transparent black transparent;
  transform: scaleY(-1);
}

.semicirculo-izda,
.semicirculo-dcha {
  bottom: 0;
  width: 100px;
  height: 100px;
  background-color: red;
  border-radius: 0 0 100% 0%;
}

.semicirculo-izda {
  left: 0;
  transform: scaleY(-1);
}

.semicirculo-dcha {
  right: 0;
  transform: scaleY(-1) scaleX(-1);
}

.content {
  width: 1000px;
  height: 100%;
  margin: 0 auto;
  padding: 20px;
  box-sizing: border-box;
}

#search {
  width: 100%;
  padding: 20px;
  box-sizing: border-box;
  border: none;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4);
  outline: none;
  background-color: #fffcec;
  font-size: 18px;
}
#search::placeholder {
  color: #b3a496b2;
  text-transform: uppercase;
  text-align: center;
}

.cards {
  display: flex;
  flex-wrap: wrap;
  gap: 30px;
}
</style>
