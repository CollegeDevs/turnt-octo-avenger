require 'google/api_client'
CLIENT_ID = '514053255975-evhehn78vcb5fvkc5k5g5io80ejhb2ag.apps.googleusercontent.com'
CLIENT_SECRET = 'Tq-ox_9ZOvJV3mccX4EptL_2'
OAUTH_SCOPE = 'https://www.googleapis.com/auth/drive'
REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'

class DrivesController < ApplicationController

  def auth
    client = Google::APIClient.new(:application_name => 'CollegeDevs test',
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
