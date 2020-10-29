class CommentsController < ApplicationController
before_action :authenticate_user!

def new
  @task = current_user.tasks.find(params[:task_id])
  @comment = @task.comments.build
end

def create
  @task = current_user.tasks.find(params[:task_id])
  @comment = @task.comments.build(params_comment)
  if @task.save
    redirect_to task_path(@task), notice: '保存できました'
  else
    flash.now[:error] = '保存できませんでした'
    render :new
  end  
end

private
def params_comment
  params.require(:comment).permit(:description).merge(user_id: current_user.id)
end
end