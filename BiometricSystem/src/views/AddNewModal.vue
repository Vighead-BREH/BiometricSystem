<script>
export default {
  name: 'AddNewModal',
  props: {
    show: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      project: {
        projectName: '',
        section: '',
        scheduleDate: '',
        notes: ''
      },
      validationErrors: {
        projectName: false,
        section: false
      },
      touched: {
        projectName: false,
        section: false
      }
    }
  },
  methods: {
    closeModal() {
      this.$emit('close');
    },
    resetForm() {
      this.project = {
        projectName: '',
        section: '',
        scheduleDate: '',
        notes: ''
      };
      this.validationErrors = {
        projectName: false,
        section: false
      };
      this.touched = {
        projectName: false,
        section: false
      };
    },
    validateField(field) {
      this.touched[field] = true;
      this.validationErrors[field] = !this.project[field];
    },
    saveProject() {
   
      this.validateField('projectName');
      this.validateField('section');
  
      if (this.validationErrors.projectName || this.validationErrors.section) {
        return;
      }
   
      if (!this.project.scheduleDate) {
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');
        this.project.scheduleDate = `${year}-${month}-${day}`;
      }
      
      this.$emit('save', this.project);
      this.resetForm();
      this.closeModal();
    }
  }
}
</script>

<template>
  <div class="modal-overlay" v-if="show" @click.self="closeModal">
    <div class="modal-container">
      <div class="modal-header">
        <h2>Add New Grade Level</h2>
        <button class="close-button" @click="closeModal">
          <i class="fas fa-times"></i>
        </button>
      </div>
      
      <div class="modal-body">
        <form @submit.prevent="saveProject">
          <div class="form-group">
            <label>Grade Level</label>
            <input 
              type="text" 
              v-model="project.projectName" 
              placeholder="Grade Level"
              @blur="validateField('projectName')"
              @input="touched.projectName ? validateField('projectName') : null"
            />
            <span class="validation-error" v-if="validationErrors.projectName && touched.projectName">
              Please fill out this field.
            </span>
          </div>
          
          <div class="form-group">
            <label>Section</label>
            <input 
              type="text"
              v-model="project.section"
              placeholder="Section"
              @blur="validateField('section')"
              @input="touched.section ? validateField('section') : null"
            />
            <span class="validation-error" v-if="validationErrors.section && touched.section">
              Please fill out this field.
            </span>
          </div>
          
          <div class="form-group">
            <label>Schedule Date</label>
            <input 
              type="date" 
              v-model="project.scheduleDate" 
            />
          </div>
          
          <div class="form-group">
            <label>Notes (Optional)</label>
            <textarea 
              v-model="project.notes" 
              placeholder="Add any additional notes here..."
              rows="3"
            ></textarea>
          </div>
          
          <div class="button-group">
            <button type="button" class="cancel-button" @click="closeModal">
              <i class="fas fa-times"></i> Cancel
            </button>
            <button type="button" class="reset-button" @click="resetForm">
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
  padding: 15px 20px;
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
  padding: 20px;
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
  padding: 9px 1px;
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

.help-text {
  display: block;
  color: #666;
  font-size: 12px;
  margin-top: 4px;
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
  background-color: #234666;
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