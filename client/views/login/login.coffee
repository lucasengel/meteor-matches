Template.login.events
	'click button.facebook-login': ->
		Meteor.loginWithFacebook()

	'click button.meteor-login': ->
		Meteor.loginWithMeteorDeveloperAccount()

	'click button.github-login': ->
		Meteor.loginWithGithub()

	'submit form': (e, t) ->
		email = t.find('[name=email]').value
		password = t.find('[name=password]').value

		Meteor.loginWithPassword {email: email}, password

		e.preventDefault()
