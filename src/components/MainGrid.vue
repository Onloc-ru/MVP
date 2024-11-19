<template>
  <div class="flex overflow-hidden h-screen">
    <!-- Map Section -->
    <div class="flex-1 border border-gray-300 bg-gray-200 rounded-lg overflow-hidden h-full">
      <MapView />
    </div>

    <!-- List Section -->
    <div class="flex-2 p-4 bg-white border border-gray-300 rounded-lg overflow-y-auto">
      <h3 class="text-lg font-bold mb-2">Результаты поиска:</h3>
      <AdventureList />
    </div>
  </div>
</template>

<script setup lang="ts">
import MapView from "./MapView.vue";
import AdventureList from "./TripsList.vue";
</script>

<style scoped>
/* Tailwind ensures proper sizing; additional styles not required */
</style>
