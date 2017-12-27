module StudioGame

  require 'studio_game/player'
  require 'studio_game/die'

  module GameTurn
    def self.take_turn(player)
      outcome = Die.new
      number_rolled = outcome.roll
      if number_rolled >= 5
        player.w00t
      elsif number_rolled >= 3
        puts "#{player.name} was skipped."
      else number_rolled < 3
        player.blam
      end
      player.found_treasure(TreasureTrove.random)
    end
  end
end
