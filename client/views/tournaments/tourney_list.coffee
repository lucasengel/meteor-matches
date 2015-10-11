Template.tourney_list.helpers
	tournaments: ->
		return Tournaments.find()

Template.tourney_list.events
	'click .fab.button': ->
		FlowRouter.go 'new_tourney'
