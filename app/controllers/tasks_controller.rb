class TasksController < ApplicationController 

    #shows all tasks 
    get '/tasks' do 
        @tasks = Task.all
        erb :'/tasks/index'
    end 

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
            redirect "/tasks/#{ @task.id }"
        else 
            redirect '/tasks/new'
        end 
    end 

    #view a single task 
    get '/tasks/:id' do 
        set_task
        erb :'tasks/show'
    end 

    #makes sure the task belongs to the current user 
    #allows the owner of the task to render an edit form 
    get '/tasks/:id/edit' do
        set_task 
        if authorized?(@task) 
            erb :'tasks/edit'
        else 
            flash[:message] = "You are not authorized to edit that task. "
            redirect '/'
        end 
    end
    
    #processes edit form and takes user back to home page 
    patch '/tasks/:id' do 
        set_task
        if params[:name] != ""
            @task.update(name: params[:name])
            redirect '/'
        else 
            flash[:message] = "You need to enter a task."
            erb :'tasks/edit'
        end
    end 

    delete '/tasks/:id' do 
        set_task 
        if authorized?(@task)
            @task.destroy 
            redirect '/'
        else
            flash[:message] = "You are not authorized to edit that task."
            redirect '/' 
        end 
    end 




    private 

    def set_task
        @task = Task.find(params[:id])
    end 

end 