class TasksController < ApplicationController
  before_action :fetch_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end
  
  def new
    @task = Task.new
  end
  
  def edit; end

  def create
    @task = Task.new(task_params)

    return redirect_to task_path(@task) if @task.save

    render :new
  end
  
  def update
    return redirect_to task_path if @task.update(task_params)
    return redirect_to task_path(@task), notice: 'Atualizado' if @task.update(task_params)

    render :edit
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Apagado' if @task.destroy
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def fetch_task
    @task = Task.find(params[:id])
  end
  
end
