
niceDate = (date) ->
	parsed = moment(date)
	return parsed.format('L')


getUserNameById = (userId) ->
	user = Meteor.users.findOne(userId)
	if not user?
		return

	return user.name or user.profile?.name

Template.registerHelper 'niceDate', niceDate
Template.registerHelper 'getUserNameById', getUserNameById
