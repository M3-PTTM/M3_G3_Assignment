// const customers = [
//     {id: 1, username: 'phucSG', name: 'Hồ Văn Phúc', email: 'lmht721@gmail.com', phone: '0935641901', cccd: '123456789987', role: 'ROLE_USER'},
//     {id: 2, username: 'manDN', name: 'Mẫn', email: 'nguyenva@gmail.com', phone: '0912345678', cccd: '223456789987', role: 'ROLE_USER'},
//     {id: 3, username: 'hieuDN', name: 'Hiếu', email: 'tranvb@gmail.com', phone: '0923456789', cccd: '323456789987', role: 'ROLE_USER'},
//     {id: 4, username: 'congDN', name: 'Công', email: 'levanc@gmail.com', phone: '0934567890', cccd: '423456789987', role: 'ROLE_USER'},
//     {id: 5, username: 'linhDN', name: 'Linh', email: 'phamtd@gmail.com', phone: '0945678901', cccd: '523456789987', role: 'ROLE_USER'},
//     {id: 6, username: 'haoSmall', name: 'Hào nhỏ', email: 'doante@gmail.com', phone: '0956789012', cccd: '623456789987', role: 'ROLE_USER'},
//     {id: 7, username: 'haoBig', name: 'Hào lớn', email: 'vuongvf@gmail.com', phone: '0967890123', cccd: '723456789987', role: 'ROLE_USER'},
//     {id: 8, username: 'quangSG', name: 'Quang', email: 'ngotg@gmail.com', phone: '0978901234', cccd: '823456789987', role: 'ROLE_USER'},
//     {id: 9, username: 'tienSG', name: 'Tiến', email: 'huynhvh@gmail.com', phone: '0989012345', cccd: '923456789987', role: 'ROLE_USER'},
//     {id: 10, username: 'vyDN', name: 'Vỹ', email: 'huynhvh@gmail.com', phone: '0989012345', cccd: '923456789987', role: 'ROLE_USER'},
// ];
//
// const itemsPerPage = 8;
// let currentPage = 1;
//
// function renderTable() {
//     const tableBody = document.getElementById('customerTable');
//     tableBody.innerHTML = '';
//
//     const startIndex = (currentPage - 1) * itemsPerPage;
//     const endIndex = startIndex + itemsPerPage;
//
//     const paginatedCustomers = customers.slice(startIndex, endIndex);
//
//     paginatedCustomers.forEach(customer => {
//         const row = `<tr>
//             <th scope="row">${customer.id}</th>
//             <td>${customer.username}</td>
//             <td>${customer.name}</td>
//             <td>${customer.email}</td>
//             <td>${customer.phone}</td>
//             <td>${customer.cccd}</td>
//             <td>${customer.role}</td>
//             <td>
//                 <button class="btn btn-warning btn-sm">Sửa</button>
//                 <button class="btn btn-danger btn-sm">Xóa</button>
//             </td>
//         </tr>`;
//         tableBody.insertAdjacentHTML('beforeend', row);
//     });
//
//     document.getElementById('prevPage').parentElement.classList.toggle('disabled', currentPage === 1);
//     document.getElementById('nextPage').parentElement.classList.toggle('disabled', endIndex >= customers.length);
// }
//
// document.getElementById('prevPage').addEventListener('click', function(event) {
//     event.preventDefault();
//     if (currentPage > 1) {
//         currentPage--;
//         renderTable();
//     }
// });
//
// document.getElementById('nextPage').addEventListener('click', function(event) {
//     event.preventDefault();
//     if (currentPage * itemsPerPage < customers.length) {
//         currentPage++;
//         renderTable();
//     }
// });
//
// renderTable();

document.getElementById('addCustomerBtn').addEventListener('click', function() {
    var modal = new bootstrap.Modal(document.getElementById('customerFormModal'));
    modal.show();
});
