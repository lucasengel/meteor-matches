Template.topPlayers.helpers
	topPlayers: ->
		return Meteor.users.find {}, { sort: { rating: -1 } }
