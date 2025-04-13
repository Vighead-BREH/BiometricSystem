<script setup>
  import { ref } from 'vue'
  const isCollapsed = ref(true)
</script>
<template>
    <div class="sidebar" :class="{ collapsed: isCollapsed }" @mouseenter="isCollapsed = false" @mouseleave="isCollapsed = true">
    <h1 v-show="!isCollapsed">DASHBOARD</h1>

    <router-link to="/dashboard" class="nav-item active">
        <i class="fas fa-home"></i>
        <span v-show="!isCollapsed">Dashboard</span>
    </router-link>

    <router-link to="/records" class="nav-item">
        <i class="fas fa-list"></i>
        <span v-show="!isCollapsed">Records</span>
    </router-link>

    <div class="nav-item">
        <i class="fas fa-chart-bar"></i>
        <span v-show="!isCollapsed">Analytics</span>
    </div>

    <div class="nav-item">
        <i class="fas fa-cog"></i>
        <span v-show="!isCollapsed">Settings</span>
    </div>

    <div class="user-info" v-show="!isCollapsed">
        <p><strong>Currently Logged In:</strong></p>
        <p id="currentUser">BBM</p>
        <p>Admin</p>
        <button class="logout-button"><i class="fas fa-sign-out-alt"></i> Log Out</button>
    </div>
  </div>
</template>
<style scoped>
.sidebar {
    width: 250px;
    height: 100vh;
    background-color: #234666; 
    padding: 20px;
    border-right: 3px solid #0e2941; 
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
    z-index: 10;
    display: flex;
    flex-direction: column;
    transition: width 0.3s ease;
}
.sidebar.collapsed {
    width: 60px;
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
}

a.nav-item {
  text-decoration: none;
  color: inherit;
}


.nav-item span {
    transition: opacity 0.3s ease;
}

.sidebar.collapsed .nav-item span {
    opacity: 0;
    width: 0;
    overflow: hidden;
}

.nav-item i {
    font-size: 20px;
    width: 50px;
    text-align: center;
}

.user-info {
    margin-top: auto;
    margin-bottom: 13%;
    background-color: #1a3550;
    padding: 15px;
    border-radius: 8px;
    transition: opacity 0.3s ease;
}

.sidebar.collapsed .user-info {
    opacity: 0;
    pointer-events: none;
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
    font-weight: 500;
}

.logout-button:hover {
    background: #d32f2f;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
}

.nav-item {
    padding: 12px 15px;
    margin-bottom: 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
}
.nav-item:hover {
    background-color: #1a3550;
}
.nav-item.active {
    background-color: #1a3550;
    border-left: 3px solid #4caf50;
}
.nav-item i {
    margin-right: 10px;
    font-size: 18px;
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