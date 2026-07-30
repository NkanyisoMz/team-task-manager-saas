module TasksHelper
  def task_due_date_text(task)
    return "No due date" if task.due_date.blank?

    due_date = task.due_date.to_date
    days_difference = (due_date - Date.current).to_i

    if task.completed?
      "Due #{due_date.strftime('%d %b %Y')}"
    elsif days_difference.negative?
      "Overdue by #{pluralize(days_difference.abs, 'day')}"
    elsif days_difference.zero?
      "Due today"
    elsif days_difference == 1
      "Due tomorrow"
    elsif days_difference <= 7
      "Due in #{pluralize(days_difference, 'day')}"
    else
      "Due #{due_date.strftime('%d %b %Y')}"
    end
  end

  def task_due_date_classes(task)
    if task.completed?
      "bg-green-100 text-green-700 border-green-300"
    elsif task.overdue?
      "bg-red-100 text-red-700 border-red-300"
    elsif task.due_today? || task.due_soon?
      "bg-yellow-100 text-yellow-700 border-yellow-300"
    else
      "bg-gray-100 text-gray-700 border-gray-300"
    end
  end
end
