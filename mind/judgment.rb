# Selection that should be improved
module Thought
  def discern_end(data)
    @thread = data.respond_to? :thread_ts ? data.ts : ''
    @channel = data.respond_to? :channel ? data.channel : data
  end
end

module Security
  def privileges_check(user)
    begin
      ENV['SLACK_BOT_ADMINS'].include? user
    rescue NoMethodError => e
      print "You probably didn't set the SLACK_BOT_ADMINS variable. Error: #{e.message}"
      return false
    end
  end
end
