class Actions
  def self.define(&block)
    raise 'You need a block to define' unless block_given?
    Actions.new(&block)
  end

  private

  def initialize(&block)
    instance_eval &block

    create_action
  end

  def message(message)
    @message = MessageNormalizer.new.normalize(message).message
  end

  def operation(operation)
    @operation = operation
  end

  def params(&block)
    @params = ParamsScope.new(&block).params
  end

  def create_action
    unless @operation
      raise 'You need to define operation for action'
    end
    action = Action.create activation_message: @message, operation: @operation.to_s
    @params.each { |p| action.params.create ordinal: p[:ordinal], name: p[:name] }
  end

  class ParamsScope
    attr_reader :params

    def initialize(&block)
      @params =[]
      instance_eval &block
    end

    def ordinal(ordinal, name)
      params << {ordinal: ordinal, name: name}
    end
  end
end