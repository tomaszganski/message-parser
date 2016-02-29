describe 'Order messages' do
  let(:request) {
    {message: message, issueDateTime: issue_date_time}.to_json
  }

  let(:message) do
    '
  Order was made. Your package will be deliver within 48 hours
  '
  end

  context 'when package will be deliver in 48 hours' do
    let(:issue_date_time) { Time.iso8601 '2015-11-10T07:00:00.000Z' }

    it 'should add 48 hours' do
      post '/calculation', request, {CONTENT_TYPE: 'application/json'}

      expect(last_response).to has_date issue_date_time + 48.hours
    end
  end
end

