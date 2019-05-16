require 'slack-ruby-client'

# Client initialization that powers the rest of interactions
module Consciousness
  def configure_client(type = 'realtime', token = ENV['SLACK_API_TOKEN'])
    Slack.configure do |config|
      config.token = token
      config.raise 'Missing Bot token' unless config.token
    end

    case type
    when 'realtime'
      Slack::RealTime::Client.new
    when 'web'
      Slack::Web::Client.new
    end
  end
end
