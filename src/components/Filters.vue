<template>
    <div class="bg-white border-b border-gray-300 p-4 flex gap-4 items-center">
      <Dropdown :options="priceOptions" placeholder="Цена" class="w-40" />
      <Dropdown :options="categoryOptions" placeholder="Категория" class="w-40" />
      <Dropdown :options="difficultyOptions" placeholder="Уровень сложности" class="w-40" />
      <Calendar v-model="selectedDate" :show-icon="true" range-separator=" - " />
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref } from "vue";
  import  Dropdown  from "primevue/dropdown";
  import  Calendar  from "primevue/calendar";
  
  const priceOptions = ["Дешевые", "Средние", "Дорогие"];
  const categoryOptions = ["Горы", "Реки", "Леса"];
  const difficultyOptions = ["Легкий", "Средний", "Сложный"];
  const selectedDate = ref(null);
  </script>
  
  <style scoped>
  /* Additional CSS not needed here as Tailwind and PrimeVue provide styles */
  </style>
  