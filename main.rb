# frozen_string_literal: true

require './mind/consciousness'
require './directives'
require './voice'

# Eternal loop
class Core
  include Consciousness
  include Voice

  def initialize
    log_channel = ENV['SLACK_LOG_CHANNEL']

    client = configure_client

    client.on :hello do
      normal_talk('*Client connected*', log_channel)
    end

    client.on :message do |data|
      # TODO: CRON DEL CRON ASYNC
      Directive.check(data)
    end

    client.on :closed do |_data|
      normal_talk('*Client disconnected*', log_channel)
    end

    client.start!
  end
end
