class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: "User", optional: true
  has_many :comments

  enum status: { todo: 0, in_progress: 1, completed: 2 }

  validates :title, presence: true
end
