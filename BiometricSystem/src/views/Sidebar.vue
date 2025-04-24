<script setup>
import { ref, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import { useAuth } from '@/composable/useAuth' 

const { logout } = useAuth() 

const isCollapsed = ref(false)
const activeItem = ref('dashboard')
const route = useRoute()

watch(
  () => route.path,
  (newPath) => {
    const path = newPath.split('/')[1] || 'dashboard'
    activeItem.value = path
  },
  { immediate: true }
)

function toggleSidebar() {
  isCollapsed.value = !isCollapsed.value
  localStorage.setItem('sidebarCollapsed', isCollapsed.value)
}

function setActiveItem(itemName) {
  activeItem.value = itemName
}

onMounted(() => {
  const savedState = localStorage.getItem('sidebarCollapsed')
  if (savedState !== null) {
    isCollapsed.value = savedState === 'true'
  }
    
  const currentPath = route.path.split('/')[1] || 'dashboard'
  activeItem.value = currentPath
})
</script>

<template>
  <div class="sidebar" :class="{ collapsed: isCollapsed }">
    <div class="toggle-btn" @click="toggleSidebar" title="Toggle Sidebar">
      <i class="fas" :class="isCollapsed ? 'fa-bars' : 'fa-times'"></i>
    </div>
        
    <div class="nav-content" :class="{ hidden: isCollapsed }">
      <h1>DASHBOARD</h1>
            
      <router-link
        to="/dashboard"
        class="nav-item"
        :class="{ active: activeItem === 'dashboard' }"
        @click="setActiveItem('dashboard')"
      >
        <i class="fas fa-home"></i>
        <span>Dashboard</span>
      </router-link>
      
      <router-link
        to="/records"
        class="nav-item"
        :class="{ active: activeItem === 'records' }"
        @click="setActiveItem('records')"
      >
        <i class="fas fa-list"></i>
        <span>Records</span>
      </router-link>
      
      <router-link
        to="/analytics"
        class="nav-item"
        :class="{ active: activeItem === 'analytics' }"
        @click="setActiveItem('analytics')"
      >
        <i class="fas fa-chart-bar"></i>
        <span>Analytics</span>
      </router-link>
      
      <router-link
        to="/settings"
        class="nav-item"
        :class="{ active: activeItem === 'settings' }"
        @click="setActiveItem('settings')"
      >
        <i class="fas fa-cog"></i>
        <span>Settings</span>
      </router-link>
      
      <div class="user-info">
        <p><strong>Currently Logged In:</strong></p>
        <p id="currentUser">BBM</p>
        <p>Admin</p>
        <button class="logout-button" @click="logout">
          <i class="fas fa-sign-out-alt"></i> Log Out
        </button>
      </div>
    </div>
        
    <div class="mini-nav" v-if="isCollapsed">
      <router-link
        to="/dashboard"
        class="mini-item"
        :class="{ active: activeItem === 'dashboard' }"
        title="Dashboard"
      >
        <i class="fas fa-home"></i>
      </router-link>
            
      <router-link
        to="/records"
        class="mini-item"
        :class="{ active: activeItem === 'records' }"
        title="Records"
      >
        <i class="fas fa-list"></i>
      </router-link>
            
      <router-link
        to="/analytics"
        class="mini-item"
        :class="{ active: activeItem === 'analytics' }"
        title="Analytics"
      >
        <i class="fas fa-chart-bar"></i>
      </router-link>
            
      <router-link
        to="/settings"
        class="mini-item"
        :class="{ active: activeItem === 'settings' }"
        title="Settings"
      >
        <i class="fas fa-cog"></i>
      </router-link>
            
      <div class="mini-logout" @click="logout" title="Log Out">
        <i class="fas fa-sign-out-alt"></i>
      </div>
    </div>
  </div>
</template>

<style scoped>
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: scale(0.95);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.sidebar {
  width: 20%;
  height: 100vh;
  background-color: #234666;
  padding: 0;
  border-right: 3px solid #0e2941;
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
  z-index: 10;
  display: flex;
  flex-direction: column;
  transition: width 0.5s ease;
  overflow: hidden;
}

.sidebar.collapsed {
  width: 70px; 
}

.toggle-btn {
  width: 60px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  color: white;
  font-size: 24px;
  margin-top: 12px;
  margin-left: 6px;
}

.toggle-btn:hover {
  background-color: #1a3550;
  border-radius: 5px;
  transition: all 0.3s ease;
  color: #4caf50;
}

.nav-content {
  display: flex;
  flex-direction: column;
  padding: 20px;
  width: 250px;
  opacity: 1;
  transition: opacity 0.3s ease;
}

.nav-content.hidden {
  opacity: 0;
  pointer-events: none;
}

.sidebar h1 {
  color: white;
  font-size: 24px;
  margin-bottom: 30px;
  position: relative;
}

.sidebar h1::after {
  content: '';
  position: absolute;
  bottom: -10px;
  left: 0;
  width: 40px;
  height: 3px;
  background-color: #4caf50;
}

.nav-item {
  padding: 12px 15px;
  margin-bottom: 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  color: white;
}

a.nav-item {
  text-decoration: none;
  color: inherit;
}

.nav-item:hover {
  background-color: #1a3550;
}

.nav-item.active {
  background-color: #1a3550;
  border-left: 3px solid #4caf50;
}

.nav-item i {
  font-size: 20px;
  width: 30px;
  text-align: center;
  margin-right: 10px;
}

.user-info {
  margin-bottom: 1%;
  margin-top: 50%;
  background-color: #1a3550;
  padding: 12px;
  border-radius: 8px;
  transition: opacity 0.3s ease;
}

.logout-button {
    padding: 10px 15px;
    width: 100%;
    border: 0;
    background: #f44336;
    color: white;
    cursor: pointer;
    border-radius: 7px;
    transition: all 0.3s ease;
    margin-top: 10px;
    margin-bottom: 1px;
    font-weight: 500;
}
.logout-button:hover {
    background: #d32f2f; 
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
}
</style>