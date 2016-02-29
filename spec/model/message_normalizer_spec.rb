require_relative('../spec_helper.rb')

describe 'MessageNormalizer' do

  subject(:normalizer) { MessageNormalizer.new }

  describe '.normalize' do
    it 'should replace all numeric values with placeholder' do
      normalized_message = normalizer.normalize('Make call after 3 days and 5 hours')

      expect(normalized_message.message).to eql('Make call after {number} days and {number} hours')
      expect(normalized_message.params).to eql([3,5])
    end

    it 'should replace all whitespaces with single space and strip result' do
      normalized_message = normalizer.normalize('   Make   call
      after 3   days
      and 5 hours')

      expect(normalized_message.message).to eql('Make call after {number} days and {number} hours')
      expect(normalized_message.params).to eql([3,5])
    end
  end
end