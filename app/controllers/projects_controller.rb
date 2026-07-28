class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team
  before_action :require_admin!, only: [:new, :create, :destroy]
  before_action :set_project, only: [:show, :destroy]

  def index
    @projects = @team.projects

    if params[:query].present?
      @projects = @projects.where(
      "name ILIKE ? OR description ILIKE ?",
      "%#{params[:query]}%",
      "%#{params[:query]}%"
      )
    end
  end

  def new
    @project = @team.projects.new
  end

  def create
    @project = @team.projects.new(project_params)

    if @project.save
      redirect_to team_projects_path(@team), notice: "Project created"
    else
      render :new, status: :unprocessable_content
    end
  end

  def show

  end

  def destroy
    @project.destroy

    flash.now[:notice] = "Project deleted successfully."

    respond_to do |format|
      format.html do
        redirect_to team_projects_path(@team),
                    notice: "Project deleted successfully."
      end

      format.turbo_stream
    end
  end

  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = @team.projects.find(params[:id])
  end
end
