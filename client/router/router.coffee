BlazeLayout.setRoot('body')

FlowRouter.route '/',
	name: 'dashboard'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "dashboard"}

FlowRouter.route '/matches',
	name: 'matches'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "matches"}

FlowRouter.route '/tourney',
	name: 'tourney_list'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "tourney_list"}

FlowRouter.route '/tourney/new',
	name: 'new_tourney'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "tourneyNew"}

FlowRouter.route '/tourney/:_id',
	name: 'tourney'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "tourney"}

FlowRouter.route '/tourney/:_id/new-match',
	name: 'tourney_match'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "tourneyNewMatch"}

FlowRouter.route '/ranking',
	name: 'ranking'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "topPlayers"}
