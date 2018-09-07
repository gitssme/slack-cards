require 'sinatra'
require_relative 'app/slack_authorizer'

use SlackAuthorizer

set :public_folder, 'images'

HELP_RESPONSE = 'Use `/cards` to display a random card, have fun!'.freeze


get '/card/images/' do
  send_file File.join(settings.public_folder, 'nicubunu-Ornamental-deck-6-of-hearts.svg')
end

post '/slack/command' do
  logger.info "command params: #{params.inspect}"
  case params['text'].to_s.strip
  when 'help' then HELP_RESPONSE 
  else 'OK'
  end
end
