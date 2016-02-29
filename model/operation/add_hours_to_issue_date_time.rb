class AddHoursToIssueDateTime
  def calculate(issue_date_time, params)
    issue_date_time + params.fetch(:hours).hours
  end
end