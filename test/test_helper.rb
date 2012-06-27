require 'pry'
require 'oj'
require 'rack/test'
require 'turn/autorun'

APP_ROOT = File.expand_path('../../lib/seif', __FILE__)
$:.push APP_ROOT

MiniTest::Unit.after_tests do
end
