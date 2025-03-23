<template>
    <div class="search-box">
        <div class="search-container">
          <i class="fas fa-search search-icon"></i>
          <input type="text" class="search-input" placeholder="Search records..." />
        </div>
        <div class="action-container">
          <button class="search-button"><i class="fas fa-search"></i> Search</button>
          <button class="add-button" id="addButton"><i class="fas fa-plus"></i> Add New</button>
        </div>
    </div>
</template>
<style>
.search-box {
    margin-top: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-left: 5%;
}
.search-container {
    display: flex;
    align-items: center;
    position: relative;
    width: 60%;
}
.search-icon {
    position: absolute;
    left: 10px;
    color: #8a8a8a;
}
.search-input {
    padding: 12px 12px 12px 35px;
    font-size: 16px;
    border: 2px solid #234666;
    border-radius: 7px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.9);
    transition: all 0.3s ease;
}
.search-input:focus {
    outline: none;
    border-color: #4caf50;
    box-shadow: 0 0 8px rgba(76, 175, 80, 0.5);
}
.action-container {
    display: flex;
    gap: 10px;
}
.add-button, .search-button, .action-button {
    padding: 10px 20px;
    font-size: 16px;
    border: 0;
    background: #234666; 
    color: white;
    cursor: pointer;
    border-radius: 7px;
    transition: background 0.3s ease;
    display: flex;
    align-items: center;
    gap: 5px;
}
.add-button {
    background: #4caf50;
}
.add-button:hover, .search-button:hover, .action-button:hover {
    opacity: 0.9;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
}
.search-button:hover {
    background: #0e2941; 
}

</style>