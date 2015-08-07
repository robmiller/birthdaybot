require "addressable/uri"
require "typhoeus"

class Slack
  def initialize(webhook_url:)
    @webhook_url = Addressable::URI.parse(webhook_url)
  end

  def send(message)
    body = request_body(message)
    request = Typhoeus::Request.new(
      @webhook_url,
      method: :post,
      body: body,
      headers: { "Content-Type" => "application/x-www-form-urlencoded" }
    )

    request.run
  end

  private

  def request_body(message)
    payload = '{"text": %s, "icon_emoji": ":birthday:"}' %
      message.inspect
    { payload: payload }
  end
end
