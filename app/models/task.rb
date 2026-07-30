class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: "User", optional: true
  has_many :comments, dependent: :destroy

  enum status: { todo: 0, in_progress: 1, completed: 2 }

  validates :title, presence: true

  def overdue?
    due_date.present? &&
      !completed? &&
      due_date.to_date < Date.current
  end

  def due_today?
    due_date.present? &&
      !completed? &&
      due_date.to_date == Date.current
  end

  def due_soon?
    return false if due_date.blank? || completed?

    date = due_date.to_date

    date > Date.current &&
      date <= 7.days.from_now.to_date
  end


  def status_classes
    case status
    when "todo"
      "bg-gray-100 text-gray-700 border-gray-300"
    when "in_progress"
      "bg-blue-100 text-blue-700 border-blue-300"
    when "completed"
      "bg-green-100 text-green-700 border-green-300"
    else
      "bg-gray-100 text-gray-700 border-gray-300"
    end
  end

end
