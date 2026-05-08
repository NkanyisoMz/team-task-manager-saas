class InvitationMailer < ApplicationMailer
  default from: "no-reply@teamtaskmanager.com"

  def invite_email(invitation)
    @invitation = invitation

    mail(
      to: @invitation.email,
      subject: "You have been invited to join a team"
    )
  end
end