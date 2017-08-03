# birthdaybot

If you use [BreatheHR](http://breathehr.com/) to store your employees’
dates of births, and use [Slack](http://slack.com/) to chat, then
`birthdaybot` will announce upcoming birthdays in Slack for you each
morning.

## Requirements

Ruby >= 2.1

## Installation

1. Clone the repository
2. Create a webhook in Slack for `birthdaybot`. You can configure the
   name and appearance of the bot here, and change what channel he posts
   to.
3. Get your BreatheHR API Key
4. Create a cron job that runs the following command:

		BREATHE_API_KEY="abc123" SLACK_WEBHOOK_URL="https://hooks.slack.com/services/T123/B123/abc123" path/to/birthdaybot

	…replacing the API key and the webhook URL with your correct values,
	and pointing to the place that the `birthdaybot` script resides.

	We run ours once a week.
