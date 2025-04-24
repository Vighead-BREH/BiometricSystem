<script>
import ViewModal from './ViewModal.vue';
import EditModal from './EditModal.vue';
import DeleteModal from './DeleteModal.vue';
import SearchBar from './SearchBar.vue';

export default {
  components: {
    ViewModal,
    EditModal,
    DeleteModal,
    SearchBar
  },
  data() {
    return {
      gradeLevels: [],
      currentPage: 1,
      itemsPerPage: 5,
      selectedGradeLevel: null,
      showViewModal: false,
      showEditModal: false,
      showDeleteModal: false,
      searchFilter: ''
    };
  },
  computed: {
    filteredGradeLevels() {
      if (!this.searchFilter) return this.gradeLevels;
      
      const query = this.searchFilter.toLowerCase();
      return this.gradeLevels.filter(grade => 
        grade.projectName.toLowerCase().includes(query) ||
        grade.section.toLowerCase().includes(query) ||
        grade.id.includes(query) ||
        grade.status.toLowerCase().includes(query)
      );
    },
    paginatedGradeLevels() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return this.filteredGradeLevels.slice(start, end);
    },
    totalPages() {
      return Math.ceil(this.filteredGradeLevels.length / this.itemsPerPage);
    }
  },
  methods: {
    openViewModal(gradeLevel) {
      this.selectedGradeLevel = gradeLevel;
      this.showViewModal = true;
    },
    openEditModal(gradeLevel) {
      this.selectedGradeLevel = { ...gradeLevel };
      this.showEditModal = true;
    },
    openDeleteModal(gradeLevel) {
      this.selectedGradeLevel = gradeLevel;
      this.showDeleteModal = true;
    },
    closeViewModal() {
      this.showViewModal = false;
    },
    closeEditModal() {
      this.showEditModal = false;
    },
    closeDeleteModal() {
      this.showDeleteModal = false;
    },
    
    saveGradeLevel(updatedGradeLevel) {
      const index = this.gradeLevels.findIndex(g => g.id === updatedGradeLevel.id);
      if (index !== -1) {
        this.gradeLevels[index] = updatedGradeLevel;
      } else {
        this.gradeLevels.push(updatedGradeLevel);
      }
      
      localStorage.setItem('gradeLevels', JSON.stringify(this.gradeLevels));
    },
    
    addNewGradeLevel(newProject) {
      const newId = this.gradeLevels.length > 0 
        ? String(Number(this.gradeLevels[this.gradeLevels.length - 1].id) + 1).padStart(3, '0') 
        : '001';
        
      const newGradeLevel = {
        id: newId,
        projectName: newProject.projectName,
        section: newProject.section,
        scheduleDate: newProject.scheduleDate,
        status: newProject.status || 'Upcoming',
        notes: newProject.notes || ''
      };
      
      this.gradeLevels.push(newGradeLevel);
      localStorage.setItem('gradeLevels', JSON.stringify(this.gradeLevels));
    },
    
    deleteGradeLevel(gradeLevelId) {
      const index = this.gradeLevels.findIndex(g => g.id === gradeLevelId);
      if (index !== -1) {
        this.gradeLevels.splice(index, 1);
        localStorage.setItem('gradeLevels', JSON.stringify(this.gradeLevels));
      }
    },
    
    handleSearch(query) {
      this.searchFilter = query;
      this.currentPage = 1; 
    },
    
    goToPage(page) {
      if (page >= 1 && page <= this.totalPages) {
        this.currentPage = page;
      }
    },
    goToFirstPage() {
      this.currentPage = 1;
    },
    goToLastPage() {
      this.currentPage = this.totalPages;
    },
    goToPrevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },
    goToNextPage() {
      if (this.currentPage < this.totalPages) {
        this.currentPage++;
      }
    },
    
    loadGradeLevels() {
      const savedGradeLevels = localStorage.getItem('gradeLevels');
      if (savedGradeLevels) {
        this.gradeLevels = JSON.parse(savedGradeLevels);
      } else {
        this.gradeLevels = [];
        localStorage.setItem('gradeLevels', JSON.stringify(this.gradeLevels));
      }
    }
  },
  mounted() {
    this.loadGradeLevels();
  }
};
</script>
 
