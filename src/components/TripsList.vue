<template>
    <ul class="adventure-list">
      <li v-for="adventure in adventures" :key="adventure.id">
        {{ adventure.name }}
      </li>
    </ul>
  </template>
  
  <script setup lang="ts">
  import { ref } from "vue";
  
  // Placeholder adventures
  const adventures = ref([
    { id: 1, name: "Adventure 1" },
    { id: 2, name: "Adventure 2" },
    { id: 3, name: "Adventure 3" },
  ]);
  </script>
  
  <style scoped>
  .adventure-list {
    list-style: none;
    padding: 0;
  }
  
  .adventure-list li {
    padding: 10px;
    border-bottom: 1px solid #e9ecef;
  }
  
  .adventure-list li:last-child {
    border-bottom: none;
  }
  </style>
  