FlowRouter.route '/',
	action: (params) ->
		BlazeLayout.render "mainLayout", {main: "scores"}
