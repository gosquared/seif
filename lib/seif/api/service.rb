require 'bundler'
Bundler.setup

require 'grape'

require_relative 'helpers'
require_relative '../models/customer'
require_relative '../models/service'
require_relative '../models/subscription'

module Seif
  module API
    class Service < Grape::API
      format :json
      default_format :json
      error_format :json

      helpers Helpers

      before { authorize! }

      resources :doc do
        # This should have been the default route, but grape requires a fix for this:
        # https://github.com/intridea/grape/issues/86
        desc 'The current page, showing details about all available routes'
        get do
          Service.routes.map { |route| route.instance_variable_get(:@options) }
        end
      end
    end
  end
end
