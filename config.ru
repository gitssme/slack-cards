require './app'
require 'rack'
require 'pry-remote'

enable :logging

run Sinatra::Application
