$(document).ready(function() {
 	$("#new-task-button").click(function() {
	  $('.task-line:first').clone().appendTo('#task-form');
	});
	$('#items').sortable({
		axis: 'y',
		dropOnEmpty: false,
		handle: '.handle',
		cursor: 'crosshair',
		items: 'li',
		opacity: 0.4,
		scroll: true,
		update: function(){
			$.ajax({
				type: 'post',
				data: $('#items').sortable('serialize'),
				dataType: 'script',
				complete: function(request){
			  	$('#items').effect('highlight');
				},
				url: '/tasks/' + $('#items').data("tid") + '/items/sort'
			})
		}
	});
});
