// Add an admin user using AJAX
function viewUser() {
	
	var $userId = $(this).closest('a').attr('data-userId');
	
	$.ajax({
		
		url: '/usjobs/service/user/' + $userId,
		dataType: 'json',
		success: function( user ) {
			
			$('#user-display #userId').html( user.id ),
			$('#user-display #username').html( user.username ),
			$('#user-display #password').html( user.password ),
			$('#user-display #email').html( user.email ),
			$('#user-display #firstName').html( user.firstName ),
			$('#user-display #lastName').html( user.lastName )
		}
	})
	
	$('#user-display').dialog('open');	
}

function toggleUser() {
	
	var $userId = $(this).closest('a').attr('data-userId');
	
	$.ajax({
		
		url: '/usjobs/service/user/toggle/' + $userId,
		method: 'PUT',
		context: $(this),
		success: function() {
			
			var newHtml;
			
			if ( $(this).hasClass('disable') ) {
				
				$(this).removeClass('btn-danger disable').addClass('btn-warning enable');
				newHtml = "<i class='fa fa-level-up' aria-hidden='true'></i>&nbsp;&nbsp;Enable";
				
			} else if ( $(this).hasClass('enable') ) {
				
				$(this).removeClass('btn-warning enable').addClass('btn-danger disable');
				newHtml = "<i class='fa fa-level-down' aria-hidden='true'></i>&nbsp;&nbsp;Disable";
				
			} else {
				
				console.log('Could not determine toggle type.');
			}
			
			$(this).html( newHtml );
		}			
	});
}

function addUser() {
	
	var user = {
			username: $('input[name=username]').val(),
			password: $('input[name=password]').val(),
			password2: $('input[name=password2]').val(),
			email: $('input[name=email]').val(),
			firstName: $('input[name=firstName]').val(),
			lastName: $('input[name=lastName]').val()				
	};
	
	$.ajax({
		
		url: '/usjobs/service/users',
		method: 'POST',
		dataType: 'json',
		contentType: 'application/json',
		data: JSON.stringify( user ),
		success: function( user ) {
			
			var $newRow = $("<tr><td>" + user.id + "</td><td>" +
					user.username + "</td><td>" + user.firstName + "</td><td>" +
					user.lastName + "</td><td>" + user.email + "</td><td>" +
					user.userRoles + "</td><td>" + 
					"<td><security:authorize access='hasRole('ROLE_ADMIN')'>" +
					"<a class='btn btn-info' role='button'" +
						"href='view/${user.id}'><i class='fa fa-street-view'" +
						"aria-hidden='true'></i>&nbsp;&nbsp; View</a>" +
					"<a class='btn btn-success' role='button'" +
						"href='edit?id=${user.id}'><i" +
						"class='fa fa-pencil-square-o' aria-hidden='true'>" +
						"</i>&nbsp;&nbsp;Edit</a>" +
					"<c:if test='${user.enabled}'>" +
					"<a class='btn btn-danger' role='button'" +
					"href='disable?id=${user.id}'><i" +
					"class='fa fa-level-down' aria-hidden='true'>" +
					"</i>&nbsp;&nbsp;Disable</a>" +
					"</c:if>" +
					"<c:if test='${not user.enabled}'>" +
					"<a class='btn btn-warning' role='button'" +
					"href='enable?id=${user.id}'><i" +
					"class='fa fa-level-up' aria-hidden='true'>" +
					"</i>&nbsp;&nbsp;Enable</a>" + 
					"</c:if>" +
					"</security:authorize></td></tr>"					
			);
			
			$('#users').append($newRow);
			
			// Need to re-attach event handlers to account for this newly added row.
		    $(".view").unbind('click.namespace').bind('click.namespace', viewUser);
		    $('.disable, .enable').unbind('click.namespace').bind('click.namespace', toggleUser);
		//  $(".editJob").unbind('click.namespace').bind('click.namespace', editUser);
		}		
	});
}

$( function() {
	
	$('#user-form').dialog({
		autoOpen: false,
		minWidth: 500,
		title: "Add User",
		close: function( event, ui ) {
			$('input[name=userId]').val('')
		},
		buttons : {
			"Save" : function() {
				if ( ! $('input[name=userId]').val() ) {
					addUser();
				} 
				$("#user-form").dialog("close");
			},
			Cancel : function() {
				$(this).dialog("close");
			}
		}
	});
	
	$('#user-display').dialog({
		autoOpen: false,
		minWidth: 500,
		title: "Display User"
	});
	
	// Need to re-attach event handlers to account for this newly added row.
    $(".view").unbind('click.namespace').bind('click.namespace', viewUser);
    $('.disable, .enable').unbind('click.namespace').bind('click.namespace', toggleUser);
//  $(".editJob").unbind('click.namespace').bind('click.namespace', editUser);
	
	$('#add').click( function() {
		
		$('#addUserForm')[0].reset();
		$('#user-form').dialog('open');
	});
	
	$('.view').click( viewUser );
});