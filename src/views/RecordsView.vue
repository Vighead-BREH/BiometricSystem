<template>
    <div class="records-view">
      <h1 class="text-xl font-bold mb-4">Records Dashboard</h1>
      
      <div class="flex justify-between mb-4">
        <input v-model="searchQuery" placeholder="Search records..." class="border p-2" />
        <button @click="openModal(null)" class="bg-blue-500 text-white p-2">Add Record</button>
      </div>
      
      <table class="w-full border-collapse border">
        <thead>
          <tr>
            <th class="border p-2">ID</th>
            <th class="border p-2">Name</th>
            <th class="border p-2">Date</th>
            <th class="border p-2">Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="record in filteredRecords" :key="record.id">
            <td class="border p-2">{{ record.id }}</td>
            <td class="border p-2">{{ record.name }}</td>
            <td class="border p-2">{{ record.date }}</td>
            <td class="border p-2">
              <button @click="openModal(record)" class="text-blue-500">Edit</button>
              <button @click="deleteRecord(record.id)" class="text-red-500 ml-2">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
      
      <div class="mt-4 flex justify-center">
        <button @click="prevPage" :disabled="currentPage === 1" class="p-2">Prev</button>
        <span class="p-2">Page {{ currentPage }}</span>
        <button @click="nextPage" :disabled="currentPage * pageSize >= totalRecords" class="p-2">Next</button>
      </div>
    </div>
  </template>
  
  <script>
  import { ref, computed, onMounted } from 'vue';
  import { useRecordsStore } from '@/stores/recordsStore';
  
  export default {
    setup() {
      const recordsStore = useRecordsStore();
      const searchQuery = ref('');
      const currentPage = ref(1);
      const pageSize = 5;
      
      onMounted(() => {
        recordsStore.fetchRecords();
      });
  
      const filteredRecords = computed(() => {
        return recordsStore.records
          .filter(record => record.name.toLowerCase().includes(searchQuery.value.toLowerCase()))
          .slice((currentPage.value - 1) * pageSize, currentPage.value * pageSize);
      });
      
      const totalRecords = computed(() => recordsStore.records.length);
      
      function openModal(record) {
        console.log('Open modal for', record);
      }
      
      function deleteRecord(id) {
        recordsStore.deleteRecord(id);
      }
      
      function prevPage() {
        if (currentPage.value > 1) currentPage.value--;
      }
      
      function nextPage() {
        if (currentPage.value * pageSize < totalRecords.value) currentPage.value++;
      }
      
      return {
        searchQuery,
        filteredRecords,
        openModal,
        deleteRecord,
        currentPage,
        prevPage,
        nextPage,
        totalRecords,
        pageSize
      };
    }
  };
  </script>
  