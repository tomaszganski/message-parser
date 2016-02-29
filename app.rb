require_relative 'requires'

set :database_file, 'config/database.yml'

class App < Sinatra::Base

  get '/', :provides => 'html' do
    haml :index
  end

  post '/calculation' do
    data = JSON.parse(request.body.read)
    message = data['message']
    issue_date_time = Time.iso8601(data['issueDateTime'])
    response = {}
    normalized_message = MessageNormalizer.new.normalize(message)
    action = Action.find_by activation_message: normalized_message.message
    if action
      time = OperationInvoker.new.invoke normalized_message, action, issue_date_time
      response[:date] = time.utc.iso8601
    end

    content_type :json
    response.to_json
  end
end