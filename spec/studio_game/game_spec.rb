module StudioGame

  require 'studio_game/game'
  require 'studio_game/spec_helper'

  describe Game do

    before do
      $stdout = StringIO.new
      @game = Game.new("Knuckleheads")

      @initial_health = 100
      @player = Player.new("moe", @initial_health)
    
      @game.add_player(@player)
    end
  
    it "w00ts on high rolls" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      @game.play(2)
      @player.health.should == @initial_health + (15 * 2)
    end

    it "skips on medium rolls" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      @game.play(2)
      @player.health.should == @initial_health
    end

    it "blams on low rolls" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
      @game.play(2)
      @player.health.should == @initial_health - (10 * 2)
    end

    it "assigns a treasure for points during a player's turn" do
      game = Game.new("Knuckleheads")
      player = Player.new("moe")
  
      game.add_player(player)
  
      game.play(1)
  
      player.points.should_not be_zero
  
      # or use alternate expectation syntax:
      # expect(player.points).not_to be_zero
    end

  end
end
