# Message parser

**Message parsers** it is microservice for parse messages and calculated reusult date based on predefined rules.

## Usage

Send **POST** request with **message** and **issueDateTime** to calculate result date.

#### Example

    Post http://{url}/calculation
    {
        "message":"Order was made. Your package will be deliver within 48 hours",
        "issueDateTime":"2016-03-10T07:00:00.000Z"
    }
##### Result

    {
        "date": "2016-03-12T07:00:00.000Z"
    }

## Configuration

Actions to take are defined in **seeds.rb**.
To define your own actions you should use delivered [DSL](https://en.wikipedia.org/wiki/Domain-specific_language).
##### Action rules:
* message are striped (multi white spaces are countes as one).
* all numeric values in message are parsed and can be send to **operation** by defining **params**.
* **prams** ordinal start from **0**.
* you can define many **params**.

#### Action template
```
Actions.define do
  message '
    <your_message>
    '

  operation <opperation_class>
  params do
    ordinal <parameter_ordinal>, <parameter_name>
  end
end
```

#### Operation template
```
class OperationName
  def calculate(issue_date_time, params)
    issue_date_time + params.fetch(:parameter_name).hours
  end
end
```

#### Predefined action for previous example
```
Actions.define do
  message '
    Order was made. Your package will be deliver within 48 hours
    '

  operation AddHoursToIssueDateTime
  params do
    ordinal 0, :hours
  end
```

## Instalation

You need to have installed [bundler](http://bundler.io/).

Install gems.

    bundle install

Run database migration.

    rake db:migrate

Fill databse with predefined rules.

    rake db:seed    

Run **thin** server.

    bundle exec thin start



## Tech
**Message parser** it is written in **Ruby** with **[sinatra](http://www.sinatrarb.com/)** help.
