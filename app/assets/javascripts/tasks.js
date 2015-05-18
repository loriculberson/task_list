$(document).ready( function () {
   
  $('.tasks').DataTable( {
      "columnDefs": [
        { "orderable": false, "targets": [3,4] }
      ]
  })

  $('.incomplete-tasks .task-status').click(function( event ){
    var taskUpdateUrl = $(event.target).data('url')
      $.ajax({
        url: taskUpdateUrl,
        type: 'PATCH',
        data: { task: { completed: 1 } }
      })

  })

});


//hey jquery find the checkboxes
//when user clicks checkbox
//look for checkbox that was checked 
//get the data-url from the checkbox
//send an ajax request to change task-status in the database
//.task-status are all the checkboxes
//event is the action that takes place on one single element
//element is one of the possible checkboxes
//$(event.target) $ creates the jquery object that wraps the checkbox that was checked
// .data('url') gets the url to make the ajax request to the url which is the update action in task
//