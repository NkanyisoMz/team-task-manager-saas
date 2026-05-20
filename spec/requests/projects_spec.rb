require "rails_helper"

RSpec.describe "Projects", type: :request do

  let(:user) { create(:user) }
  let(:team) { create(:team) }

  before do
    create(
      :membership,
      user: user,
      team: team,
      role: :member
    )

    sign_in user
  end

  it "prevents non-admins from creating projects" do

    post team_projects_path(team), params: {
      project: {
        name: "Secret Project",
        description: "Hidden"
      }
    }
    
    expect(response).to redirect_to(teams_path)
  end

end