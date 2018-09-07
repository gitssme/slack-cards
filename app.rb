require 'sinatra'
require_relative 'app/slack_authorizer'

use SlackAuthorizer

HELP_RESPONSE = 'Use `\cards` to display a random card, have fun!'.freeze


get '/card/images/' do
logger.info "params: #{params.inspect}"
logger.info "params: #{params}"
end

post '/slack/command' do
  logger.info "command params: #{params.inspect}"
  case params['text'].to_s.strip
  when 'help', '' then params['text'].to_s.strip
  else 'OK'
  end
end
