class ApplicationController < ActionController::Base

    before_action :authenticate_user!

    def current_team
        @current_team ||= current_user.teams.find(params[:team_id]) if params[:team_id]
    end
end
