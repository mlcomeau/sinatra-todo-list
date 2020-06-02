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

  #root url aka homepage, 
  #if user is logged in goes to user show view 
  #if no user logged in goes to home view 
  get '/' do 
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
      erb :home 
    end 
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
