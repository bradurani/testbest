require_relative('../../app/calculators/baseball_calculator')

describe BaseballCalculator do
    let(:calculator) { BaseballCalculator.new }

    context :score_foul_ball do

        it 'Returns correct strikes for 1 strike' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_foul_ball(3, 5, 2, 1, 0, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 5
            expect(balls).to eql 2
            expect(strikes).to eql 2
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct strikes for 0 strikes' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_foul_ball(3, 5, 2, 0, 0, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 5
            expect(balls).to eql 2
            expect(strikes).to eql 1
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct strikes for 2 strikes' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_foul_ball(3, 5, 2, 2, 0, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 5
            expect(balls).to eql 2
            expect(strikes).to eql 2
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

    end

    context :score_ball do
        it 'Returns correct balls for a ball with 0 balls' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_ball(0, 0, 0, 0, 0, 'Cardinals')
            expect(score_a).to eql 0
            expect(score_b).to eql 0
            expect(balls).to eql 1
            expect(strikes).to eql 0
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct balls for a ball with 1 balls' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_ball(3, 6, 1, 2, 0, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 6
            expect(balls).to eql 2
            expect(strikes).to eql 2
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct balls for a ball with 2 balls' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_ball(3, 6, 2, 2, 0, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 6
            expect(balls).to eql 3
            expect(strikes).to eql 2
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct balls and strikes for a ball starting with 3 balls' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_ball(3, 6, 3, 2, 0, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 6
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end


    end

    context :score_strike do

        it 'Returns correct strikes for a strike with 0 strikes' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_strike(0, 0, 0, 0, 0, 'Cardinals')
            expect(score_a).to eql 0
            expect(score_b).to eql 0
            expect(balls).to eql 0
            expect(strikes).to eql 1
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct strikes for a strike with 1 strikes' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_strike(0, 0, 0, 1, 0, 'Cardinals')
            expect(score_a).to eql 0
            expect(score_b).to eql 0
            expect(balls).to eql 0
            expect(strikes).to eql 2
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct strikes and outs for a strike with 2 strikes' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_strike(0, 0, 0, 2, 0, 'Cardinals')
            expect(score_a).to eql 0
            expect(score_b).to eql 0
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 1
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct strikes and at_bat for a strike with 2 strikes and 2 outs' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_strike(2, 4, 0, 2, 2, 'Cardinals')
            expect(score_a).to eql 2
            expect(score_b).to eql 4
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cubs'
        end
    end

    context :score_out do
        it 'Returns correct outs for an out with 0 outs' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_out(3, 4, 2, 1, 0, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 4
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 1
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct outs for an out with 1 outs' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_out(3, 4, 2, 1, 1, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 4
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 2
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct outs for an out with 2 outs' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_out(3, 4, 2, 1, 2, 'Cardinals')
            expect(score_a).to eql 3
            expect(score_b).to eql 4
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cubs'
        end

    end

    context :score_home_run do

        it 'Returns correct score_a for a Cardinals home run with 0 home runs' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_home_run(0, 4, 2, 1, 0, 'Cardinals')
            expect(score_a).to eql 1
            expect(score_b).to eql 4
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cardinals'
        end

        it 'Returns correct score_a for a Cubs home run with 0 home runs' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_home_run(0, 0, 2, 1, 0, 'Cubs')
            expect(score_a).to eql 0
            expect(score_b).to eql 1
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cubs'
        end

        it 'Returns correct score_a for a Cubs home run with 5 home runs' do
            score_a, score_b, balls, strikes, outs, at_bat = calculator.score_home_run(5, 5, 2, 1, 0, 'Cubs')
            expect(score_a).to eql 5
            expect(score_b).to eql 6
            expect(balls).to eql 0
            expect(strikes).to eql 0
            expect(outs).to eql 0
            expect(at_bat).to eql 'Cubs'
        end

    end

end
