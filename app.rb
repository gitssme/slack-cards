require 'sinatra'
require_relative 'app/slack_authorizer'

use SlackAuthorizer

get '/card/images/' do
end

post '/slack/command' do
   logger.info "loading data"
    "OK"
end
