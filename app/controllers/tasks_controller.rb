class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render :index
  end

  def show
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    render :edit
  end

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
    render :new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    render :edit
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.update(list_task_params)
      redirect_to task_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    @task.destroy
    redirect_to list_task_path
  end



  private
    def task_params
      params.require(:task).permit(:description)
    end
  end