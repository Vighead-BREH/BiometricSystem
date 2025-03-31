<template>
    <div class="stats-container">
        <div class="stat-card">
            <div class="stat-header">
            <div>
                <h3 class="stat-value">152</h3>
                <p class="stat-label">Total Check-ins Today</p>
            </div>
            <div class="stat-icon">
                <i class="fas fa-user-check"></i> <!-- Changed Icon -->
            </div>
            </div>
            <div class="stat-trend"><i class="fas fa-arrow-up"></i> 12% from last month</div>
        </div>

        <div class="stat-card">
            <div class="stat-header">
            <div>
                <h3 class="stat-value">28</h3>
                <p class="stat-label">Total Check-outs Today</p>
            </div>
            <div
                class="stat-icon"
                style="background-color: rgba(33, 150, 243, 0.2); color: #2196f3"
            >
                <i class="fas fa-user-times"></i>
            </div>
            </div>
            <div class="stat-trend"><i class="fas fa-arrow-up"></i> 5% from last week</div>
        </div>

        <div class="stat-card">
            <div class="stat-header">
            <div>
                <h3 class="stat-value">95%</h3>
                <p class="stat-label">Absent Students</p>
            </div>
            <div class="stat-icon" style="background-color: rgba(255, 152, 0, 0.2); color: #ff9800">
                <i class="fas fa-user-slash"></i>
            </div>
            </div>
            <div class="stat-trend"><i class="fas fa-arrow-up"></i> 3% from last month</div>
        </div>

        <div class="stat-card">
            <div class="stat-header">
            <div>
                <h3 class="stat-value">7</h3>
                <p class="stat-label">Late Check-ins</p>
            </div>
            <div class="stat-icon" style="background-color: rgba(244, 67, 54, 0.2); color: #f44336">
                <i class="fas fa-hourglass-half"></i>
            </div>
            </div>
            <div class="stat-trend trend-down">
            <i class="fas fa-arrow-down"></i> 2% from yesterday
            </div>
        </div>
    </div>
</template>
<style scoped>
.stats-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 18px;
    margin-bottom: 30px;
}
.stat-card {
    background-color: #1a3550;
    border-radius: 10px;
    padding: 20px;
    display: flex;
    flex-direction: column;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease;
}
.stat-card:hover {
    transform: translateY(-5px);
    cursor: pointer;
}
.stat-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}
.stat-icon {
    width: 50px;
    height: 50px;
    background-color: rgba(76, 175, 80, 0.2);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #4caf50;
    font-size: 24px;
}
.stat-value {
    font-size: 28px;
    font-weight: 600;
    margin: 0;
}
.stat-label {
    font-size: 14px;
    color: #b3b3b3;
    margin: 0;
}
.stat-trend {
    display: flex;
    align-items: center;
    font-size: 14px;
    color: #4caf50;
    margin-top: 5px;
}
.status-badge {
    padding: 5px 10px;
    border-radius: 12px;
    font-size: 12px;
    font-weight: 500;
    text-align: center;
    display: inline-block;
}
.status-upcoming {
    background-color: rgba(33, 150, 243, 0.2);
    color: #2196f3;
    border: 1px solid #2196f3;
}
.status-cancelled {
    background-color: rgba(244, 67, 54, 0.2);
    color: #f44336;
    border: 1px solid #f44336;
}
.status-ongoing {
  background-color: rgba(255, 193, 7, 0.2);
    color: #ffc107;
    border: 1px solid #ffc107;
}
.status-completed {
    background-color: rgba(76, 175, 80, 0.2);
    color: #4caf50;
    border: 1px solid #4caf50;
}
</style>