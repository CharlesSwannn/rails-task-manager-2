class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy complete uncomplete]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to task_path(task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.delete
    redirect_to tasks_path
  end

  def complete
    @task.completed = true
    @task.save
    redirect_to tasks_path
  end

  def uncomplete
    @task.completed = false
    @task.save
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
