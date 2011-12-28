require './app'
require 'resque/tasks'

#set QUEUE env var, e.g. $ QUEUE=critical,high rake resque:work
task "resque:setup" do
      ENV['QUEUE'] = '*'
end

