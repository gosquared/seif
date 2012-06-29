require File.expand_path('../service', __FILE__)

require 'rack/static'
use Rack::Static, :urls => ["/assets", "/index.html", "/service.html", "/favicon.ico"], :root => "public"

run Seif::API::Service
