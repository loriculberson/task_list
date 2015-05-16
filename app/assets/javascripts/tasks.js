$(document).ready( function () {
   
  $('.tasks').DataTable( {
      "columnDefs": [
        { "orderable": false, "targets": 3 }
      ]
  })
} );
