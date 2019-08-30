# frozen_string_literal: true

class HealthPotion
  def initialize(name)
    @name = name
    puts name
    binding.pry
  end
end