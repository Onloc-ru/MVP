<template>
  <div ref="mapContainer" class="h-full"></div>
</template>

<script setup lang="ts">
import { onMounted, ref } from "vue";
import "ol/ol.css";
import { Map, View } from "ol";
import TileLayer from "ol/layer/Tile";
import OSM from "ol/source/OSM";

const mapContainer = ref<HTMLElement | null>(null);

onMounted(() => {
  new Map({
    target: mapContainer.value!,
    layers: [new TileLayer({ source: new OSM() })],
    view: new View({
      center: [0, 0],
      zoom: 2,
    }),
  });
});
</script>

<style scoped>
/* Minimal CSS; Tailwind ensures full container scaling */
</style>
