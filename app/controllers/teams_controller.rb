class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = current_user.teams
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

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
