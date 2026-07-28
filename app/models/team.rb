class Team < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :users, through: :memberships
    has_many :projects, dependent: :destroy
    has_many :invitations, dependent: :destroy

    validates :name, presence: true
end
