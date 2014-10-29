class WelcomeController < ApplicationController

    def index
        @score_a = 0
        @score_b = 0
        @balls = 0
        @strikes = 0
        @outs = 0
        @at_bat = "Cardinals"
    end

    def update
        score_a = params['score_a'].to_i
        score_b = params['score_b'].to_i
        balls = params['balls'].to_i
        strikes = params['strikes'].to_i
        outs = params['outs'].to_i
        at_bat = params['at_bat']

        action = params['commit']



        calculator = BaseballCalculator.new
        @score_a, @score_b, @balls, @strikes, @outs, @at_bat = calculator.calculate(score_a, score_b, balls, strikes, outs, at_bat, action)

        puts "Score A is #{@score_a}"
        render 'index'
    end

end
