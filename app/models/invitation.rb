class Invitation < ApplicationRecord
  belongs_to :team

  enum role: { member: 0, admin: 1 }

  validates :email, presence: true
end
