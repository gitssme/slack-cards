require './app'
require 'rack'
require 'pry-remote'
require 'logger'

use Rack::Static,
  :root => "images"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'image/png',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('images/', File::RDONLY)
  ]
}

log_file = ::File.open('log/sinatra.log', 'a+')
log_file.sync=true
logger = Logger.new(log_file)
logger.level = Logger::DEBUG
set :logger, logger

Sinatra::Application.use Rack::CommonLogger, logger

run Sinatra::Application
