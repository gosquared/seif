require 'sequel'

require_relative 'config'

Sequel::Model.db = Seif::Models::Config::DB Sequel.connect(options)
Sequel::Model.db.logger= Logger.new($stdout) if ENV['LOGGER']

DB = Sequel.connect('sqlite://blog.db')

