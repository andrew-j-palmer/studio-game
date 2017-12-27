module StudioGame

  require 'studio_game/player'

  class BerserkPlayer < Player
  
    def initialize(name, health=100)
      @w00tcount = 0
      super(name, health)
    end

    def berserk?
      if @w00tcount < 6
        false
      else
        true
      end
    end

    def w00t
      super
      @w00tcount += 1
      puts "#{name} is berserk!" if berserk?
    end

    def blam
      if berserk?
        w00t
      else
        super
      end
    end

  end
end

if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times { berserker.w00t }
    2.times { berserker.blam }
    puts berserker.health
  end
