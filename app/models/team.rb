class Team < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :projects
    has_many :invitations
    
    validates :name, presence: true
end
