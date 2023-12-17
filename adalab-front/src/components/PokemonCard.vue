<template>
  <div class="card" @click="showDetails">
    <div class="card-image">
      <img :src="data.imagen" alt="" />
      <span class="card-id"
        ><strong>ID / {{ data.id }}</strong></span
      >
    </div>
    <div class="card-content">
      <h2 class="card-content-name">{{ data.nombre }}</h2>
      <div class="card-content-tags">
        <span v-for="(type, index) in data.tipo" :key="index"> {{ type.type.name }}</span>
      </div>
      <div class="card-content-evolutions" v-if="data.evolucion">
        <label for="evolution">Evoluciona de:</label>
        <p id="evolution">{{ data.evolucion.name }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const { data } = defineProps(['data'])
const router = useRouter()

const showDetails = () => {
  // Guardamos en sesión con los datos del Pokémon
  sessionStorage.pokemonSelected = JSON.stringify(data)

  // Navegar a la vista de detalles del Pokemon al hacer clic en la tarjeta
  router.push({ name: 'pokemon-details', params: { id: data.id } })
}
</script>

<style>
.card {
  margin-top: 30px;
  background-color: white;
  width: 300px;
  height: 350px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4);
  transition: box-shadow 0.3s ease;
}
.card:hover {
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.8);
  cursor: pointer;
}
.card-image {
  height: 50%;
  position: relative;
  background-color: #dfdfdf;
}
.card-image img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}
.card-id {
  position: absolute;
  bottom: 0;
  left: 0;
  background-color: #d1cdca;
  padding: 5px 10px;
  text-align: center;
  color: #69382e;
}
.card-content {
  padding: 20px;
}
.card-content-name {
  text-transform: capitalize;
  margin: 0 0 5px 0;
}
.card-content-tags {
  margin: 0 0 10px 0;
}
.card-content-tags span {
  border: solid 1px #b3a496;
  border-radius: 5px;
  padding: 2px 5px;
  text-transform: uppercase;
  margin-right: 10px;
  color: #b3a496;
}
.card-content-evolutions {
  border-left: solid 8px #69382e;
  padding: 10px;
}
.card-content-evolutions label {
  color: #69382e;
}
#evolution {
  font-size: 25px;
  margin: 0;
}
</style>
