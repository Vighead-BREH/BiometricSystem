<script setup>
import AccountHeader from '@/views/AccountHeader.vue'
import Sidebar from '@/views/Sidebar.vue'
</script>
<template>
  <link
    href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
    rel="stylesheet"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
  />
  <AccountHeader />
  <Sidebar />
  <div class="main-content">
      <h1>RECORDS</h1>
    <div class="filter-bar">
      <div class="status-filters">
        <button class="filter-btn checkin"><i class="fas fa-check"></i> Check-ins</button>
        <button class="filter-btn checkout"><i class="fas fa-sign-out-alt"></i> Check-outs</button>
        <button class="filter-btn late"><i class="fas fa-clock"></i> Late Check-ins</button>
        <button class="filter-btn absent"><i class="fas fa-times"></i> Absences</button>
        <button class="filter-btn all"><i class="fas fa-list"></i> All</button>
      </div>
    </div>
    
    <div class="date-search">
      <div class="date-range">
        <span><i class="fas fa-calendar-alt"></i> Date Range:</span>
        <input type="text" placeholder="yy-mm-dd">
        <span>to</span>
        <input type="text" placeholder="yy-mm-dd">
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search records...">
        <button class="search-btn"><i class="fas fa-search"></i></button>
      </div>
    </div>
    
    <div class="status-summary">
      <div class="status-card">
        <div class="status-icon checkin"><i class="fas fa-check"></i></div>
        <div class="status-number">142</div>
        <div class="status-label">Total Check-ins</div>
        <div class="status-trend trend-up"><i class="fas fa-arrow-up"></i> 8% from last week</div>
      </div>
      <div class="status-card">
        <div class="status-icon checkout"><i class="fas fa-sign-out-alt"></i></div>
        <div class="status-number">28</div>
        <div class="status-label">Total Check-outs</div>
        <div class="status-trend trend-up"><i class="fas fa-arrow-up"></i> 5% from last week</div>
      </div>
      <div class="status-card">
        <div class="status-icon absent"><i class="fas fa-times"></i></div>
        <div class="status-number">95%</div>
        <div class="status-label">Absent Students</div>
        <div class="status-trend trend-up"><i class="fas fa-arrow-up"></i> 3% from last month</div>
      </div>
      <div class="status-card">
        <div class="status-icon late"><i class="fas fa-clock"></i></div>
        <div class="status-number">7</div>
        <div class="status-label">Late Check-ins</div>
        <div class="status-trend trend-down"><i class="fas fa-arrow-down"></i> 2% from yesterday</div>
      </div>
    </div>
    
    <table class="records-table">
      <thead>
        <tr>
          <th>STUDENT</th>
          <th>LEVEL</th>
          <th>DATE</th>
          <th>STATUS</th>
          <th>TIME</th>
          <th>ACTIONS</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>John Smith</td>
          <td>Alpha</td>
          <td>2025-03-01</td>
          <td><span class="status-badge checkin"><i class="fas fa-check"></i> Check-in</span></td>
          <td>08:15 AM</td>
          <td>
            <span class="action-btn view-btn"><i class="fas fa-eye"></i></span>
            <span class="action-btn delete-btn"><i class="fas fa-trash"></i></span>
          </td>
        </tr>
        <tr>
          <td>Emily Johnson</td>
          <td>Beta</td>
          <td>2025-03-01</td>
          <td><span class="status-badge absent"><i class="fas fa-times"></i> Absent</span></td>
          <td>--:-- --</td>
          <td>
            <span class="action-btn view-btn"><i class="fas fa-eye"></i></span>
            <span class="action-btn delete-btn"><i class="fas fa-trash"></i></span>
          </td>
        </tr>
        <tr>
          <td>Michael Brown</td>
          <td>Gamma</td>
          <td>2025-03-01</td>
          <td><span class="status-badge late"><i class="fas fa-clock"></i> Late Check-in</span></td>
          <td>09:42 AM</td>
          <td>
            <span class="action-btn view-btn"><i class="fas fa-eye"></i></span>
            <span class="action-btn delete-btn"><i class="fas fa-trash"></i></span>
          </td>
        </tr>
        <tr>
          <td>Sarah Williams</td>
          <td>Alpha</td>
          <td>2025-03-01</td>
          <td><span class="status-badge checkout"><i class="fas fa-sign-out-alt"></i> Check-out</span></td>
          <td>03:15 PM</td>
          <td>
            <span class="action-btn view-btn"><i class="fas fa-eye"></i></span>
            <span class="action-btn delete-btn"><i class="fas fa-trash"></i></span>
          </td>
        </tr>
      </tbody>
    </table>
    
  
    <div class="pagination-container">
      <div>Showing 1-5 of 142 records</div>
      <div class="pagination">
        <div class="page-item active">1</div>
        <div class="page-item">2</div>
        <div class="page-item">3</div>
        <div class="page-item">4</div>
        <div class="page-item"><i class="fas fa-chevron-right"></i></div>
      </div>
    </div>
  </div>
