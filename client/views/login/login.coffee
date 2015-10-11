Template.login.onCreated ->
	@state = new ReactiveVar 'signin'


Template.login.helpers
	state: ->
		return Template.instance().state.get()


Template.login.events
	'click .signup': (e, t) ->
		t.state.set 'signup'

	'click .signin': (e, t) ->
		t.state.set 'signin'

	'submit form': (e, t) ->
		e.preventDefault()

		switch t.state.get()
			when 'signup'
				name = t.find('[name=name]').value
				email = t.find('[name=email]').value
				password = t.find('[name=password]').value

				Accounts.createUser
					profile:
						name: name
					email: email
					password: password
				, (error) ->
					if error?
						$('.ui.form').form('add errors', [error.reason])

			when 'signin'
				email = t.find('[name=email]').value
				password = t.find('[name=password]').value

				Meteor.loginWithPassword email, password,
					(error) ->
						if error?
							$('.ui.form').form('add errors', [error.reason])
