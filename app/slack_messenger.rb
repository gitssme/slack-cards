require_relative 'deal_cards'
require 'httpclient'

class SlackMessenger
  SLACK_API_ENDPOINT = 'https://slack.com/api/chat.postMessage'.freeze

  def self.deliver(to)
    new(to).deliver
  end

  def initialize(to)
    @to = to
  end

  def deliver
    client = HTTPClient.new default_header: {"Content-type" => "application/x-www-form-urlencoded,application/json; charset=UTF-8",
					     "Authorization" => "Bearer #{ENV['SLACK_OAUTH']}"}
    client.post(SLACK_API_ENDPOINT, params)
  end

  def params
    {
      channel: @to,
      text: "Here's a card",
      attachments: JSON.dump(attach)
    }
  end
  
  def attach
  url = DealCards.new.to_s
  [
        {
            "fallback": "Required plain-text summary of the attachment.",
            "color": "#36a64f",
            "pretext": "Choose this card",
            "author_name": "Cards app",
            "author_icon": "https://flic.kr/p/5a9YUH",
            "title": "Today's ??? mystery card",
            "image_url": "#{url.to_s}",
            "ts": "#{Time.new.to_i}"
        }
    ]
  end
end
