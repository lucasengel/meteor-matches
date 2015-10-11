Template.tourney.events
	'click .fab.button': ->
		FlowRouter.go 'tourney_match', _id: FlowRouter.getParam('_id')

Template.tourney.onRendered ->
	$('.tourney.menu .item').tab()

Template.tourney.helpers
	tournamentName: ->
		tournamentId = FlowRouter.getParam('_id')

		return Tournaments.findOne(tournamentId)?.name

	ranks: ->
		tournamentId = FlowRouter.getParam('_id')

		return TournamentRanks.find tournamentId: tournamentId

	getUserNameById: (userId) ->
		user = Meteor.users.findOne(userId)
		if not user?
			return

		return user.name or user.profile?.name

	matches: ->
		tournamentId = FlowRouter.getParam('_id')

		return Matches.find tournamentId: tournamentId

	groupedMatches: ->
		tournamentId = FlowRouter.getParam('_id')

		matches = Matches.find({tournamentId: tournamentId}, {sort: {hash: 1}}).fetch()

		groupedMatchesObj = {}

		for match in matches
			groupedMatchesObj[match.hash] ?=
				teamsByHash: {}
				teams: []

			for team in match.teams
				groupedMatchesObj[match.hash].teamsByHash[team.hash] ?=
					hash: team.hash
					players: team.players
					points: 0

				groupedMatchesObj[match.hash].teamsByHash[team.hash].points += team.points

		groupedMatches = []

		for key, match of groupedMatchesObj
			for hash, team of match.teamsByHash
				match.teams.push team

			delete match.teamsByHash
			groupedMatches.push match

		return groupedMatches
