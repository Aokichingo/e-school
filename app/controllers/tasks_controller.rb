class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at:'desc')
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice]="削除しました"
    redirect_to "/"
  end
   
  def create
   
    @task = Task.new(task_params)
    if @task.save
    flash[:notice]="投稿しました"
    redirect_to "/"
    else
    render 'new'
    end
  end
  
  def update
    @task = Task.new(task_params)
    if @task.save
    flash[:notice]="編集しました"
    redirect_to "/"
    else
    render 'edit'
    end
  end

  
  private
  def task_params
    params.require(:task).permit(:name,:description ,:post)
  end
end
