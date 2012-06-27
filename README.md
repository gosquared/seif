# Seif

Exposes info about web services and the customers that they belong to.

I wanted to keep track of all my clients and the websites which I host
for them, expose these details to Chef and hook it all up to my billing
system (FreeAgent).

Self-contained, leveraging SQLite for storage. Accessible via a RESTful
api.

## Installation

Add this line to your application's Gemfile:

    gem 'seif'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seif

## Contributing

Only pull requests with tests will be considered.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
