# birthdaybot

If you use [PeopleHR](http://peoplehr.com/) to store your employees’
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
3. Create an API key in PeopleHR that has access to read employee
   information
4. Create a cron job that runs the following command:

		PEOPLEHR_API_KEY="abc123" SLACK_WEBHOOK_URL="https://hooks.slack.com/services/T123/B123/abc123" path/to/birthdaybot

	…replacing the API key and the webhook URL with your correct values,
	and pointing to the place that the `birthdaybot` script resides.

	We run ours every weekday at 8:30am.
