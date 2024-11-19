<template>
  <div class="flex flex-col h-screen">
    <Header />
    <Filters />
    <AdventureGrid />
  </div>
</template>

<script setup lang="ts">
import Header from "./components/Header.vue";
import Filters from "./components/Filters.vue";
import AdventureGrid from "./components/MainGrid.vue";
</script>

<style>
/* Additional global styles if needed */
</style>
