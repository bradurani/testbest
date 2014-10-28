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

        puts("Strikes: #{params['strikes']}")

        render 'index'
    end

end
