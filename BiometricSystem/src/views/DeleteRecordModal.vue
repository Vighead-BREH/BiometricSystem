<script setup>
import { ref, defineProps, defineEmits } from 'vue'

const props = defineProps({
  isOpen: {
    type: Boolean,
    default: false
  },
  record: {
    type: Object,
    default: () => ({})
  }
})

const emit = defineEmits(['close', 'confirm'])
const handleClose = () => {
  emit('close')
}
const handleConfirm = () => {
  emit('confirm', props.record.id)
  emit('close')
}

const modalAnimation = ref('modal-show')
const animateClose = () => {
  modalAnimation.value = 'modal-hide'
  setTimeout(handleClose, 300) 
}
</script>

<template>
  <div v-if="isOpen" class="modal-overlay" @click="animateClose">
    <div :class="['modal-container', modalAnimation]" @click.stop>
      <div class="modal-header">
        <h3>Confirm Deletion</h3>
        <button class="close-btn" @click="animateClose">
          <i class="fas fa-times"></i>
        </button>
      </div>
      
      <div class="modal-body">
        <div class="warning-icon">
          <i class="fas fa-exclamation-triangle"></i>
        </div>
        <p>Are you sure you want to delete this record?</p>
        <div class="record-info">
          <p><strong>Student:</strong> {{ record.name }}</p>
          <p><strong>Date:</strong> {{ record.date }}</p>
          <p><strong>Time:</strong> {{ record.time }}</p>
          <p><strong>Status:</strong> 
            <span :class="['status-badge', record.status ? record.status.split('_')[0] : '']">
              <i :class="[
                'fas', 
                record.status?.includes('checkin') ? 'fa-check' : 
                record.status?.includes('checkout') ? 'fa-sign-out-alt' : 
                record.status?.includes('absent') ? 'fa-times' : 'fa-clock'
              ]"></i>
              {{ record.status ? {
                'checkin_am': 'AM Check-in',
                'checkin_pm': 'PM Check-in',
                'checkout_am': 'AM Check-out',
                'checkout_pm': 'PM Check-out',
                'absent_am': 'AM Absent',
                'absent_pm': 'PM Absent',
                'late_am': 'Late AM Check-in',
                'late_pm': 'Late PM Check-in'
              }[record.status] : '' }}
            </span>
          </p>
        </div>
        <p class="warning-text">This action cannot be undone!</p>
      </div>
      
      <div class="modal-footer">
        <button class="cancel-btn" @click="animateClose">
          Cancel
        </button>
        <button class="delete-btn" @click="handleConfirm">
          <i class="fas fa-trash"></i> Delete Record
        </button>
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
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
  backdrop-filter: blur(5px);
}

.modal-container {
  background-color: #1a3550;
  border-radius: 8px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
  width: 90%;
  max-width: 500px;
  color: white;
  overflow: hidden;
  transition: all 0.3s ease;
}

.modal-show {
  animation: slideIn 0.3s forwards;
}

.modal-hide {
  animation: slideOut 0.3s forwards;
}

@keyframes slideIn {
  from {
    transform: translateY(50px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

@keyframes slideOut {
  from {
    transform: translateY(0);
    opacity: 1;
  }
  to {
    transform: translateY(50px);
    opacity: 0;
  }
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 20px;
  border-bottom: 1px solid #234666;
  background-color: #234666;
}

.modal-header h3 {
  margin: 0;
  font-size: 18px;
  font-weight: 500;
}

.close-btn {
  background: transparent;
  border: none;
  color: white;
  font-size: 18px;
  cursor: pointer;
  width: 30px;
  height: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: background-color 0.2s ease;
}

.close-btn:hover {
  background-color: rgba(255, 255, 255, 0.1);
}

.modal-body {
  padding: 20px;
  text-align: center;
}

.warning-icon {
  color: #f44336;
  font-size: 48px;
  margin-bottom: 20px;
}

.record-info {
  background-color: rgba(255, 255, 255, 0.1);
  border-radius: 5px;
  padding: 15px;
  margin: 15px 0;
  text-align: left;
}

.record-info p {
  margin: 8px 0;
}

.warning-text {
  color: #f44336;
  font-weight: 500;
  margin-top: 20px;
}

.modal-footer {
  display: flex;
  justify-content: flex-end;
  padding: 15px 20px;
  border-top: 1px solid #234666;
  gap: 10px;
}

.cancel-btn {
  background-color: transparent;
  color: white;
  border: 1px solid white;
  padding: 8px 16px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.cancel-btn:hover {
  background-color: rgba(255, 255, 255, 0.1);
}

.delete-btn {
  background-color: #f44336;
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 5px;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 5px;
  transition: all 0.2s ease;
}

.delete-btn:hover {
  background-color: #d32f2f;
}

.status-badge {
  margin-left: 5px;
  display: inline-flex;
  align-items: center;
  padding: 3px 10px;
  border-radius: 10px;
  color: white;
  font-size: 12px;
  text-align: center;
  min-width: 80px;
  gap: 5px;
}

.status-badge.checkin {
  background-color: #4caf50;
}

.status-badge.checkout {
  background-color: #2196f3;
}

.status-badge.absent {
  background-color: #f44336;
}

.status-badge.late {
  background-color: #ff9800;
}
</style>