Template.dashboard.helpers
	last_matches: ->
		return Matches.find { 'teams.players': Meteor.userId() }, { limit: 5, sort: { createdAt: -1 } }
