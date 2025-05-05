module ApplicationHelper
  def current_academic_year_range
    "#{Time.current.year}-#{(Time.current + 1.year).year.to_s.last(2)}"
  end
end
