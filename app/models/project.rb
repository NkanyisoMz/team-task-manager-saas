class Project < ApplicationRecord
  belongs_to :team
  has_many :tasks

  
  validates :name, presence: true
end