<template> 

<SearchBar 
      @add-new-grade-level="addNewGradeLevel" 
      @search="handleSearch"
    />

  <div class="table-container">
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Grade Level</th>
          <th>Section</th>
          <th>Schedule</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="gradeLevel in paginatedGradeLevels" :key="gradeLevel.id">
          <td>{{ gradeLevel.id }}</td>
          <td>{{ gradeLevel.projectName }}</td>
          <td>{{ gradeLevel.section }}</td>
          <td>{{ gradeLevel.scheduleDate }}</td>
          <td>
            <span class="status-badge" :class="`status-${gradeLevel.status.toLowerCase()}`">
              {{ gradeLevel.status }}
            </span>
          </td>
          <td>
            <div class="action-buttons">
              <button class="action-button view-button" @click="openViewModal(gradeLevel)">
                <i class="fas fa-eye"></i>
              </button>
              <button class="action-button edit-button" @click="openEditModal(gradeLevel)">
                <i class="fas fa-edit"></i>
              </button>
              <button class="action-button delete-button" @click="openDeleteModal(gradeLevel)">
                <i class="fas fa-trash"></i>
              </button>
            </div>
          </td>
        </tr>
        <tr v-if="filteredGradeLevels.length === 0">
          <td colspan="6" class="no-data">No grade levels found. Add a new grade level to get started.</td>
        </tr>
      </tbody>
    </table>

    <div class="pagination" v-if="filteredGradeLevels.length > itemsPerPage">
      <button @click="goToFirstPage"><i class="fas fa-angle-double-left"></i></button>
      <button @click="goToPrevPage"><i class="fas fa-angle-left"></i></button>
      <button 
        v-for="page in totalPages" 
        :key="page" 
        :class="{ active: page === currentPage }"
        @click="goToPage(page)"
      >
        {{ page }}
      </button>
      <button @click="goToNextPage"><i class="fas fa-angle-right"></i></button>
      <button @click="goToLastPage"><i class="fas fa-angle-double-right"></i></button>
    </div>
    
    <ViewModal 
      :show="showViewModal" 
      :project="selectedGradeLevel" 
      @close="closeViewModal" 
    />

    <EditModal 
      :show="showEditModal" 
      :project="selectedGradeLevel" 
      @close="closeEditModal" 
      @save="saveGradeLevel" 
    />

    <DeleteModal 
      :show="showDeleteModal" 
      :project="selectedGradeLevel" 
      @close="closeDeleteModal" 
      @delete="deleteGradeLevel" 
    />
  </div>
</template>

<style scoped>
.table-container {
    margin-top: 20px;
    background-color: #1a3550;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
}
table {
    width: 100%;
    border-collapse: collapse;
    margin: auto;
    border-radius: 8px;
    overflow: hidden;
}
th, td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #0e2941; 
}
th {
    background-color: #234666; 
    color: white;
    font-weight: 500;
    text-transform: uppercase;
    font-size: 14px;
}
td {
    background-color: rgba(242, 242, 242, 0.9); 
    color: #0e2941; 
}
tr:last-child td {
    border-bottom: none;
}
tr:hover td {
    background-color: rgba(242, 242, 242, 1);
}
.action-buttons {
    display: flex;
    gap: 5px;
    justify-content: center;
}
.action-button {
    padding: 6px 12px;
    font-size: 14px;
    border-radius: 5px;
}
.view-button {
    background: #2196F3;
    color: white;
}
.edit-button {
    background: #4caf50;
    color: white;
}
.delete-button {
    background: #f44336; 
    color: white;
}

.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    gap: 5px;
}
.pagination button {
    padding: 8px 12px;
    background-color: #234666;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.pagination button:hover {
    background-color: #1a3550;
}
.pagination button.active {
    background-color: #4caf50;
}
.status-badge {
    padding: 4px 8px;
    border-radius: 5px;
    font-size: 12px;
}
.status-upcoming {
    background-color: #2196F3;
    color: white;
}
.status-completed {
    background-color: #4caf50;
    color: white;
}
.status-cancelled {
    background-color: #f44336;
    color: white;
}
.status-ongoing {
    background-color: #ff9800;
    color: white;
}
</style>