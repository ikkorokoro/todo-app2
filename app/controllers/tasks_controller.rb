class TasksController < ApplicationController
before_action :authenticate_user!

def index
  @tasks = Task.all
end

def new
  @task = current_user.tasks.build
end

def show
  @task = current_user.tasks.find(params[:id])
end

def edit
  @task = current_user.tasks.find(params[:id])
end

def update
  @task = current_user.tasks.find(params[:id])
  if @task.update(params_task)
    redirect_to tasks_path, notice: '更新できました'
  else
    flash.now[:error] = '更新できませんでした'
    render :edit
  end
end

def create 
  @task = current_user.tasks.build(params_task)
  if @task.save
    redirect_to tasks_path, notice: '保存できました'
  else
    flash.now[:error] = '保存できませんでした'
    render :new
  end
end

private
def params_task
  params.require(:task).permit(:title, :description)
end
end