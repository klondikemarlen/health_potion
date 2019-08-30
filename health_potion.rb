# frozen_string_literal: true

require_relative 'config/initializer'

class HealthPotion
  def initialize(name = nil)
    @name = name || File.basename($PROGRAM_NAME, '.rb')
    puts @name
  end
end
