class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: :destroy
  before_action :require_admin!, only: :destroy

  def index
    @teams = current_user.teams.includes(:memberships)

    @memberships_by_team_id =
      current_user.memberships.index_by(&:team_id)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      # create membership as admin
      Membership.create!(
        user: current_user,
        team: @team,
        role: Membership.roles[:admin]
      )

      redirect_to teams_path, notice: "Team created successfully"
    else
      render :new, status: :unprocessable_content
    end
  end

  def destroy
    @team.destroy

    flash.now[:notice] = "Team deleted successfully."

    respond_to do |format|
      format.html do
        redirect_to teams_path,
                    notice: "Team deleted successfully."
      end

      format.turbo_stream
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

  def set_team
    @team = current_user.teams.find(params[:id])
  end
end
