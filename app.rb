require 'sinatra'
require_relative 'app/slack_authorizer'

use SlackAuthorizer

get '/card/images/' do
end

post '/slack/command' do
    {
    "text": "We should be concerned if the variable value for `radioactive` is `true`."
    }
end
