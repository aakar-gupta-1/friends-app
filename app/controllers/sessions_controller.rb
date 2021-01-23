class SessionsController < ApplicationController
  def googleAuth
    # Get access tokens from the google server
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)
    log_in(user)
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to root_path
  end
end
