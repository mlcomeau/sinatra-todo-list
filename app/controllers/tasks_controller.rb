class TasksController < ApplicationController 

    #shows all tasks/index page  
    get '/tasks' do 
        @tasks = Task.all.sort_by { |obj| obj.name.downcase }
        erb :'/tasks/index'
    end 

    #renders form to create a new task 
    get '/tasks/new' do 
        redirect_if_not_logged_in
        erb :'/tasks/new'
    end
    
    #confirms a user is logged in 
    #processes new task form, creates a new task that is associated with the current user 
    #if user does not fill out a task name they are redirected back to the new task form and task is not created 
    post '/tasks' do 
        redirect_if_not_logged_in

        if params[:name] != ""
            @task = Task.create(name: params[:name], user_id: current_user.id, status: "in progress")
            flash[:message] = "Task creation successful!" if @task.id 
            redirect "/"
        else 
            flash[:message] = "You need to enter a task."
            redirect '/tasks/new'
        end 
    end 

    #view a single task 
    get '/tasks/:id' do 
        redirect_if_not_logged_in
        set_task
        erb :'tasks/show'
    end 

    #makes sure the task belongs to the current user 
    #allows the owner of the task to render an edit form 
    get '/tasks/:id/edit' do
        redirect_if_not_logged_in
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
            redirect "/tasks/#{@task.id}/edit"
        end
    end 

    #changes task status from in progress to done 
    patch '/tasks/:id/done' do 
        set_task 
        @task.update(status: "done")
        flash[:message] = "You finished a task! Nice work!"
        redirect '/'
    end 

    #deletes a task 
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