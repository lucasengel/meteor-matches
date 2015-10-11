Template.signin.events
	'click button.facebook-login': ->
		Meteor.loginWithFacebook()

	'click button.meteor-login': ->
		Meteor.loginWithMeteorDeveloperAccount()

	'click button.github-login': ->
		Meteor.loginWithGithub()


Template.signin.onRendered ->
	$('.ui.form').form
		fields:
			email:
				identifier: 'email'
				rules: [
					type: 'empty'
					prompt: 'Please enter your e-mail'
				,
					type: 'email'
					prompt: 'Please enter a valid e-mail'
				]
			password:
				identifier: 'password'
				rules: [
					type: 'empty'
					prompt: 'Please enter your password'
				,
					type: 'minLength[6]'
					prompt: 'Your password must be at least 6 characters'
				]
