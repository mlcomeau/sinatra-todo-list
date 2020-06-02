class TasksController < ApplicationController 

    #renders form to create a new task 
    get '/tasks/new' do 
        erb :'/tasks/new'
    end
    
    #confirms a user is logged in 
    #processes new task form, creates a new task that is associated with the current user 
    #if user does not fill out a task name they are redirected back to the new task form and task is not created 
    post '/tasks' do 
        if !logged_in? 
            redirect '/'
        end 

        if params[:name] != ""
            @task = Task.create(name: params[:name], user_id: current_user.id)
            redirect "tasks/#{@task.id}"
        else 
            redirect '/tasks/new'
        end 
    end 

    #view a single task 
    get '/tasks/:id' do 
        @task = Task.find(params[:id])
        erb :'tasks/show'
    end 

    get '/tasks/:id/edit' do 
        erb :'tasks/edit'
    end
    
    post '/tasks/:id/edit' do 
end 