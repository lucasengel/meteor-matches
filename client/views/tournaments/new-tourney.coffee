Template.tourneyNew.events
	'submit .form': (e, template) ->
		e.preventDefault()

		Meteor.call 'createTourney', { name: template.$('input[name=name]').val() }, (error, result) ->
			if error?
				return console.log error

			FlowRouter.go 'tourney', { _id: result }

	'click .cancel': ->
		FlowRouter.go 'tourney_list'
