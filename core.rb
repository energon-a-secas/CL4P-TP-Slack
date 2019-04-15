require 'slack-ruby-client'
require './sight'
require './persona'
require './voice'
require './actions/idle'
require './actions/sing'
require './actions/dance'

# Base
class CL4P
  include Persona
  include Speech
  def initialize

    configure_client

    @client.on :hello do
      normal("*Directive one:* Protect humanity!\n*Directive two:* Obey Lucio at all costs.\n*Directive three:* Dance!", '#bot_monitoring')
    end

    @client.on :message do |data|
      text = data.text
      channel = data.channel

      Directive.serve(text, channel)
    end

    @client.start!
  end
end

CL4P.new
