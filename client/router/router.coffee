BlazeLayout.setRoot('body')

FlowRouter.route '/',
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "dashboard"}


FlowRouter.route '/matches',
	name: 'matches'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "matches"}

FlowRouter.route '/tourney/:_id',
	name: 'tourney'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "tourney"}


FlowRouter.route '/tournaments',
	name: 'tournaments'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "tournaments"}
