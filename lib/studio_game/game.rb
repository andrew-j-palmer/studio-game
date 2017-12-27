module StudioGame

  require 'studio_game/player'
  require 'studio_game/game_turn'
  require 'studio_game/treasure_trove'
  require 'csv'


  class Game
    attr_reader :title
    def initialize(gamename)
      @title = gamename
      @players = Array.new
      @rounds = 0
    end
  
    def add_player(player)
      @players.push(player)
    end
  
    def play(rounds)

      @rounds = rounds
      @treasures = TreasureTrove::TREASURES
      puts "There are #{@treasures.size} treasures to be found:"
      @treasures.each do |x|
        puts "A #{x.name} is worth #{x.points} points"
      end

      1.upto(@rounds) { |r|      
        puts
        puts " --- Round #{r} --- "

        @players.each do |p|
          GameTurn.take_turn(p)
        end
      }
    end

    def print_name_and_health(player)
      puts "#{player.name}, #{player.health}"
    end

    def print_stats
      
      puts
      puts "#{@title} Statistics:"

      strong, weak = @players.partition { |n| n.strong? }
      strong.sort!
      weak.sort!

      puts "#{strong.size} Strong Players:"

      strong.each do |x|
        print_name_and_health(x)
      end
      puts
      puts "#{weak.size} Wimpy Players:"
      
      weak.each do |x|
        print_name_and_health(x)
      end
      puts
      @players.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
        puts "#{player.points} grand total points"
      end
    end

    def high_score
      @players.sort!
      puts
      puts "#{@title} High Scores:"
      @players.each do |x|
        puts high_score_entry(x)
      end
    end

    def save_high_score(file="highscores.txt")
      File.open(file, "w") do |x|
        x.puts "#{@title} High Scores:"
        @players.sort.each do |y|
          x.puts high_score_entry(y)
        end
      end
    end

    def high_score_entry(player)
      line = player.name.ljust(20, '.')
      "#{line} #{player.score}"
    end

    def load_players(infile)
      CSV.foreach(infile) do |x|
        newplayer = Player.new(x[0], x[1].to_i)
        add_player(newplayer)
      end
    end

  end
end
  
