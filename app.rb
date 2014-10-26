require 'httparty'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "jesse",
  :password => "",
  :database => "searchhn"
)

class Story < ActiveRecord::Base
end

Story.destroy_all

1.upto(8512885) do |i|
  res = HTTParty.get('https://hacker-news.firebaseio.com/v0/item/'+i.to_s+'.json')
  @story = Story.new
  @story.hn_id = res["id"]
  @story.url = res["url"]
  @story.title = res["title"]
  @story.text = res["text"]
  begin
    @story.save
  rescue
    puts 'error'
  end
end