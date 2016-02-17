function todoDone(todoId, value) {
	$.ajax({
		type: "PUT",
		url: "todos/update",
		dataType : 'json',
		data: {
			todo: {
				id: todoId,
				finished: !value
			}
		},
		success: function() {
		}
	});
}

function destroyTodo(todoId, element) {
	$.ajax({
		type: "DELETE",
		url: "todos/destroy",
		data: {
			todo: {
				id: todoId
			}
		},
		success: function() {
			$(element).closest('li').hide();
		},
		dataType : 'json'
	});
}

function appendForm(taskId, element) {
	return;
	// if ($('#newSubtask').length) {
	// 	$('#newSubtask').remove();
	// 	return;
	// }
	// $(element).closest('li').append(
	// 		"<ul id='newSubtask' class='nav nav-tabs nav-stacked'>" +
	// 			"<li>"+
	// 				"<div class='row'>" +
	// 				"<div class='span3'>" +
	// 				"<input type='text' id='subTaskName' placeholder='Subtask name here'></input>"+
	// 				"</div>"+
	// 				"<div class='span1'>" +
	// 					"<button class='btn-mini btn-success' id='save' onClick='saveSubtask("+taskId+")'>Save</button>"+
	// 				"</div>"+
	// 				"</div>"+
	// 			"</li>"+
	// 		"</ul>"
	// );
}
