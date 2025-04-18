<script setup>
import { ref, onMounted, computed } from 'vue';
import { useRouter } from 'vue-router';
import { useAuth } from '@/composable/useAuth';

const router = useRouter();
const showDropdown = ref(false);

const { user, loadUser, logout } = useAuth();

const userInitials = computed(() => {
  if (!user.value) return '';
  
  const name = user.value.displayName || '';
  if (!name) return '';
  
  const initials = name.split(' ')
    .map(word => word.charAt(0).toUpperCase())
    .join('')
    .substring(0, 2);
    
  return initials;
});

onMounted(() => {
 
  if (!loadUser()) {
    router.push('/login');
    return;
  }

  document.addEventListener('click', (e) => {
    if (!e.target.closest('.user-dropdown') && showDropdown.value) {
      showDropdown.value = false;
    }
  });
});

const toggleDropdown = () => {
  showDropdown.value = !showDropdown.value;
};
</script>

<template>
  <div class="header">
    <h2>Dashboard Overview</h2>
    <div class="user-profile" v-if="user">
      <div class="user-dropdown">
        <div
          class="user-img"
          style="
            width: 45px;
            height: 45px;
            background-color: #4caf50;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 16px;
            cursor: pointer;
          "
          @click="toggleDropdown"
        >
          {{ userInitials }}
        </div>
        <div class="dropdown-menu" v-if="showDropdown">
       
          <div class="dropdown-item">
            <span>Profile</span>
          </div>
          <div class="dropdown-item">
            <span>Settings</span>
          </div>
          <div class="dropdown-item logout" @click="logout">
            <span>Logout</span>
          </div>
        </div>
      </div>
      <span class="welcome-text">Welcome, {{ user.displayName }}</span>
    </div>
  </div>
</template>
  


<style scoped>
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    background-color: #1a3550;
    padding: 10px 20px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    margin-top: 0%;
}
.header h2 {
    margin: 0;
    font-size: 22px;
}
.user-info {
    display: flex;
    flex-direction: column;
    margin-top: auto;
    background-color: #1a3550;
    padding: 15px;
    border-radius: 8px;
}
.user-info p {
    margin: 5px 0;
    font-size: 14px;
}

</style>