ActionParam.delete_all
Action.delete_all

Actions.define do
  message '
    Order was made. Your package will be deliver within 48 hours
    '

  operation AddHoursToIssueDateTime
  params do
    ordinal 0, :hours
  end
end

Actions.define do
  message '
    Thank you for shopping with us. Your order id is 397849539
    Expect to get your delivery in 3 days if you not order on Sunday. Otherwise
    it can take additional 2 days
    '

  operation AddDaysWithSundayCondition
  params do
    ordinal 1, :days
    ordinal 2, :extra_sunday_days
  end
end
