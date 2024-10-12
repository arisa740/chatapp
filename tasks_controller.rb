class TasksController < ApplicationController
  def index
    @tasks = Task.where(status: :incomplete)
    @new_task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.status = :incomplete
    if @task.save
      redirect_to tasks_path, notice: "Task created!"
    else
      render :index
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(status: :complete)
    redirect_to tasks_path, notice: "Task marked as complete!"
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
