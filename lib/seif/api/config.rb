require 'logger'

module Seif
  module API
    module Config
      extend self
      UNICORN = {
        :workers => ENV.fetch('SEIF_API_WORKERS') { 1 },
        :timeout => ENV.fetch('SEIF_API_TIMEOUT') { 60 },
        :tcp => {
          :port => ENV.fetch('SEIF_API_PORT') { 9000 },
          :options => {
            :tcp_nopush => true
          }
        },
        :unix => {
          :path => ENV.fetch('SEIF_API_SOCKET') { "/tmp/seif_api.sock" },
          :options => {
            :backlog => 64
          }
        },
        :pid => ENV.fetch('SEIF_API_PID') { "/tmp/seif_api.pid" }
      }

      AUTH = {
        :token => ENV['SEIF_API_TOKEN']
      }
    end
  end
end
