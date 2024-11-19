<!-- components/MapPopup.vue -->
<template>
  <div
    v-if="popupVisible"
    class="popup"
    :style="{ top: popupPosition.y + 'px', left: popupPosition.x + 'px' }"
  >
    <p>Do you want to start adventure here?</p>
    <button @click="confirmAdventure">Yes</button>
    <button @click="closePopup">No</button>
  </div>
</template>

<script setup lang="ts">
import { useMapStore } from "../stores/mapStore";
import { computed } from "vue";

const mapStore = useMapStore();

const popupVisible = computed(() => mapStore.popupVisible);
const popupPosition = computed(() => mapStore.popupPosition);

function closePopup() {
  mapStore.setPopupVisible(false);
}

function confirmAdventure() {
  alert("Adventure started at coordinates: " + mapStore.clickedFeatureCoordinates);
  mapStore.setPopupVisible(false);
}
</script>

<style scoped>
.popup {
  position: absolute;
  background: white;
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 5px;
  z-index: 1000;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.popup button {
  margin: 5px;
  padding: 5px 10px;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

.popup button:first-child {
  background-color: #28a745;
  color: white;
}

.popup button:last-child {
  background-color: #dc3545;
  color: white;
}
</style>
