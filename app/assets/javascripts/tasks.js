$(document).ready( function () {
   
  $('.tasks').DataTable( {
      "columnDefs": [
        { "orderable": false, "targets": [3,4] }
      ]
  });

  $('.incomplete').on('click', '.task-status', function( event ){
    var checkbox = $(event.target);
    var taskUpdateUrl = checkbox.data('url');
    $.ajax({
      url: taskUpdateUrl,
      type: 'PATCH',
      data: { task: { completed: 1 } }
    }).done(function(){
      var tr = checkbox.parents('tr');
      var complete = $('.complete tbody');
      complete.append(tr);
      checkbox.removeAttr('checked');
    })
  });

  $('.complete').on("click", '.task-status', function( event ){
    var checkbox = $(event.target);
    var taskUpdateUrl = checkbox.data('url');
    $.ajax({
      url: taskUpdateUrl,
      type: 'PATCH',
      data: { task: { completed: 0 } }
    }).done(function(){
      var tr = checkbox.parents('tr');
      var incomplete = $('.incomplete tbody');
      incomplete.append(tr);
      checkbox.removeAttr('checked');
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