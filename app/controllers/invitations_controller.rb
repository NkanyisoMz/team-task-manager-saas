class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team
  before_action :require_admin!

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = @team.invitations.new(invitation_params)

    if @invitation.save
      redirect_to teams_path, notice: "Invitation created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def invitation_params
    params.require(:invitation).permit(:email, :role)
  end
end