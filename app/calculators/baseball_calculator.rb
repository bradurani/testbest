class BaseballCalculator

    def calculate(score_a, score_b, balls, strikes, outs, at_bat, action)
        case action
            when 'Foul Ball'
                score_foul_ball(score_a, score_b, balls, strikes, outs, at_bat)
            when 'Ball'
                score_ball(score_a, score_b, balls, strikes, outs, at_bat)
            when 'Strike'
                score_strike(score_a, score_b, balls, strikes, outs, at_bat)
            when 'Out'
                score_out(score_a, score_b, balls, strikes, outs, at_bat)
            when 'Home Run!'
                score_home_run(score_a, score_b, balls, strikes, outs, at_bat)
            else
                raise 'Unknown Action'
        end
    end

    def score_foul_ball(score_a, score_b, balls, strikes, outs, at_bat)
        new_strikes = if strikes == 2 then
                          2
                      else
                          strikes + 1
                      end
        return score_a, score_b, balls, new_strikes, outs, at_bat
    end

    def score_ball(score_a, score_b, balls, strikes, outs, at_bat)
        strikes = if balls == 3 then
                      0
                  else
                      strikes
                  end
        balls = if balls < 3 then
                    balls + 1
                else
                    0
                end
        return score_a, score_b, balls, strikes, outs, at_bat
    end

    def score_strike(score_a, score_b, balls, strikes, outs, at_bat)
        if strikes < 2
            strikes = strikes + 1
        else
            if strikes == 2
                strikes = 0
                balls = 0
                if outs == 2
                    outs = 0
                    if at_bat == 'Cardinals'
                        at_bat = 'Cubs'
                    else
                        at_bat = 'Cardinals'
                    end
                else
                    outs = outs + 1
                end
            end
        end
        return score_a, score_b, balls, strikes, outs, at_bat
    end

    def score_out(score_a, score_b, balls, strikes, outs, at_bat)
        balls = 0
        strikes = 0
        outs = if outs == 2 then
                   0
               else
                   outs + 1
               end
        if outs == 0
            if at_bat == 'Cardinals'
                at_bat = 'Cubs'
            else
                at_bat = 'Cardinals'
            end
        end
        return score_a, score_b, balls, strikes, outs, at_bat
    end

    def score_home_run(score_a, score_b, balls, strikes, outs, at_bat)
        balls = 0
        strikes = 0
        if at_bat == 'Cardinals'
            score_a = score_a + 1
        elsif at_bat == 'Cubs'
            score_b = score_b + 1
        end

        return score_a, score_b, balls, strikes, outs, at_bat
    end

end