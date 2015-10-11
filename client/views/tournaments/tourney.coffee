Template.tourney.events
	'click .fab.button': ->



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
