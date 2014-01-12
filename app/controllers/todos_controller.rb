class TodosController < ApplicationController
  
  def index
    @todo_items = Todo.all
    @new_todo = Todo.new
   
  end

  def create
  @todo = current_user.todos.create(:todo_item => params[:todo][:todo_item])
     unless @todo.valid?
       flash[:error] = @todo.errors.full_messages.join("<br>").html_safe
     else
       flash[:success] = "Todo added successfully" 
     end
    redirect_to root_path
  end

  def show
    @user = User.find_by(params[:id])
    @todos = @user.todos
  end

 def destroy
    @todo.destroy
    redirect_to root_url
  end

  def edit
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       t.update_attribute(:completed, true)
     end
    redirect_to :action => 'show'
  end




end
