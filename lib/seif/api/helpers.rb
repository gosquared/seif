require_relative 'config'

module Seif
  module API
    module Helpers
      def authorize!
        if Config::AUTH[:token]
          unless params[:token] == Config::AUTH[:token]
            throw :error,
                  :message => { :errors => { :token => ["invalid"] } },
                  :status  => 401
          end
        end
      end
    end
  end
end
