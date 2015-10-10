FlowRouter.route '/',
	action: (params) ->
		# BlazeLayout.render "mainLayout", {main: "scores"}
		FlowRouter.go 'matches'


FlowRouter.route '/matches',
	name: 'matches'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "matches"}


FlowRouter.route '/tournaments',
	name: 'tournaments'
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "tournaments"}
