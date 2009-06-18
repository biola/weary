require File.join(File.dirname(__FILE__), '..', 'lib', 'weary')

class Status
  extend Weary
  
  on_domain "http://twitter.com/statuses/"
  
  get "user_timeline" do |resource|
    resource.requires = [:id]
    resource.with = [:user_id, :screen_name, :since_id, :max_id, :count, :page]
  end
  
end

toots = Status.new
recent_toot = toots.user_timeline(:id => "markwunsch")[0]
puts "@" + recent_toot["user"]["screen_name"] + ": " + "\"#{recent_toot['text']}\""