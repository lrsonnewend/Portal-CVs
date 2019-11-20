$(document).ready(function() {
    $('#objects').DataTable({
        
        dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-8 col-md-12'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-11'p>>",
        buttons: [
            'csv'
        ],
        columnDefs: [{
                orderable: false,
                targets: 3
            }],  
        scrollY: "400px",
        scrollCollapse: true,
        paging: true
    });
    $('.dataTables_length').addClass('bs-select');
});

