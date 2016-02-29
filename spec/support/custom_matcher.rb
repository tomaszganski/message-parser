RSpec::Matchers.define :has_date do |expected|
  match do |actual|
    expect(actual).to be_ok
    expect(actual.body).not_to be('')

    response = JSON.parse(actual.body)
    expect(response['date']).to be_iso8601 expected
  end

  failure_message do |actual|
    "expected that response #{actual.body} to has date equal #{expected}"
  end
end

RSpec::Matchers.define :be_iso8601 do |expected|
  match { |actual| actual == expected.iso8601 }
end
