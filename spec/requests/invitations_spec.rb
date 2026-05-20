require "rails_helper"

RSpec.describe "Invitations", type: :request do

  let(:user) { create(:user) }
  let(:team) { create(:team) }

  before do
    create(
      :membership,
      user: user,
      team: team,
      role: :admin
    )

    sign_in user

    ActiveJob::Base.queue_adapter = :test
  end

  it "enqueues invitation email job" do

    expect {
      post team_invitations_path(team), params: {
        invitation: {
          email: "invite@example.com",
          role: "member"
        }
      }
    }.to have_enqueued_job(InvitationEmailJob)

  end

end