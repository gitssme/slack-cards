require 'sinatra'
require_relative 'app/slack_authorizer'

use SlackAuthorizer

post '/slack/command' do
   logger.info "loading data"
    "OK"
end
