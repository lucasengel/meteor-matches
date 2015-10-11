Meteor.methods
	createTourney: (tourney) ->
		return Tournaments.insert
			name: tourney.name
			matches: 0
			draws: 0
			createdAt: new Date()
			createdBy: this.userId
