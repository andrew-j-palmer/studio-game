module StudioGame

  require 'studio_game/game'
  require 'studio_game/treasure_trove'
  require 'studio_game/playable'

  class Player
    include Playable
    attr_accessor :name, :health
  
    def initialize(name, health=100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
    end

    def name=(newname)
      @name = newname.capitalize
    end

    def self.from_csv(line)
      name, health = line.split(",")
      player = Player.new(name, Integer(health))
    end

    def to_s
      "I'm #{@name} with health = #{@health}, points = #{points} and score = #{score}."
    end  

    def score
      @health + points
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      print "#{@name}'s treasures: "
      puts @found_treasures
    end

    def each_found_treasure
      @found_treasures.each do |x, y|
        yield Treasure.new(x, y)
      end
    end

    def points
      @found_treasures.values.reduce(0, :+)
    end

    def <=>(other_player)
      other_player.score <=> score
    end
  end
end
