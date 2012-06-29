require_relative '../test_helper'

require 'api/service'

module Seif
  module API
    describe Service do
      include Rack::Test::Methods

      def app
        Service
      end

      def body
        Oj.load(last_response.body)
      end

      describe "GET /resources" do
        it "shows all available routes" do
          get("/resources")
          (%w[description method path params] - body.sample.keys).must_equal []
        end
      end
    end
  end
end
