Template.menu.helpers
	active: (route...) ->
		return 'active' if FlowRouter.getRouteName() in route

Template.menu.events
	'click .logout': ->
		Meteor.logout()
		FlowRouter.go '/'
