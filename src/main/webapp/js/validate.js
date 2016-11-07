/**
 * This JS file is used for validation.
 */
$(document).ready(function() {
	
	// JOB SEEKER PROFILE VALIDATION
	/* Validate the upload. Make sure it's pdf, doc, or docx */
	$("#uploadForm").validate({
		rules: {
			resume: {
				required: true,
				accept: "application/pdf, application/msword," +
						"application/vnd.openxmlformats-officedocument.wordprocessingml.document"
			}
		}
	});
	
	$("#editProfileSeeker").validate({
		rules: {
			password: {
				required: true,
				minlength: 5,
				nowhitespace: true
			},
			confirm_password: {
				required: true,
				minlength: 5,
				equalTo: "#password",
				nowhitespace: true
			},
			email: {
				required: true,
				email: true,
			},
			street: {
				required: true,
				minlength: 1,
			},
			city: {
				required: true,
				minlength: 1,
			},
			state: {
				required: true,
				stateUS: true,
			}, 
			zip: {
				required: true,
				minlength: 5,
				zipcodeUS: true,
			}
		}
	});
	// END JOB SEEKER VALIDATION
	
	
	// EMPLOYER VALIDATION
	$("#editProfileEmployer").validate({
		rules: {
			password: {
				required: true,
				minlength: 5,
				nowhitespace: true
			},
			confirm_password: {
				required: true,
				minlength: 5,
				equalTo: "#password",
				nowhitespace: true
			},
			email: {
				required: true,
				email: true,
			},
			street: {
				required: true,
				minlength: 1,
			},
			city: {
				required: true,
				minlength: 1,
			},
			state: {
				required: true,
				stateUS: true,
			}, 
			zip: {
				required: true,
				minlength: 5,
				zipcodeUS: true,
			}
		}
	});
	
	// ADMIN VALIDATION
	$("#editProfileAdmin").validate({
		rules: {
			password: {
				required: true,
				minlength: 5,
				nowhitespace: true
			},
			confirm_password: {
				required: true,
				minlength: 5,
				equalTo: "#password",
				nowhitespace: true
			},
			email: {
				required: true,
				email: true,
			},
			street: {
				required: true,
				minlength: 1,
			},
			city: {
				required: true,
				minlength: 1,
			},
			state: {
				required: true,
				stateUS: true,
			}, 
			zip: {
				required: true,
				minlength: 5,
				zipcodeUS: true,
			}
		}
	});
	
	/* Validate application form */
	$("#applicationForm").validate({
		rules: {
			firstName: {
				required: true,
				minlength: 1,
				lettersonly: true
			},
			lastName: {
				required: true,
				minlength: 1,
				lettersonly: true
			},
			email: {
				required: true,
				email: true,
			},
			phoneNumber: {
				required: true,
				phoneUS: true
			},
			resume: {
				required: true
			}
		},
		messages: {
			resume: "  You need to select a resume. Add a resume if you haven't already."
		}
	});
	
	/* Valid add job form */
	$("#addJobForm").validate({
		rules: {
			jobTitle: {
				required: true,
				minlength: 1
			},
			website: {
				required: true,
				url: true				
			},
			location: {
				required: true,
				minlength: 1
			},
			jobDescription: {
				required: true,
				minlength: 5
			},
			salary: {
				required: true,
				digits: true
			}
		}
	});
	
	/* Validate edit job form */
	$("#editJobForm").validate({
		rules: {
			jobTitle: {
				required: true,
				minlength: 1
			},
			website: {
				required: true,
				url: true				
			},
			location: {
				required: true,
				minlength: 1
			},
			jobDescription: {
				required: true,
				minlength: 5
			},
			salary: {
				required: true,
				digits: true
			}
		}
	});
	
	/* Admin's view in editing a user from user management */
	$("#adminEditUserForm").validate({
		rules: {
			password : {
				required: true,
				minlength: 5
			},
			email: {
				required: true,
				email: true
			},
			'address.street': {
				required: true,
				minlength: 1
			},
			'address.city': {
				required: true,
				minlength: 1
			},
			'address.state': {
				required: true,
				stateUS: true
			}, 
			'address.zip': {
				required: true,
				minlength: 5,
				zipcodeUS: true
			}
		}
	});
	
	/* Admin's add user management validate*/
	$("#addUserForm").validate({
		rules: {
			username: {
				required: true,
				minlength: 1
			},
			password : {
				required: true,
				minlength: 5
			},
			password2: {
				required: true,
				minlength: 5,
				equalTo: "#password",
				nowhitespace: true
			},
			email: {
				required: true,
				email: true
			},
			firstName: {
				required: true,
				minlength: 1,
				lettersonly: true
			},
			lastName: {
				required: true,
				minlength: 1,
				lettersonly: true
			}
		}
	});
})