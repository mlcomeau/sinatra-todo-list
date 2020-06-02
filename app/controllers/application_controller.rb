require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "tooty-fruity"
    use Rack::Flash 
  end

  get '/' do 
    #what if a user is already logged in? go to user homepage,
    #need if/else statement 
    erb :home 

  end 

  helpers do 
    #checks if there is a current user, thus verifying whether a user is logged in 
    def logged_in?
      !!current_user
    end

    #returns the current user or nil if there is no current user 
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
      end
    end

  end

end
