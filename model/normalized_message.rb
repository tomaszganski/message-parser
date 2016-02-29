class NormalizedMessage
  attr_reader :message, :params

  def initialize(message, params)
    @message = message
    @params = params
  end
end