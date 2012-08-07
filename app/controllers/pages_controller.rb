require 'linkedin'

class PagesController < ApplicationController
  skip_before_filter :require_login

  def home

    client = LinkedIn::Client.new
    client.authorize_from_access(session[:token], session[:secret])

    if logged_in?
      @profile = client.profile

      puts "profile: " + @profile.to_yaml
    end

  end
end
