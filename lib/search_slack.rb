require_relative 'client_slack'

# Module for searching content on Slack
module SearchOnSlack
  include ClientSlack

  def get_user_id(channel = @channel_id)
    client = configure_client
    dm = client.conversations_open users: channel
    dm.channel.id
  rescue Slack::Web::Api::Errors::SlackError => e
    print e.message
    false
  end

  def get_user_info(user)
    client = configure_client
    c = client.users_info user: user
    c.user
  rescue Slack::Web::Api::Errors::SlackError => e
    print e.message
    false
  end

  def get_user_list
    client = configure_client
    client.users_list
  rescue Slack::Web::Api::Errors::SlackError => e
    print e.message
    false
  end

  def verify_type
    properties = {
      'channel' => @properties.is_channel,
      'group' => @properties.is_group,
      'im' => @properties.is_im
    }
    check = ''
    properties.each { |k, v| check = k if v == true }
    check
  end

  def conversation_type(channel = @channel_id)
    @channel_id = channel if @channel_id.nil?
    result = conversation_info
    if result == false
      print 'Check if IM'
      @channel_id = get_user_id
      conversation_info == false ? false : verify_type
    else
      verify_type
    end
  rescue Slack::Web::Api::Errors::SlackError => e
    print e.message
    false
  end

  def conversation_info(channel = @channel_id)
    client = configure_client
    info = client.conversations_info channel: channel
    @properties = info.channel
  rescue Slack::Web::Api::Errors::SlackError => e
    print e.message
    false
  end

  def conversation_list
    client = configure_client
    client.conversations_list.channels
  rescue Slack::Web::Api::Errors::SlackError => e
    print e.message
    false
  end

  def search_messages_on(channel, quantity = 5)
    # type = conversation_type(channel)
    client = configure_client
    client.conversations_history channel: channel, count: quantity
  rescue Slack::Web::Api::Errors::SlackError => e
    print e.message
    "Channel not found #{channel}"
    end
end
