class SessionsController < ApplicationController
  skip_before_filter :require_login

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)

    session[:user_id] = @user.id
    session[:token] = auth_hash.credentials.token
    session[:secret] = auth_hash.credentials.secret

    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:token] = nil
    session[:secret] = nil

    redirect_to root_url, :notice => "Signed out!"
  end

  protected

  def auth_hash
    puts request.env['omniauth.auth'].to_yaml

    request.env['omniauth.auth']
  end
end
