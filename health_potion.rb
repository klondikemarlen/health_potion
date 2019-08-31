# frozen_string_literal: true

require 'rack'
require_relative 'config/initializer'
require_relative 'response'

class HealthPotion
  attr_reader :routes, :name, :routes_by_name, :env

  def initialize(name = nil)
    @name = name || File.basename($PROGRAM_NAME, '.rb')
    @routes = {}
    @routes_by_name = {}
  end

  # The callable must return some kind of response like
  # [body:String, status:Integer, headers:Hash]
  def route(path, name, &callable)
    @routes[path] = callable
    @routes_by_name[name] = path
  end

  def run
    puts 'Booting up Health Potion ...'
    Rack::Handler::WEBrick.run self, Port: 5000
  end

  # A Rack application is a Ruby object (not a class) that responds to call.
  # It takes exactly one argument, the environment and returns an Array of
  # exactly three values: The status, the headers, and the body.
  def call(env)
    @env = env
    simple_response = routes[request_path].call
    RackSafeResponse.new(simple_response).call
  end

  def request_path
    env['REQUEST_PATH']
  end
end
