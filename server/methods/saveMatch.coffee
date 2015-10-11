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

		teams = [hashTeam1, hashTeam2]

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
					approved: false
				}
				{
					hash: hashTeam2
					players: matchData.team2.players
					score: matchData.team2.score
					points: pointsTeam2
					decision: decisionTeam2
					approved: false
				}
			], 'hash')
