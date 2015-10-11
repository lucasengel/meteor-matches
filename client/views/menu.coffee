Template.menu.helpers
	active: (route) ->
		return 'active' if FlowRouter.getRouteName() is route

Template.menu.events
	'click .logout': ->
		Meteor.logout()
		FlowRouter.go '/'
