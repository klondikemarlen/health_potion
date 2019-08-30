# frozen_string_literal: true

# WARNING: setting env['RUBYOPT'] = '--enable-frozen-string-literal'
# will break pry
class Config
  class << self
    attr_accessor :env

    def define
      yield @env
    end

    def activate
      exec(env, 'ruby', $PROGRAM_NAME, *ARGV) unless env_modified?
      exit
    end

    def env_modified?
      return true if env.empty?

      env.each do |key, value|
        return false unless ENV[key] == value
      end
      true
    end
  end

  @env = {}
end
