require_relative 'sequel_model'

require_relative 'customer'
require_relative 'subscription'

class Services < Sequel::Model
  many_to_one :customer
  many_to_one :subscription
end
