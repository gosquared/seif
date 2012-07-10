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
        before do
          get("/resources")
          @routes = body.map { |r| r["path"] }
        end

        it "shows all available routes" do
          @routes.must_include "/resources(.:format)"
          @routes.must_include "/:version/services(.:format)"
          @routes.must_include "/:version/services/crossgrade(.:format)"
        end
      end

      describe "GET /v1/version" do
        it "shows v1" do
          get("/v1/version")
          body.must_equal({ "version" => "v1" })
        end
      end

      describe "GET /v2/version" do
        it "shows v2" do
          get("/v2/version")
          body.must_equal({ "version" => "v2" })
        end
      end
    end
  end
end
