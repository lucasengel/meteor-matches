Template.topPlayers.helpers
	topPlayers: ->
		return Meteor.users.find {}, { sort: { rating: -1 } }

	add1: (val) ->
		return val + 1
