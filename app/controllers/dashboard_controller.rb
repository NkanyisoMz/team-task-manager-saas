class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
    @assigned_tasks = current_user
      .assigned_tasks
      .includes(project: :team)
      .order(Arel.sql("due_date IS NULL, due_date ASC"))
      .limit(5)

    @pending_invitations = Invitation
      .includes(:team)
      .where(email: current_user.email)

    @teams = current_user
      .teams
      .includes(:projects)
  end
end
