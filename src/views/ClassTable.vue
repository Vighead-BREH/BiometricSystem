<template>
    <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Grade Level</th>
              <th>Section</th>
              <th>Schedule</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>001</td>
              <td>Project Alpha</td>
              <td>Development</td>
              <td>2025-03-01</td>
              <td><span class="status-badge status-upcoming">Upcoming</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-button view-button">
                    <i class="fas fa-eye"></i>
                  </button>
                  <button class="action-button edit-button">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button class="action-button delete-button">
                    <i class="fas fa-trash"></i>
                  </button>
                </div>
              </td>
            </tr>
            <tr>
              <td>002</td>
              <td>Project Beta</td>
              <td>Design</td>
              <td>2025-02-15</td>
              <td><span class="status-badge status-ongoing">Ongoing</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-button view-button">
                    <i class="fas fa-eye"></i>
                  </button>
                  <button class="action-button edit-button">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button class="action-button delete-button">
                    <i class="fas fa-trash"></i>
                  </button>
                </div>
              </td>
            </tr>
            <tr>
              <td>003</td>
              <td>Project Gamma</td>
              <td>Marketing</td>
              <td>2025-03-10</td>
              <td><span class="status-badge status-cancelled">Cancelled</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-button view-button">
                    <i class="fas fa-eye"></i>
                  </button>
                  <button class="action-button edit-button">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button class="action-button delete-button">
                    <i class="fas fa-trash"></i>
                  </button>
                </div>
              </td>
            </tr>
            <tr>
              <td>004</td>
              <td>Project Delta</td>
              <td>Research</td>
              <td>2025-01-20</td>
              <td><span class="status-badge status-ongoing">Ongoing</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-button view-button">
                    <i class="fas fa-eye"></i>
                  </button>
                  <button class="action-button edit-button">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button class="action-button delete-button">
                    <i class="fas fa-trash"></i>
                  </button>
                </div>
              </td>
            </tr>
            <tr>
              <td>005</td>
              <td>Project Epsilon</td>
              <td>Support</td>
              <td>2025-03-05</td>
              <td><span class="status-badge status-completed">Completed</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-button view-button">
                    <i class="fas fa-eye"></i>
                  </button>
                  <button class="action-button edit-button">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button class="action-button delete-button">
                    <i class="fas fa-trash"></i>
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>

        <div class="pagination">
          <button><i class="fas fa-angle-double-left"></i></button>
          <button><i class="fas fa-angle-left"></i></button>
          <button class="active">1</button>
          <button>2</button>
          <button>3</button>
          <button><i class="fas fa-angle-right"></i></button>
          <button><i class="fas fa-angle-double-right"></i></button>
        </div>
    </div>
</template>
<style scoped>
.table-container {
    margin-top: 20px;
    background-color: #1a3550;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
}
table {
    width: 100%;
    border-collapse: collapse;
    margin: auto;
    border-radius: 8px;
    overflow: hidden;
}
th, td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #0e2941; 
}
th {
    background-color: #234666; 
    color: white;
    font-weight: 500;
    text-transform: uppercase;
    font-size: 14px;
}
td {
    background-color: rgba(242, 242, 242, 0.9); 
    color: #0e2941; 
}
tr:last-child td {
    border-bottom: none;
}
tr:hover td {
    background-color: rgba(242, 242, 242, 1);
}
.action-buttons {
    display: flex;
    gap: 5px;
    justify-content: center;
}
.action-button {
    padding: 6px 12px;
    font-size: 14px;
    border-radius: 5px;
}
.view-button {
    background: #2196F3;
    color: white;
}
.edit-button {
    background: #4caf50;
    color: white;
}
.delete-button {
    background: #f44336; 
    color: white;
}

.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    gap: 5px;
}
.pagination button {
    padding: 8px 12px;
    background-color: #234666;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.pagination button:hover {
    background-color: #1a3550;
}
.pagination button.active {
    background-color: #4caf50;
}
.status-badge {
    padding: 4px 8px;
    border-radius: 5px;
    font-size: 12px;
}
.status-upcoming {
    background-color: #2196F3;
    color: white;
}
.status-completed {
    background-color: #4caf50;
    color: white;
}
.status-cancelled {
    background-color: #f44336;
    color: white;
}
.status-ongoing {
    background-color: #ff9800;
    color: white;
}
</style>