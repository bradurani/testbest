require "rails_helper"

feature do
  
  describe "When there are no outs" do
    before do
      visit '/'
    end
    
    describe "and I click the 'Outs' button" do
      it "should ad an out" do
        click_button 'Out' # 1st strike
        expect(page).to have_content 'Outs: 1'
      end
    end
  end
  
  describe "When there are no strikes" do
    before do
      visit '/'
    end
    
    describe "and I click 'Strike'" do
      it "should add a strike" do
        click_button 'Strike' # 1st strike
        expect(page).to have_content 'Strikes: 1'
      end
    end
    
    describe "and I click 'Foul Ball'" do
      it "should add a strike" do
        click_button 'Foul Ball' # 1st strike
        expect(page).to have_content 'Strikes: 1'
      end
    end
  end
  
  describe "Where there are two strikes" do
    before do
      visit '/' # 0 strikes
      click_button 'Strike' # 1st strike
      click_button 'Strike' # 2nd strike
      
      click_button 'Ball' # so that the 'reset the count' test is testing something
    end
    
    describe "and I click 'Strike'" do
      before do
        click_button 'Strike' # 3rd strike
      end
      
      it "should add an out" do
        expect(page).to have_content 'Outs: 1'
      end
      
      it "should reset the count" do
        expect(page).to have_content 'Strikes: 0'
        expect(page).to have_content 'Balls: 0'
      end
    end
    
    describe "and I click 'Foul Ball'" do
      it "should not change anything" do
        click_button 'Foul Ball'
        expect(page).to have_content 'Strikes: 2'
      end
    end
  end
  
  describe "When there are two outs" do
    before do
      visit '/'
      click_button 'Out'
      click_button 'Out'
      
      click_button 'Strike' # so that the 'reset the count' test is testing something
      click_button 'Ball' # so that the 'reset the count' test is testing something
    end
    
    describe "and I click 'Out'" do
      before do
        click_button 'Out' # 3rd out
      end
      
      it "should change the team to 'Cubs'" do
        expect(page).to have_content 'At Bat: Cubs'
      end
      
      it "should reset the count" do
        expect(page).to have_content 'Strikes: 0'
        expect(page).to have_content 'Balls: 0'
      end
      
      it "should reset the outs" do
        expect(page).to have_content 'Outs: 0'
      end
    end
  end
  
  describe "When the Cardinals are at bat" do
    before do
      visit '/'
    end
    
    describe "and I click 'Home Run'" do
      it "should increment the score of the home team" do
        click_button "Home Run!"
        expect(page).to have_content 'Score: 1-0'
      end
    end
  end
  
  describe "When the Cubs are at bat" do
    before do
      visit '/'
      
      # Three outs switches the batter
      click_button 'Out'
      click_button 'Out'
      click_button 'Out'
    end
    
    describe "and I click 'Home Run'" do
      it "should increment the score of the visiting team" do
        click_button "Home Run!"
        expect(page).to have_content 'Score: 0-1'
      end
    end
    
    describe "and I click 'Out' three times" do
      before do
        click_button 'Out'
        click_button 'Out'
        click_button 'Out'
      end
      
      it "should change the team to 'Cardinals'" do
        expect(page).to have_content 'At Bat: Cardinals'
      end
    end
  end
  
  describe "When there are three balls" do
    before do
      visit '/'
      click_button 'Ball'
      click_button 'Ball'
      click_button 'Ball'
      
      click_button 'Strike' # so that the 'reset the count' test is testing something
    end
    
    describe "and I click 'Ball'" do
      before do
        click_button "Ball"
      end
      
      it "should reset the count" do
        expect(page).to have_content 'Strikes: 0'
        expect(page).to have_content 'Balls: 0'
      end
    end
    
    describe "and there are three runners" do
      before do
        12.times do
          click_button 'Ball'
        end
      end
      
      describe "and I click 'Ball'" do
        before do
          click_button 'Ball'
        end
        
        it "should increase the score" do
          expect(page).to have_content 'Score: 1-0'
        end
      end
      
      describe "and I click 'Ball' five times" do
        before do
          5.times do
            click_button 'Ball'
          end
        end
        
        it "should increase the score twice" do
          expect(page).to have_content 'Score: 2-0'
        end
      end
      
      describe "and I click 'Home Run!'" do
        before do
          click_button 'Home Run!'
        end
        
        it "should increase the score four times" do
          expect(page).to have_content 'Score: 4-0'
        end
        
        describe "and I click 'Ball' sixteen more times" do
          before do
            16.times do
              click_button 'Ball'
            end
          end
          
          it "should only score once (i.e. the runners were reset by the Home Run)" do
            expect(page).to have_content 'Score: 5-0'
          end
        end
      end
      
      describe "and I click 'Out' three times" do
        before do
          3.times do
            click_button "Out"
          end
        end
        
        describe "and the opposing team gets a home run" do
          before do
            click_button 'Home Run!'
          end
          
          it "should only score once (i.e. the runners were reset by the outs)" do
            expect(page).to have_content 'Score: 0-1'
          end
        end
      end
    end
  end

end
