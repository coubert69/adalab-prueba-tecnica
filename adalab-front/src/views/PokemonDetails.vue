<template>
  <transition name="fade">
    <main v-if="poke">
      <!-- Formas -->
      <div class="triangulo-izda"></div>
      <div class="triangulo-dcha"></div>
      <div class="semicirculo-izda"></div>
      <div class="semicirculo-dcha"></div>

      <div class="modal-container" v-if="pokemon">
        <div class="modal-bg"></div>
        <div class="modal-dialog">
          <button class="go-back" @click="goBack">Volver al listado</button>
          <div class="details-container">
            <div class="card">
              <div class="card-image">
                <img :src="pokemon.imagen" alt="" />
                <span class="card-id"
                  ><strong>ID / {{ pokemon.id }}</strong></span
                >
              </div>
              <div class="card-content">
                <h1 class="card-content-name">{{ pokemon.nombre }}</h1>
                <div class="card-content-tags">
                  <span v-for="(type, index) in pokemon.tipo" :key="index"> {{ type.type.name }}</span>
                </div>
                <div class="card-content-stats">
                  <table>
                    <tr v-for="stat in pokemon.stats" :key="stat.stat.name">
                      <td>{{ stat.stat.name }}</td>
                      <td>{{ stat.base_stat }}</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div v-else>
        <button class="go-back" @click="goBack">Volver al listado</button>
        <h2>No existen datos del pokemon seleccionado</h2>
      </div>
    </main>
  </transition>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const pokemon = ref(null)
const poke = ref(true)

const goBack = () => {
  router.push({ name: 'home' })
}

onMounted(() => {
  // Recibimos los datos del pokémon en sesión
  if (sessionStorage.pokemonSelected) {
    pokemon.value = JSON.parse(sessionStorage.pokemonSelected)
  }
})
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 1s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.modal-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.modal-dialog {
  width: 500px;
  height: auto;
  min-height: 90vh;
  border-radius: 8px;
  padding: 20px;
  z-index: 1;
}

.go-back {
  padding: 5px 10px;
  border-radius: 3px;
  cursor: pointer;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  outline: none;
  border: none;
  transition: box-shadow 0.3s ease;
}
.go-back:hover {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

.card {
  margin-top: 30px;
  background-color: white;
  width: 100%;
  height: 80vh;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4);
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
  padding: 10px 20px;
  text-align: center;
  color: #69382e;
}
.card-content {
  padding: 40px;
}
.card-content-name {
  text-transform: capitalize;
  margin: 0 0 20px 0;
}
.card-content-tags {
  margin: 0 0 20px 0;
}
.card-content-tags span {
  border: solid 1px #b3a496;
  border-radius: 5px;
  padding: 4px 10px;
  text-transform: uppercase;
  margin-right: 10px;
  color: #b3a496;
}
.card-content-stats {
  padding: 20px;
}
.card-content-stats table{
  width: 100%;
  font-size: 22px;
  text-transform: capitalize;
}
#evolution {
  font-size: 35px;
  margin: 0;
}
</style>
