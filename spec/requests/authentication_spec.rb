require "rails_helper"

RSpec.describe "Authentication", type: :request do

  let(:team) { create(:team) }

  it "redirects guests from teams page" do

    get team_projects_path(team)

    expect(response).to redirect_to(
      new_user_session_path
    )
  end

end