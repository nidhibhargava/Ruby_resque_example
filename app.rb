require 'rubygems'
require 'sinatra'
require 'resque'


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
  Resque.enqueue(Eat, params['food'])
  "Put #{params['food']} in fridge to eat later."
end
