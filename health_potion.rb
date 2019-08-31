# frozen_string_literal: true

require_relative 'config/initializer'

class HealthPotion
  attr_reader :routes, :name, :routes_by_name, :env

  def initialize(name = nil)
    @name = name || File.basename($PROGRAM_NAME, '.rb')
    @routes = {}
    @routes_by_name = {}
  end

  def route(path, name, &block)
    @routes[path] = block
    @routes_by_name[name] = path
  end

  def run
    puts 'Booting up Health Potion ...'
  end
  end
end
