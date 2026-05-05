class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team
  before_action :set_project
  before_action :set_task

  def index
    @comments = @task.comments.includes(:user)
    @comment  = @task.comments.new
  end

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to team_project_task_comments_path(@team, @project, @task),
                  notice: "Comment added"
    else
      @comments = @task.comments.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_project
    @project = @team.projects.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end