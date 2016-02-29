class OperationInvoker
  def invoke(normalized_message, action, issue_date_time)
    clazz = Object.const_get action.operation
    params = build_params normalized_message.params, action.params
    clazz.new.calculate issue_date_time, params
  end

  private
  def build_params(params, action_params)
    action_params.inject({}) { |h, p| h[p.name.to_sym] = params[p.ordinal]; h }
  end
end