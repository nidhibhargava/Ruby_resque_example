require 'rubygems'
require 'sinatra'
require 'resque'
#require 'system_timer'

Resque.redis = Redis.new(:host => 'localhost', :port => 9292, :thread_safe => true)

class Eat
  @queue = :food

  def self.perform(food)
    puts "Ate #{food}!"
  end
end

get '/' do
  "<a href='/eat/mango'>eat something</a>
   <a href='/resque'>resque</a>"
end

get '/eat/:food' do
  Resque.enqueue(Apple, params['food'])
  "Put #{params['food']} in fridge to eat later."
end
