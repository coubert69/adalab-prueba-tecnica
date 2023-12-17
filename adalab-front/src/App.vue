<script setup>
import { RouterView } from 'vue-router'
</script>

<template>
  <transition name="fade" mode="out-in">
    <RouterView />
  </transition>
</template>

<style>
html,
body {
  margin: 0;
  padding: 0;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 1s;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
