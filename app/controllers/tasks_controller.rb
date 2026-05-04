class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team
  before_action :set_project

  def index
    @tasks = @project.tasks
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)

    if @task.save
      redirect_to team_project_tasks_path(@team, @project), notice: "Task created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = @project.tasks.find(params[:id])
  end

  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_project
    @project = @team.projects.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end