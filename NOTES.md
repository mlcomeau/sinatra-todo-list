6/3 7:11 pm -
    MVP complete. 
    IMPORTANT TO DO: COMPLETE README FILE 
    Ideas for next steps - 
     1. add a status attribute for tasks: would be 'in progress' or 'complete' 
        a complete task would not be the same as a deleted task, 
        completed tasks would not be deleted but rather put in a new list of 'complete' tasks seperate from 'in progress' tasks 
        this way the user would be able to look back on what tasks they had completed  
        could track number of tasks completed

        what steps?
        -tasks table in database would need to a 'status' column 
        add_column :tasks, :status, :string, default: "in progress"

        -Upon creation of a new task, status = 'in progress' 

        User experience?
        -The user would not be responsible for setting the status of a task upon , it is performed behind the scenes automatically 
        -The user is able to change the status from 'in progress' to 'complete', Done button next to the task on the to do list and in task show page 
        -users home page would have two lists, To Do List and Done list 
        -done list would display the task name but with strikethrough text 

        does this action (changing status to complete) require a new route? 
        post '/tasks/:id/complete'

