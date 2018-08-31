require './app'
require 'rack'
require 'pry-remote'
logger = Logger.new('log/app.log')

use Rack::CommonLogger, logger

run Sinatra::Application