</template>
<style scoped>
.menu-item {
  display: flex;
  align-items: center;
  padding: 15px 20px;
  margin: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

.menu-item.active {
  background-color: #2c5f8e;
  font-weight: bold;
}

.menu-item:not(.active) {
  background-color: #1a3148;
}

.menu-item:hover:not(.active) {
  background-color: #224262;
}

.menu-icon {
  width: 24px;
  height: 20px;
  border: 2px solid white;
  margin-right: 15px;
}

.main-content {
  padding: 20px;
}

.filter-bar {
  background-color: #15273a;
  padding: 10px;
  border-radius: 5px;
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.status-filters {
  display: flex;
  gap: 10px;
}

.filter-btn {
  color: white;
  border: none;
  padding: 5px 15px;
  border-radius: 15px;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 5px;
}

.filter-btn.checkin {
  background-color: #4caf50;
}

.filter-btn.checkout {
  background-color: #2196f3;
}

.filter-btn.late {
  background-color: #ff9800;
}

.filter-btn.absent {
  background-color: #f44336;
}

.filter-btn.all {
  background-color: #607d8b;
}

.date-search {
  display: flex;
  gap: 10px;
  margin-bottom: 20px;
}

.date-range {
  background-color: #15273a;
  padding: 10px;
  border-radius: 5px;
  display: flex;
  align-items: center;
  flex: 1;
}

.date-range input {
  background-color: #1a3148;
  border: 1px solid white;
  color: #aaa;
  padding: 5px 10px;
  margin: 0 10px;
  border-radius: 3px;
}

.search-box {
  background-color: #15273a;
  padding: 10px;
  border-radius: 5px;
  display: flex;
  align-items: center;
}

.search-box input {
  background-color: #1a3148;
  border: 1px solid white;
  color: #aaa;
  padding: 5px 10px;
  margin-right: 10px;
  border-radius: 3px;
  width: 200px;
}

.search-btn {
  background-color: #4caf50;
  color: white;
  border: none;
  padding: 7px 12px;
  border-radius: 3px;
  cursor: pointer;
}

.status-summary {
  display: flex;
  gap: 20px;
  margin-bottom: 20px;
}

.status-card {
  background-color: #15273a;
  padding: 15px;
  border-radius: 5px;
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 1;
}

.status-icon {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 5px;
  font-size: 18px;
}

.status-icon.checkin {
  background-color: #4caf50;
}

.status-icon.checkout {
  background-color: #2196f3;
}

.status-icon.absent {
  background-color: #f44336;
}

.status-icon.late {
  background-color: #ff9800;
}

.status-number {
  font-size: 24px;
  font-weight: bold;
}

.status-label {
  color: #aaa;
  font-size: 12px;
  margin: 5px 0;
  text-align: center;
}

.status-trend {
  font-size: 12px;
  display: flex;
  align-items: center;
  gap: 3px;
}

.trend-up {
  color: #4caf50;
}

.trend-down {
  color: #f44336;
}

.records-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

.records-table th {
  background-color: #234666;
  padding: 10px;
  text-align: left;
  font-weight: bold;
  color: white; 
}

.records-table tr:nth-child(odd) {
  background-color:  rgba(242, 242, 242, 0.9); 
  color: #0e2941; 
}

.records-table tr:nth-child(even) {
  background-color: white;
  color: #0e2941; 
}

.records-table td {
  padding: 15px 10px;
}

.status-badge {
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

.action-btn {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  margin-right: 10px;
  cursor: pointer;
  color: white;
}

.view-btn {
  background-color: #2196f3;
}

.delete-btn {
  background-color: #f44336;
}

.pagination-container {
  background-color: #15273a;
  padding: 15px;
  border-radius: 5px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.pagination {
  display: flex;
  gap: 10px;
}

.page-item {
  width: 30px;
  height: 30px;
  background-color: #1a3148;
  border: 1px solid white;
  border-radius: 3px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}

.page-item.active {
  color: white;
}

.page-item:not(.active) {
  color: #aaa;
}

.add-record-btn {
  background-color: #4caf50;
  color: white;
  border: none;
  padding: 8px 15px;
  border-radius: 3px;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 5px;
}


.global-search {
  position: relative;
  margin-left: auto;
  margin-right: 20px;
}

.global-search input {
  background-color: #1a3148;
  border: 1px solid #2c5f8e;
  color: white;
  padding: 8px 15px 8px 40px;
  border-radius: 20px;
  width: 250px;
  font-size: 14px;
}

.global-search input::placeholder {
  color: #8a9bac;
}

.global-search .search-icon {
  position: absolute;
  left: 12px;
  top: 9px;
  color: #8a9bac;
}
</style>