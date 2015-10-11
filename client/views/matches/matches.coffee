Template.matches.helpers
	matches: ->
		return Matches.find({ "teams.players": Meteor.userId() })
