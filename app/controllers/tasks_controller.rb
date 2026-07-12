class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team
  before_action :set_project
  before_action :require_admin!, only: [:new, :create]
  before_action :set_task, only: [:show, :edit, :update]

  def index
  tasks = Task.where(project: @project)

  if params[:query].present?
    tasks = tasks.where(
      "title ILIKE ? OR description ILIKE ?",
      "%#{params[:query]}%",
      "%#{params[:query]}%"
    )
  end

  if params[:status].present?
    tasks = tasks.where(status: params[:status])
  end

  @pagy, @tasks = pagy(tasks)
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)

    if @task.save
      respond_to do |format|
        format.html do
          redirect_to team_project_tasks_path(@team, @project),
                    notice: "Task created"
        end

      format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit

end

def update


  if @task.update(task_params)
    redirect_to team_project_task_path(@team, @project, @task),
                notice: "Task updated"
  else
    render :edit, status: :unprocessable_entity
  end
end

  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_project
    @project = @team.projects.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, :assignee_id)
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end
end
