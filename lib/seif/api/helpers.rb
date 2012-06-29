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

      # MOCKS, remove when the models are up
      MOCKS_PATH = File.expand_path("../mocks", __FILE__)
      def mock(file)
        Oj.load(File.read("#{MOCKS_PATH}/#{file}"))
      end
    end
  end
end
