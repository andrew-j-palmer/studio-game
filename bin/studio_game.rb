module StudioGame

  require_relative '../lib/studio_game/game'
  require_relative '../lib/studio_game/clumsy_player'
  require_relative '../lib/studio_game/berserk_player'

  #player1 = Player.new("moe")
  #player2 = Player.new("larry", 60)
  #player3 = Player.new("curly", 125)




  knuckleheads = StudioGame::Game.new("Knuckleheads")

  knuckleheads.load_players(ARGV.shift || "players.csv")
  klutz = StudioGame::ClumsyPlayer.new("klutz", 105)
  knuckleheads.add_player(klutz)
  berserker = StudioGame::BerserkPlayer.new("berserker", 50)
  knuckleheads.add_player(berserker)
  
  #knuckleheads.add_player(player1)
  #knuckleheads.add_player(player2)
  #knuckleheads.add_player(player3)

  loop do
    print "How many rounds? ('quit' to exit) >"
    input = gets.chomp.downcase

    case input 
    when "quit", "exit"
      break
    when /^\d+$/
      knuckleheads.play(input.to_i)
      knuckleheads.print_stats
    else
      puts "Learn to type. Or read."
    end

    knuckleheads.high_score
    knuckleheads.save_high_score
  end

end
