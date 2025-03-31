<template>
    <div class="header">
        <h2>Dashboard Overview</h2>
        <div class="user-profile">
            <div
            class="user-img"
            style="
                width: 50px;
                height: 50px;
                background-color: #4caf50;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
            "
            >
            Edrian
            </div>
            <span>Welcome, Edrian</span>
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
    padding: 15px 20px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
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