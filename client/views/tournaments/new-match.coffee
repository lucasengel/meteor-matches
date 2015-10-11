Template.tourneyNewMatch.helpers
	users: ->
		return Meteor.users.find()

	userClassTeam1: ->
		classes = [ 'match-user' ]

		playersTeam1 = Template.instance().selectedPlayersTeam1.get()
		playersTeam2 = Template.instance().selectedPlayersTeam2.get()

		if playersTeam1[this._id]?
			classes.push 'selected'

		if playersTeam2[this._id]?
			classes.push 'disabled'

		return classes.join ' '

	userClassTeam2: ->
		classes = [ 'match-user' ]

		playersTeam1 = Template.instance().selectedPlayersTeam1.get()
		playersTeam2 = Template.instance().selectedPlayersTeam2.get()

		if playersTeam1[this._id]?
			classes.push 'disabled'

		if playersTeam2[this._id]?
			classes.push 'selected'

		return classes.join ' '

	showError: ->
		return if Template.instance().errors.get().length is 0 then 'hidden'

	errors: ->
		console.log Template.instance().errors.get()
		return Template.instance().errors.get()

Template.tourneyNewMatch.events
	'click .team-1 .match-user:not(.disabled)': (e, template) ->
		$(e.currentTarget).toggleClass 'selected'

		players = template.selectedPlayersTeam1.get()

		if players[this.userId]?
			delete players[this.userId]
		else
			players[this.userId] = 1

		template.selectedPlayersTeam1.set players

	'click .team-2 .match-user:not(.disabled)': (e, template) ->
		$(e.currentTarget).toggleClass 'selected'

		players = template.selectedPlayersTeam2.get()

		if players[this.userId]?
			delete players[this.userId]
		else
			players[this.userId] = 1

		template.selectedPlayersTeam2.set players

	'click .save-match': (e, template) ->
		errors = []

		team1Players = Object.keys template.selectedPlayersTeam1.get()
		team2Players = Object.keys template.selectedPlayersTeam2.get()

		if team1Players.length is 0
			errors.push 'Choose at least one player for team 1'

		if team2Players.length is 0
			errors.push 'Choose at least one player for team 2'

		if $('.score-team-1').val().trim() is ''
			errors.push 'Insert a score for team 1'

		if $('.score-team-2').val().trim() is ''
			errors.push 'Insert a score for team 2'

		template.errors.set errors

		if errors.length > 0
			return

		matchData =
			tournamentId: FlowRouter.getParam('_id')
			team1:
				players: team1Players
				score: $('.score-team-1').val()
			team2:
				players: team2Players
				score: $('.score-team-2').val()

		Meteor.call 'saveMatch', matchData, (error, result) ->
			if error?
				return console.log error

			FlowRouter.go 'tourney', { _id: FlowRouter.getParam('_id') }

	'click .cancel-match': ->
		FlowRouter.go 'tourney', { _id: FlowRouter.getParam('_id') }

Template.tourneyNewMatch.onCreated ->
	@selectedPlayersTeam1 = new ReactiveVar {}
	@selectedPlayersTeam2 = new ReactiveVar {}

	@errors = new ReactiveVar []

Template.tourneyNewMatch.onRendered ->
	$('.ui.form').form
		fields:
			scoreTeam1:
				identifier: 'scoreTeam1'
				rules: [
					type: 'empty'
					prompt: 'Please enter a score for team 1'
				]
			scoreTeam1:
				identifier: 'scoreTeam1'
				rules: [
					type: 'empty'
					prompt: 'Please enter a score for team 2'
				]
