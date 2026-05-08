class InvitationEmailJob < ApplicationJob
  queue_as :default

  def perform(invitation)
    InvitationMailer.invite_email(invitation).deliver_now
  end
end