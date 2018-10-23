class SessionsController < ApplicationController
  skip_before_action :authenticate_user

# parsing and storing the token as a value
  def create
    client_id = ENV['GITHUB_CLIENT_ID']
    client_secret = ENV['GITHUB_CLIENT_SECRET']
    code = params['code']

    resp = Faraday.post 'https://github.com/login/oauth/access_token' do |req|
      req.body = { 'client_id': client_id, 'client_secret': client_secret, 'code': code }
      req.headers['Accept'] = 'application/json'
    end
<<<<<<< HEAD
 # parses the response body into a Ruby hash and stores this hash as the body variable
 # Whatever key value pairs were sent by GitHub will now be available, including body['access_token'].
=======

>>>>>>> 176705b85243c6e0daac0ca1d2d3e85d8cca2e56
    body = JSON.parse(resp.body)
    session[:token] = body['access_token']
    redirect_to root_path
  end
<<<<<<< HEAD

=======
  
>>>>>>> 176705b85243c6e0daac0ca1d2d3e85d8cca2e56
end
