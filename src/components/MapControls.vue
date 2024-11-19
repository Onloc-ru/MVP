<template>
  <button class="draw-button" @click="toggleDrawing">
    {{ isDrawing ? "Stop Adding Markers" : "Add Marker" }}
  </button>
</template>

<script setup lang="ts">
import { computed } from "vue";
import { useMapStore } from "../stores/mapStore";


const mapStore = useMapStore();
const isDrawing = computed(() => mapStore.isDrawing);

function toggleDrawing() {
  mapStore.toggleDrawing();
}
</script>

<style scoped>
.draw-button {
  position: absolute;
  top: 10px;
  left: 10px;
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  z-index: 1000;
  font-size: 14px;
}

.draw-button:hover {
  background-color: #0056b3;
}
</style>
