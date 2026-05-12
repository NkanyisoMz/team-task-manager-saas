class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
    @assigned_tasks = current_user.assigned_tasks
    
    @pending_invitations = Invitation.where(
      email: current_user.email
      )
      @teams = current_user.teams
  end
end
