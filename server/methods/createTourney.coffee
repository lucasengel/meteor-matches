Meteor.methods
	createTourney: (tourney) ->
		return Tournaments.insert
			name: tourney.name
			createdAt: new Date()
			createdBy: this.userId
