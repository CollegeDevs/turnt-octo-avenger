require 'google/api_client'
CLIENT_ID = ''
CLIENT_SECRET = ''
OAUTH_SCOPE = ''
REDIRECT_URI = ''

class DrivesController < ApplicationController

  def auth
    client = Google::APIClient.new(:application_name => '',
                                    :application_version => '1.0.0')
    drive = client.discovered_api('drive', 'v2')
    client.authorization.client_id
    client.authorization.client_id = CLIENT_ID
    client.authorization.client_secret = CLIENT_SECRET
    client.authorization.scope = OAUTH_SCOPE
    client.authorization.redirect_uri = REDIRECT_URI
    @uri = client.authorization.authorization_uri
    redirect_to @uri
  end

end
