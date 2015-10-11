Meteor.startup ->
	Meteor.defer ->
		# users
		if Meteor.users.find().count() == 0
			u1 = Meteor.users.insert
				name: 'Julio',
				wins: 1,
				loses: 10,
				draws: 0,
				matches: 11,
				rating: 100,
				email: 'julio.biason@gmail.com',
				password: 'test'
			u2 = Meteor.users.insert
				name: 'Gabriel',
				wins: 9,
				loses: 1,
				draws: 2
				matches: 12,
				rating: 200,
				email: 'gabrielfengel@gmail.com',
				password: 'test'
		else
			u1 = Meteor.users.find {name:'Julio'}
			u2 = Meteor.users.find {name:'Gabriel'}

		# Tournaments
		if Tournaments.find().count() == 0
			t1 = Tournaments.insert
				name: 'Snooker'
		else
			t1 = Tournaments.find {name: 'Snooker'}

		# tournament rankings
		if TournamentRanks.find().count() == 0
			TournamentRanks.insert
				tournamentId: t1._id,
				userId: u1._id,
				wins: 1,
				loses: 4,
				draws: 0,
				matches: 5
				rating: 50
			TournamentRanks.insert
				tournamentId: t1._id,
				userId: u2._id,
				wins: 5,
				loses: 0,
				draws: 1,
				rating: 100

		if Matches.find().count() == 0
			Matches.insert
				tournament: t1._id,
				approved: 2,
				teams: [
					{
						players: [u1._id],
						score: 0,
						points: 0,
						decision: -1,
						approved: true
					},
					{
						players: [u2._id],
						score: 4,
						points: 3,
						decision: 1,
						approved: true
					}
				]
