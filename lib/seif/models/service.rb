require 'ohm'

class Service < Ohm::Model
  attribute :name
  assert_present :name
  unique :name
  index :name

  attribute :description

  attribute :tcp_socket
  assert :numeric
  unique :tcp_socket

  attribute :unix_socket
  unique :unix_socket

  attribute :jenkins

  collection :tags, :Tag
  collection :instances, :Instance

  reference :repository, :Repository
  reference :shell_profile, :ShellProfile 
  reference :web_server, :WebServer
end
