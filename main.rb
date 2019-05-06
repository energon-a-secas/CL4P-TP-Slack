require './mind/conscious'
require './directives'
require './voice'

# Eternal loop
class Core
  include Conscious
  include Voice

  def initialize
    client = configure_client
    log_channel = ENV['SLACK_LOG_CHANNEL']

    client.on :hello do
      normal_talk('*Client connected*', log_channel)
    end

    client.on :message do |data|
      Directive.listen(data)
    end

    client.on :closed do |_data|
      normal_talk('*Client disconnected*', log_channel)
    end

    client.start!
  end
end
