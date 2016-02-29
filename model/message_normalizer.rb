class MessageNormalizer
  def normalize(message)
    params = message.scan(/\d+/).map &:to_i
    normalize_message = message.gsub(/\d+/, '{number}').gsub(/\s+/, ' ').strip
    NormalizedMessage.new normalize_message, params
  end
end