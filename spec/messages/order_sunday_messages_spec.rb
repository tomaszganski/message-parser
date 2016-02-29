describe 'Order messages' do
  let(:request) {
    {message: message, issueDateTime: issue_date_time}.to_json
  }

  let(:message) do
    '
   Thank you for shopping with us. Your order id is 397849539
   Expect to get your delivery in 3 days if you not order on Sunday. Otherwise
   it can take additional 2 days
  '
  end

  context 'when order was made in regular days' do
    let(:issue_date_time) { Time.iso8601 '2015-11-10T07:00:00.000Z' }

    it 'should add 48 hours' do
      post '/calculation', request, {CONTENT_TYPE: 'application/json'}

      expect(last_response).to has_date issue_date_time + 3.days
    end
  end

  context 'when order was made on Sunday' do
    let(:issue_date_time) { Time.iso8601 '2015-11-15T07:00:00.000Z' }


    it 'should add 7 days' do
      post '/calculation', request, {CONTENT_TYPE: 'application/json'}

      expect(last_response).to has_date issue_date_time + 5.days
    end
  end
end

