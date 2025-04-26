<script>
export default {
  props: {
    show: Boolean,
    project: Object
  },
  methods: {
    close() {
      this.$emit('close');
    }
  }
};
</script>

<template>
  <div v-if="show" class="modal-overlay">
    <div class="modal-container">
      <div class="modal-header">
        <h3>View Grade Level</h3>
        <button class="close-button" @click="close">×</button>
      </div>
      <div class="modal-body" v-if="project">
        <div class="info-row">
          <div class="info-label">ID:</div>
          <div class="info-value">{{ project.id }}</div>
        </div>
        <div class="info-row">
          <div class="info-label">Grade Level:</div>
          <div class="info-value">{{ project.projectName }}</div>
        </div>
        <div class="info-row">
          <div class="info-label">Section:</div>
          <div class="info-value">{{ project.section }}</div>
        </div>
        <div class="info-row">
          <div class="info-label">Schedule Date:</div>
          <div class="info-value">{{ project.scheduleDate }}</div>
        </div>
        <div class="info-row">
          <div class="info-label">Status:</div>
          <div class="info-value">
            <span class="status-badge" :class="`status-${project.status.toLowerCase()}`">
              {{ project.status }}
            </span>
          </div>
        </div>
        <div class="info-row">
          <div class="info-label">Notes:</div>
          <div class="info-value notes">{{ project.notes }}</div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="primary-button" @click="close">Close</button>
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
  border-radius: 8px;
  width: 500px;
  max-width: 90%;
  max-height: 90%;
  overflow-y: auto;
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
}

.info-row {
  display: flex;
  margin-bottom: 15px;
}

.info-label {
  font-weight: bold;
  width: 120px;
  flex-shrink: 0;
}

.info-value {
  flex-grow: 1;
}

.info-value.notes {
  white-space: pre-wrap;
}

.modal-footer {
  padding: 15px 20px;
  display: flex;
  justify-content: flex-end;
  border-top: 1px solid #ddd;
}

.primary-button {
  padding: 8px 16px;
  background-color: #2196F3;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
}

.primary-button:hover {
  background-color: #1a7fd1;
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