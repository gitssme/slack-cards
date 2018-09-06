require './app'
require 'rack'
require 'pry-remote'
require 'logger'

require 'logger'
Logger.class_eval { alias :write :'<<' }
logger = ::Logger.new(::File.new("log/app.log","a+")
 
configure do
	use Rack::CommonLogger, logger
end


run Sinatra::Application
