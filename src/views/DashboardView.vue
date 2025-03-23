<script setup>
  import Sidebar from '@/views/Sidebar.vue'
  import AccountHeader from '@/views/AccountHeader.vue'
  import Status from '@/views/Status.vue'
  import SearchBar from '@/views/SearchBar.vue'
  import ClassTable from '@/views/ClassTable.vue'
</script>
<template>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <title>Main</title>
    <aside>
      <Sidebar />
    </aside>
    <div class="main-content">
      <AccountHeader />
      <Status />
      <SearchBar />
      <ClassTable />
    </div>
</template>
<style scoped>
.main-content {
    margin-left: 270px;
    padding: 20px;
    text-align: center;
    position: relative;
    z-index: 1;
}

</style>