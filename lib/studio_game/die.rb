module StudioGame

  require 'studio_game/auditable.rb'

  class Die
    include Auditable

    attr_reader :number

    def initialize
      @number = self.roll
    end

    def roll
      @number = rand(1..6)
      audit
      @number
    end

  end
end
