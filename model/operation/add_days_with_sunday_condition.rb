class AddDaysWithSundayCondition
  def calculate(issue_date_time, params)
    date = issue_date_time + params.fetch(:days).days
    if issue_date_time.sunday?
      date + params.fetch(:extra_sunday_days).days
    else
      date
    end
  end
end