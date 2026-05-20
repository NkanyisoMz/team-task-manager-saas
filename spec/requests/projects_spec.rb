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

  it "allows admins to create projects" do

  membership = Membership.find_by(
    user: user,
    team: team
  )

  membership.update!(role: :admin)

  expect {
    post team_projects_path(team), params: {
      project: {
        name: "Admin Project",
        description: "Created by admin"
      }
    }
  }.to change(Project, :count).by(1)

  expect(response).to redirect_to(
    team_projects_path(team)
  )
end

end