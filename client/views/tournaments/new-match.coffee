Template.tourneyNewMatch.helpers
	users: ->
		return Meteor.users.find()

Template.tourneyNewMatch.events
	'click .team-1 .match-user': (e, template) ->
		$(e.currentTarget).toggleClass 'selected'

		players = template.selectedPlayersTeam1.get()

		if players[this.userId]?
			delete players[this.userId]
		else
			players[this.userId] = 1

		template.selectedPlayersTeam1.set players

	'click .team-2 .match-user': (e, template) ->
		$(e.currentTarget).toggleClass 'selected'

		players = template.selectedPlayersTeam2.get()

		if players[this.userId]?
			delete players[this.userId]
		else
			players[this.userId] = 1

		template.selectedPlayersTeam2.set players

	'click .save-match': (e, template) ->
		matchData =
			tournamentId: FlowRouter.getParam('_id')
			team1:
				players: Object.keys template.selectedPlayersTeam1.get()
				score: $('.score-team-1').val()
			team2:
				players: Object.keys template.selectedPlayersTeam2.get()
				score: $('.score-team-2').val()

		console.log matchData

		Meteor.call 'saveMatch', matchData, (error, result) ->
			if error?
				console.log error

Template.tourneyNewMatch.onCreated ->
	@selectedPlayersTeam1 = new ReactiveVar {}
	@selectedPlayersTeam2 = new ReactiveVar {}
