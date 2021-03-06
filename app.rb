require 'sinatra'
require_relative 'app/slack_authorizer'
require_relative 'app/slack_messenger'

use SlackAuthorizer

set :public_folder, File.dirname(__FILE__) + '/images'

HELP_RESPONSE = 'Use `/cards` to display a random card, have fun!'.freeze

OK_RESPONSE = "Thanks for sending this!.".freeze

get '/images/*.*' do
  name, ext = params['splat']
  logger.info "Slack msg:  #{SlackMessenger.deliver(params['user_id'])}"
  send_file File.join(settings.public_folder, "#{name}.#{ ext}" )
end

post '/slack/command' do
  case params['text'].to_s.strip
  when 'help' then HELP_RESPONSE
  else res = SlackMessenger.deliver(params['user_id'])
  end
end
