require 'linkedin'

class PagesController < ApplicationController

  def home

    client = LinkedIn::Client.new
    client.authorize_from_access(session[:token], session[:secret])

    if user_logged_in?
      @profile = client.profile

      puts "profile: " + @profile.to_yaml
    end

  end

  protected

  # Shouldn't this be global?
  def user_logged_in?
    user_logged_in = false

    if session[:user_id]
      user_logged_in = true
    end

    user_logged_in
  end
end
