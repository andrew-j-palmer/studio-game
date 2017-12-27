module StudioGame

  module Playable

  def w00t
      @health += 15
      puts "#{@name} got w00ted!"
    end

    def blam
      @health -= 10
      puts "#{@name} got blammed!"
    end

    def strong?
      if @health >= 100
        true
      else
        false
      end
    end


  end
end