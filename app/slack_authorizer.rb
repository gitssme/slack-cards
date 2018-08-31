require 'openssl'
require "base64"

class SlackAuthorizer
  UNAUTHORIZED_MESSAGE = 'Oops! Looks like the application is not authorized! Please review the token configuration.'.freeze
  UNAUTHORIZED_RESPONSE = ['200', {'Content-Type' => 'text'}, [UNAUTHORIZED_MESSAGE]]

  def initialize(app)
    @app = app
  end

  def validate_request?(req)
    request_body = req.body.read
    timestamp = req.params['X-Slack-Request-Timestamp']
    slack_signing_secret = ENV['MY_SLACK_SIGNING_SECRET']
    slack_signature = req.params['X-Slack-Signature']


    #if absolute_value(time.time() - timestamp) > 60 * 5:
    # Too old ignore request
    if (Time.now.to_i-timestamp) > 60*5
        return false
#    else
#        sig_basestring='v0:'<< timestamp << ':' << request_body
#        hash  = OpenSSL::HMAC.digest('sha256', slack_signing_secret, sig_basestring)
#        my_signature = 'v0=' << Base64.encode64(hash)
#	return true if my_signature == slack_signature
    end

    false
   end
	

  def call(env)
    req = Rack::Request.new(env)

    if validate_request? req
      @app.call(env)
    else
      UNAUTHORIZED_RESPONSE
    end
  end
end
