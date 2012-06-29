require_relative 'sequel_model'

require_relative 'service'

class Subscription < Sequel::Model
  one_to_many :services
end
