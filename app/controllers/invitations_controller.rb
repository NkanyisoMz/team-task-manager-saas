class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:new, :create]
  before_action :require_admin!, only: [:new, :create]

  def index
    @invitations = Invitation.where(email: current_user.email)
  end

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

  def accept
  invitation = Invitation.find(params[:id])

  Membership.create!(
    user: current_user,
    team: invitation.team,
    role: invitation.role
  )

  invitation.destroy

  redirect_to teams_path, notice: "You joined the team successfully."
end

  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def invitation_params
    params.require(:invitation).permit(:email, :role)
  end
end