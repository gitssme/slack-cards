require './app'
require 'rack'
require 'pry-remote'
require 'logger'

log_file = ::File.open('log/sinatra.log', 'a+')
log_file.sync=true
logger = Logger.new(log_file)
logger.level = Logger::DEBUG
set :logger, logger

Sinatra::Application.use Rack::CommonLogger, logger

run Sinatra::Application
