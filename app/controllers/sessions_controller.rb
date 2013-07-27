class SessionsController < ApplicationController
  def index
    render :json => current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    session[:oauth_token] = auth.credentials.token
    session[:oauth_token_secret] = auth.credentials.secret
    
    user = User.save_by_twitter_auth!(auth)
    session[:uid] = user._id
    redirect_to root_url
  end

  def destroy
    session[:oauth_token] = nil
    session[:oauth_token_secret] = nil
    session[:uid] = nil
    redirect_to root_url
  end
  
end
