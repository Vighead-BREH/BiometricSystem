<script>
export default {
  props: {
    show: Boolean,
    project: Object
  },
  data() {
    return {
      form: {
        id: '',
        projectName: '',
        section: '',
        scheduleDate: '',
        status: '',
        notes: ''
      },
      statusOptions: ['Upcoming', 'Ongoing', 'Completed', 'Cancelled']
    };
  },
  watch: {
    project: {
      handler(newVal) {
        if (newVal) {
          this.form = { ...newVal };
        }
      },
      immediate: true
    }
  },
  methods: {
    close() {
      this.$emit('close');
    },
    save() {
    
      if (!this.form.projectName || !this.form.section || !this.form.scheduleDate) {
        alert('Please fill in all required fields');
        return;
      }
      
      this.$emit('save', { ...this.form });
      this.$emit('close');
    }
  }
};
</script>


<template>
  <div v-if="show" class="modal-overlay">
    <div class="modal-container">
      <div class="modal-header">
        <h2>{{ form.id ? 'Edit' : 'Add' }} Grade Level</h2>
        <button class="close-button" @click="close">
          <i class="fas fa-times"></i>
        </button>
      </div>
      
      <div class="modal-body">
        <form @submit.prevent="save">
          <div class="form-group">
            <label for="projectName">Grade Level: <span class="required">*</span></label>
            <input 
              type="text" 
              id="projectName" 
              v-model="form.projectName" 
              placeholder="Enter grade level"
              required
              @blur="validateField && validateField('projectName')"
              @input="touched && touched.projectName ? validateField('projectName') : null"
            >
            <span class="validation-error" v-if="validationErrors && validationErrors.projectName && touched && touched.projectName">
              Please fill out this field.
            </span>
          </div>
          
          <div class="form-group">
            <label for="section">Section: <span class="required">*</span></label>
            <input 
              type="text" 
              id="section" 
              v-model="form.section" 
              placeholder="Enter section"
              required
              @blur="validateField && validateField('section')"
              @input="touched && touched.section ? validateField('section') : null"
            >
            <span class="validation-error" v-if="validationErrors && validationErrors.section && touched && touched.section">
              Please fill out this field.
            </span>
          </div>
          
          <div class="form-group">
            <label for="scheduleDate">Schedule Date: <span class="required">*</span></label>
            <input 
              type="date" 
              id="scheduleDate" 
              v-model="form.scheduleDate"
              required
            >
          </div>
          
          <div class="form-group">
            <label for="status">Status: <span class="required">*</span></label>
            <select id="status" v-model="form.status" required>
              <option v-for="option in statusOptions" :key="option" :value="option">
                {{ option }}
              </option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="notes">Notes:</label>
            <textarea 
              id="notes" 
              v-model="form.notes" 
              placeholder="Enter notes"
              rows="3"
            ></textarea>
          </div>
          
          <div class="button-group">
            <button type="button" class="cancel-button" @click="close">
              <i class="fas fa-times"></i> Cancel
            </button>
            <button type="button" class="reset-button" @click="resetForm" v-if="resetForm">
              <i class="fas fa-sync-alt"></i> Reset
            </button>
            <button type="submit" class="save-button">
              <i class="fas fa-save"></i> Save
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(5px);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-container {
  background-color: #fff;
  border-radius: 5%;
  width: 500px;
  max-width: 95%;
  max-height: 90%;
  overflow-y: auto;
  overflow-x: hidden;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 20px;
  background-color: #234666;
  color: white;
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

.modal-header h2 {
  margin: 0;
  font-size: 18px;
}

.close-button {
  background: none;
  border: none;
  color: white;
  cursor: pointer;
  font-size: 18px;
}

.modal-body {
  padding: 20px 50px 3px 20px;
  margin-bottom: 4%;
}

.form-group {
  margin-bottom: 15px;
  position: relative;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: 500;
  color: #333;
}

.form-group input,
.form-group select,
.form-group textarea {
  width: 100%;
  padding: 9px 12px;
  border: 2px solid #234666;
  border-radius: 5px;
  font-size: 14px;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
  outline: none;
  border-color: #4caf50;
  box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
}

.validation-error {
  display: block;
  color: #ff0000;
  font-size: 12px;
  margin-top: 5px;
}

.required {
  color: #f44336;
}

.button-group {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  margin-top: 20px;
}

.cancel-button,
.reset-button,
.save-button {
  padding: 8px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 5px;
  transition: all 0.3s ease;
}

.cancel-button {
  background-color: #9e9e9e;
  color: white;
}

.reset-button {
  background-color: #f0ad4e;
  color: white;
}

.save-button {
  background-color: #4caf50;
  color: white;
}

.cancel-button:hover,
.reset-button:hover,
.save-button:hover {
  opacity: 0.9;
  transform: translateY(-2px);
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}
</style>