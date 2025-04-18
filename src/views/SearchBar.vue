<script>
import AddNewModal from './AddNewModal.vue';

export default {
  components: {
    AddNewModal
  },
  data() {
    return {
      showAddModal: false,
      searchQuery: ''
    };
  },
  methods: {
    handleSaveProject(projectData) {
 
      this.$emit('add-new-grade-level', projectData);
      this.showAddModal = false;
    },
    
    handleSearch() {
   
      this.$emit('search', this.searchQuery);
    },
    
    clearSearch() {
      this.searchQuery = '';
      this.$emit('search', '');
    }
  }
};
</script>

<template>
  <div class="search-box">
    <div class="search-container">
      <i class="fas fa-search search-icon"></i>
      <input 
        v-model="searchQuery" 
        type="text" 
        class="search-input" 
        placeholder="Search records..." 
        @keyup.enter="handleSearch"
      />
      <button 
        v-if="searchQuery" 
        class="clear-button"
        @click="clearSearch"
        aria-label="Clear search"
      >
        <i class="fas fa-times"></i>
      </button>
    </div>
    <div class="action-container">
      <button class="search-button" @click="handleSearch">
        <i class="fas fa-search"></i> Search
      </button>
      <button class="add-button" @click="showAddModal = true">
        <i class="fas fa-plus"></i> Add New
      </button>
    </div>

    <AddNewModal 
      :show="showAddModal" 
      @close="showAddModal = false"
      @save="handleSaveProject"
    />
  </div>
</template>


<style>
.search-box {
    margin-top: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-left: 5%;
}
.search-container {
    display: flex;
    align-items: center;
    position: relative;
    width: 60%;
}
.search-icon {
    position: absolute;
    left: 10px;
    color: #8a8a8a;
}
.search-input {
    padding: 12px 12px 12px 35px;
    font-size: 16px;
    border: 2px solid #234666;
    border-radius: 7px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.9);
    transition: all 0.3s ease;
}
.search-input:focus {
    outline: none;
    border-color: #4caf50;
    box-shadow: 0 0 8px rgba(76, 175, 80, 0.5);
}
.action-container {
    display: flex;
    gap: 10px;
}
.add-button, .search-button, .action-button {
    padding: 10px 20px;
    font-size: 16px;
    border: 0;
    background: #234666; 
    color: white;
    cursor: pointer;
    border-radius: 7px;
    transition: background 0.3s ease;
    display: flex;
    align-items: center;
    gap: 5px;
}
.add-button {
    background: #4caf50;
}
.add-button:hover, .search-button:hover, .action-button:hover {
    opacity: 0.9;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
}
.search-button:hover {
    background: #0e2941; 
}

.clear-button {
  position: absolute;
  right: 8px;
  top: 50%;
  transform: translateY(-50%);
  background: none;
  border: none;
  cursor: pointer;
  padding: 5px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  color: #666;
  border-radius: 50%;
  height: 25px;
  width: 25px;
}

.clear-button:hover {
  background-color: #f0f0f0;
  color: #333;
}
</style>