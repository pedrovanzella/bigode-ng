BIGODE-NG

TODO:

Feed:
	url, title
	has many stories
	has many subscriptions
	has many users through subscriptions

FeedsController:
	create, destroy, edit(?), show(?)

Story:
	title, url, content
	belongs to feed

StoriesController
	create, destroy, show(?), edit(?)

Subscription
	belongs to user
	belongs to feed

SubscriptionsController
	new, create, destroy, show, index

User
	has many subscriptions
	has many feeds through subscriptions
