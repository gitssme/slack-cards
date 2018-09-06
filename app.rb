require 'sinatra'
require_relative 'app/slack_authorizer'

use SlackAuthorizer

HELP_RESPONSE = 'Use `\cards` to display a random card, have fun!'.freeze

get '/card/images/' do
end

post '/slack/command' do
  case params['text'].to_s.strip
  when 'help', '' then HELP_RESPONSE
  else 'OK'
  end
end
