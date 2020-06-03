class UsersController < ApplicationController

    #renders the login form 
    get '/login' do 
        erb :login 
    end 

    ##processes login form, thus logging user in 
    post '/login' do 
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "users/#{@user.id}"
      else
       # flash[:message] = "Incorrect password."
        redirect "/"
      end
    end
    
    #renders the signup form 
    get '/signup' do 
        erb :signup 
    end 

    #processes signup form, thus creating a new user aka signing up
    #redirect to new users show page  
    post '/users' do
        if params[:username] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
        else 
            #flash[:message] = "Please complete all fields."
            redirect "/signup"
        end             
    end 
    
    #logs the user out by clearing the session hash 
    get '/logout' do 
        session.clear
        redirect '/'
    end 

    #user show page 
    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :"/users/show"
    end 




end