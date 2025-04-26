<script>
export default {
  props: {
    show: Boolean,
    project: Object
  },
  methods: {
    close() {
      this.$emit('close');
    },
    confirmDelete() {
      this.$emit('delete', this.project.id);
      this.$emit('close');
    }
  }
};
</script>

<template>
  <div v-if="show" class="modal-overlay">
    <div class="modal-container">
      <div class="modal-header">
        <h3>Delete Grade Level</h3>
        <button class="close-button" @click="close">×</button>
      </div>
      <div class="modal-body" v-if="project">
        <div class="warning-icon">
          <i class="fas fa-exclamation-triangle"></i>
        </div>
        <p class="confirmation-message">
          Are you sure you want to delete <strong>{{ project.projectName }}</strong> (Section {{ project.section }})?
        </p>
        <p class="warning-text">
          This action cannot be undone. All data associated with this grade level will be permanently removed.
        </p>
      </div>
      <div class="modal-footer">
        <button class="secondary-button" @click="close">Cancel</button>
        <button class="delete-button" @click="confirmDelete">Delete</button>
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
  background-color: #f2f2f2;
  border-radius: 5%;
  width: 450px;
  max-width: 90%;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.modal-header {
  background-color: #234666;
  color: white;
  padding: 15px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

.modal-header h3 {
  margin: 0;
  font-size: 18px;
}

.close-button {
  background: transparent;
  border: none;
  color: white;
  font-size: 24px;
  cursor: pointer;
}

.modal-body {
  padding: 20px;
  color: #0e2941;
  text-align: center;
}

.warning-icon {
  font-size: 48px;
  color: #f44336;
  margin-bottom: 15px;
}

.confirmation-message {
  font-size: 16px;
  margin-bottom: 15px;
}

.warning-text {
  color: #f44336;
  font-size: 14px;
}

.modal-footer {
  padding: 15px 20px;
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  border-top: 1px solid #ddd;
}

.delete-button {
  padding: 8px 16px;
  background-color: #f44336;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
}

.secondary-button {
  padding: 8px 16px;
  background-color: #9e9e9e;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
}

.delete-button:hover {
  background-color: #d32f2f;
}

.secondary-button:hover {
  background-color: #8a8a8a;
}
</style>