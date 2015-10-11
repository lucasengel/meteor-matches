
niceDate = (date) ->
	parsed = moment(date)
	return parsed.format('L')


getUserNameById = (userId) ->
	user = Meteor.users.findOne(userId)
	if not user?
		return

	return user.name or user.profile?.name

add1 = (val) ->
	return val + 1


Template.registerHelper 'add1', add1
Template.registerHelper 'niceDate', niceDate
Template.registerHelper 'getUserNameById', getUserNameById
