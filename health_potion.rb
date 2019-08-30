# frozen_string_literal: true

require_relative 'config/initializer'

class HealthPotion
  def initialize(name)
    @name = name
    puts name
    binding.pry
  end
end