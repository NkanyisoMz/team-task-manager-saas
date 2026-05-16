class ApplicationController < ActionController::Base

    include Pagy::Backend
    before_action :authenticate_user!

    def current_team
        @current_team ||= current_user.teams.find(params[:team_id]) if params[:team_id]
    end

    def require_admin!
        membership = current_user.memberships.find_by(team: @team)
        
        unless membership&.admin?
            redirect_to teams_path, alert: "You are not authorized to perform this action."
        end
    end
end
