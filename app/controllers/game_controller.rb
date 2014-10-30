class GameController < ApplicationController


    def show
        $score_a = 0
        $score_b = 0
        $balls = 0
        $strikes = 0
        $outs = 0
        $at_bat = "Cardinals"
        $runners = 0
    end

    def update
      case params['commit']
      when "Out" then $outs += 1
      when "Strike" then $strikes += 1
      when "Ball" then $balls += 1
      when "Foul Ball" then $strikes += 1 unless $strikes == 2
      when 'Home Run!'
        score!
        $runners.times do
          score!
        end
        $runners = 0
      end

      if $strikes == 3 
        $outs += 1
        reset_count!
      end

      if $outs == 3
        $outs = 0
        reset_count!
        $at_bat = $at_bat == "Cubs" ? "Cardinals" : "Cubs"
        $runners = 0
      end

      if $balls == 4
        reset_count!
        $runners += 1
      end

      if $runners == 4
        score!
        $runners -= 1
      end
      
      render 'show'
    end
    
  private
    
    def reset_count!
      $balls = 0
      $strikes = 0
    end
    
    def score!
      $score_a += 1 if $at_bat == "Cardinals"
      $score_b += 1 if $at_bat == "Cubs"
    end

end
