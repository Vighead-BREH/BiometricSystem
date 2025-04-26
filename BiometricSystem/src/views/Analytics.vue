<script>
import AccountHeader from './AccountHeader.vue'
import Sidebar from './Sidebar.vue'
import Chart from 'chart.js/auto'

export default {
  components: {
    AccountHeader,
    Sidebar,
  },
  data() {
    return {
      isCollapsed: true,
      activeMenu: 'analytics',
      isDatePickerOpen: false,
      startDate: '',
      endDate: '',
      selectedMonth: '',
      currentDate: new Date(),
      totalAttendance: 100, 
      totalPercentage: '85%'
    }
  },
  computed: {
    formattedDate() {
      const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
      return this.currentDate.toLocaleDateString('en-US', options);
    }
  },
  mounted() {
    this.initCharts();
  },
  methods: {
    openDatePicker() {
      this.isDatePickerOpen = true;
    },
    closeDatePicker() {
      this.isDatePickerOpen = false;
    },
    applyDateFilter() {
      let dateRange = '';
      
      if (this.selectedMonth) {
        const year = new Date().getFullYear();
        const monthName = new Date(year, parseInt(this.selectedMonth) - 1, 1).toLocaleString('default', { month: 'long' });
        dateRange = `${monthName} ${year}`;
      } else if (this.startDate && this.endDate) {
        const start = new Date(this.startDate).toLocaleDateString();
        const end = new Date(this.endDate).toLocaleDateString();
        dateRange = `${start} to ${end}`;
      }
      
      if (dateRange) {
        console.log(`Applying date filter: ${dateRange}`);
        alert(`Date filter applied: ${dateRange}`);
      }
      
      this.isDatePickerOpen = false;
    },
    initCharts() {
      this.$nextTick(() => {
        const doughnutCtx = document.getElementById('doughnutChart').getContext('2d');
        const doughnutChart = new Chart(doughnutCtx, {
          type: 'doughnut',
          data: {
            labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
            datasets: [{
              data: [30, 20, 25, 15, 10],
              backgroundColor: [
                'rgba(75, 192, 192, 0.8)',
                'rgba(75, 192, 192, 0.6)',
                'rgba(75, 192, 192, 0.4)',
                'rgba(75, 192, 192, 0.3)',
                'rgba(75, 192, 192, 0.2)'
              ]
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false
          }
        });
      });
    }
  }
}
</script>

<template>
  <div>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" 
    rel="stylesheet" />

    <link rel="stylesheet" 
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <aside>
      <Sidebar />
    </aside>

    <div class="main-content">
      <div class="dashboard-container">
        <AccountHeader />
        
        <div class="header">
          <div class="header-left">
            <h1 class="page-title">Analytics</h1>
          </div>
          
          <div class="navigation">
            <div class="header-nav-item" @click="openDatePicker">
              <i class="fas fa-calendar"></i>
            </div>
            <div class="header-nav-item">
              <i class="fas fa-download"></i>
            </div>
          </div>
        </div>
        
        <div class="chart-card">
          <div class="chart-header">
            <h2 class="chart-title">Attendance Overview</h2>
          </div>
          
          <div class="chart-content">
            <div class="attendance-metrics">
              <div class="metric-card">
                <div class="metric-icon check-in-icon">
                  <i class="fas fa-user-check"></i>
                </div>
                <div class="metric-info">
                  <div class="metric-title">Check-In</div>
                  <div class="metric-value">87%</div>
                </div>
              </div>
              
              <div class="metric-card">
                <div class="metric-icon check-out-icon">
                  <i class="fas fa-user-times"></i>
                </div>
                <div class="metric-info">
                  <div class="metric-title">Check-Out</div>
                  <div class="metric-value">92%</div>
                </div>
              </div>
              
              <div class="metric-card">
                <div class="metric-icon absent-icon">
                  <i class="fas fa-user-slash"></i>
                </div>
                <div class="metric-info">
                  <div class="metric-title">Absent</div>
                  <div class="metric-value">8%</div>
                </div>
              </div>
              
              <div class="metric-card">
                <div class="metric-icon late-icon">
                  <i class="fas fa-hourglass-half"></i>
                </div>
                <div class="metric-info">
                  <div class="metric-title">Late</div>
                  <div class="metric-value">12%</div>
                </div>
              </div>
            </div>
            
            <div class="chart-container">
              <div class="polar-chart-container">
                <canvas id="doughnutChart"></canvas>
              </div>
              
              <div class="chart-side-panel">
                <div class="date-range-display">
                  <div class="panel-label">Date</div>
                  <div class="panel-value">{{ selectedDateRange }}</div>
                </div>
                
                <div class="total-container">
                  <div class="panel-label">Total Attendance</div>
                  <div class="panel-value">{{ totalAttendance }}</div>
                </div>
                
                <div class="percentage-container">
                  <div class="panel-label">Overall Percentage</div>
                  <div class="panel-value">{{ totalPercentage }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="date-picker-modal" :class="{ active: isDatePickerOpen }">
        <div class="date-picker-container">
          <div class="date-picker-header">
            <div class="date-picker-title">Select Date Range</div>
            <div class="date-picker-close" @click="closeDatePicker">×</div>
          </div>
          
          <div class="date-picker-body">
            <div class="date-range-container">
              <div class="date-input-group">
                <label class="date-input-label">Start Date</label>
                <input type="date" class="date-input" v-model="startDate">
              </div>
              
              <div class="date-input-group">
                <label class="date-input-label">End Date</label>
                <input type="date" class="date-input" v-model="endDate">
              </div>
            </div>
            
            <div class="month-selector">
              <label class="date-input-label">Start Month</label>
              <select v-model="selectedMonth">
                <option value="01">January</option>
                <option value="02">February</option>
                <option value="03">March</option>
                <option value="04">April</option>
                <option value="05">May</option>
                <option value="06">June</option>
                <option value="07">July</option>
                <option value="08">August</option>
                <option value="09">September</option>
                <option value="10">October</option>
                <option value="11">November</option>
                <option value="12">December</option>
              </select>
            </div>
          </div>
          
          <div class="date-picker-footer">
            <button class="date-picker-button cancel-button" @click="closeDatePicker">Cancel</button>
            <button class="date-picker-button apply-button" @click="applyDateFilter">OK</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.nav-item {
  padding: 12px 15px;
  margin-bottom: 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
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
  margin-top: 10px;
}

.logout-button:hover {
  background: #d32f2f;
  transform: translateY(-2px);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
}

.nav-item:hover {
  background-color: #1a3550;
}

.nav-item.active {
  background-color: #1a3550;
  border-left: 3px solid #4caf50;
}

.main-content {
  display: flex;
  flex-direction: column;
  margin-left: 6%;
  width: 93%;
}

.main-content.expanded {
  margin-left: 250px;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.header-left {
  display: flex;
  flex-direction: column;
}

.current-date {
  color: #7f8c8d;
  font-size: 14px;
  margin-top: 5px;
}

.page-title {
  font-size: 28px;
  color: #e74c3c;
  font-weight: 600;
  margin: 0;
}

.navigation {
  display: flex;
  gap: 15px;
}

.header-nav-item {
  width: 40px;
  height: 40px;
  border: 2px solid #34495e;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  border-radius: 5px;
  transition: all 0.3s;
}

.header-nav-item:hover {
  background-color: #34495e;
  color: white;
}

.chart-card {
  background-color: rgba(242, 242, 242, 0.9);
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  padding: 20px;
  position: relative;
  margin-bottom: 30px;
}

.chart-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.chart-title {
  font-size: 18px;
  color: #2c3e50;
  font-weight: 600;
}

.chart-content {
  display: flex;
  justify-content: space-between;
  gap: 15px;
}

.attendance-metrics {
  display: flex;
  flex-direction: column;
  gap: 8px;
  width: 25%;
}

.chart-container {
  width: 75%;
  display: flex;
  gap: 20px;
}

.polar-chart-container {
  flex: 1;
  position: relative;
}

.chart-side-panel {
  width: 200px;
  display: flex;
  flex-direction: column;
  gap: 15px;
  justify-content: center;
}

.date-range-display,
.total-container,
.percentage-container {
  background-color: #f9f9f9;
  border-radius: 8px;
  padding: 12px;
  text-align: center;
}

.panel-label {
  font-size: 13px;
  color: #7f8c8d;
  margin-bottom: 5px;
}

.panel-value {
  font-size: 18px;
  font-weight: 600;
  color: #2c3e50;
}

.metric-card {
  background-color: #f9f9f9;
  border-radius: 8px;
  padding: 10px;
  display: flex;
  align-items: center;
  transition: all 0.3s ease;
  height: 65px;
}

.metric-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

.metric-icon {
  width: 35px;
  height: 35px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 10px;
  font-size: 16px;
}

.check-in-icon {
  background-color: rgba(76, 175, 80, 0.2);
  color: #4caf50;
}

.check-out-icon {
  background-color: rgba(33, 150, 243, 0.2);
  color: #2196f3;
}

.absent-icon {
  background-color: rgba(244, 67, 54, 0.2);
  color: #f44336;
}

.late-icon {
  background-color: rgba(255, 152, 0, 0.2);
  color: #ff9800;
}

.metric-info {
  flex: 1;
}

.metric-title {
  font-size: 12px;
  color: #7f8c8d;
  margin-bottom: 2px;
}

.metric-value {
  font-size: 18px;
  font-weight: 600;
  color: #2c3e50;
}

.date-picker-modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 100;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.3s ease;
}

.date-picker-modal.active {
  opacity: 1;
  pointer-events: auto;
}

.date-picker-container {
  background-color: white;
  border-radius: 10px;
  padding: 25px;
  width: 90%;
  max-width: 400px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
  position: relative;
}

.date-picker-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.date-picker-title {
  font-size: 18px;
  font-weight: 600;
  color: #2c3e50;
}

.date-picker-close {
  cursor: pointer;
  font-size: 20px;
  color: #7f8c8d;
}

.date-picker-body {
  margin-bottom: 20px;
}

.date-range-container {
  display: flex;
  gap: 10px;
  margin-bottom: 20px;
}

.date-input-group {
  flex: 1;
}

.date-input-label {
  display: block;
  font-size: 14px;
  margin-bottom: 5px;
  color: #7f8c8d;
}

.date-input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 14px;
}

.month-selector {
  margin-top: 15px;
}

.month-selector select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 14px;
}

.date-picker-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.date-picker-button {
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-weight: 500;
  transition: all 0.3s ease;
}

.cancel-button {
  background-color: #e0e0e0;
  color: #333;
}

.apply-button {
  background-color: #4caf50;
  color: white;
}

.cancel-button:hover {
  background-color: #d5d5d5;
}

.apply-button:hover {
  background-color: #43a047;
}
</style>