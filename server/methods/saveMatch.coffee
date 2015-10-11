Meteor.methods
	saveMatch: (matchData) ->
		# @TODO validate data
		matchData.team1.score = parseInt matchData.team1.score
		matchData.team2.score = parseInt matchData.team2.score

		if matchData.team1.score > matchData.team2.score
			decisionTeam1 = 1
			decisionTeam2 = -1
			pointsTeam1 = 1
			pointsTeam2 = 0
		else if matchData.team1.score is matchData.team2.score
			decisionTeam1 = 0
			decisionTeam2 = 0
			pointsTeam1 = 0
			pointsTeam2 = 0
		else
			decisionTeam1 = -1
			decisionTeam2 = 1
			pointsTeam1 = 0
			pointsTeam2 = 1

		hashTeam1 = CryptoJS.MD5(matchData.team1.players.sort().join('|')).toString()
		hashTeam2 = CryptoJS.MD5(matchData.team2.players.sort().join('|')).toString()

		Matches.insert
			createdAt: new Date()
			createdBy: this.userId
			hash: CryptoJS.MD5([hashTeam1, hashTeam2].sort().join('|')).toString()
			tournamentId: matchData.tournamentId
			approved: 0
			teams: _.sortBy([
				{
					hash: hashTeam1
					players: matchData.team1.players
					score: matchData.team1.score
					points: pointsTeam1
					decision: decisionTeam1
					# TODO: Change to false
					approved: true
				}
				{
					hash: hashTeam2
					players: matchData.team2.players
					score: matchData.team2.score
					points: pointsTeam2
					decision: decisionTeam2
					# TODO: Change to false
					approved: true
				}
			], 'hash')

		winners = undefined
		losers = undefined
		players = [].concat(matchData.team1.players).concat(matchData.team2.players)

		if decisionTeam1 is 1
			winners = matchData.team1.players
			losers = matchData.team2.players
		else if decisionTeam2 is 1
			winners = matchData.team2.players
			losers = matchData.team1.players

		for player in players
			update =
				$inc:
					matches: 1
					wins: 0
					draws: 0
					loses: 0
					rating: 0

			if winners.indexOf(player) > -1
				update.$inc.wins = 1
				# TODO: Remove
				update.$inc.rating = 10
			else if losers.indexOf(player) > -1
				update.$inc.loses = 1
				# TODO: Remove
				update.$inc.rating = -10
			else
				update.$inc.draws = 1

			# TODO: Calc rating

			TournamentRanks.upsert
				tournamentId: matchData.tournamentId
				userId: player
			, update

			Meteor.users.update player, update

			delete update.$inc.rating
			delete update.$inc.wins
			delete update.$inc.loses
			Tournaments.update matchData.tournamentId, update
