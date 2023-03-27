require 'rails_helper'

RSpec.feature "Resumes", type: :feature do
  context 'create new Resume' do 
    before(:each) do
      visit new_resumes_path
      fill_in '姓名', with: 'Andy'
      fill_in '信箱', with: '123@ccc.tw'
      fill_in '電話', with: '0900333444'
      fill_in '技能', with: 'have skills'
      fill_in '簡介', with: 'testing'
      fill_in '城市', with: 'Taipei'
      fill_in '教育程度', with: 'College'
      fill_in '經驗', with: 'None'
      fill_in '職務', with: 'Cook'
    end
    
    scenario 'valid inputs' do
      click_on 'Create Resume'
      visit resumes_path
      expect(page).to have_content('Andy')
      expect(page).to have_content('123@ccc.tw')
      expect(page).to have_content('0900333444')
      expect(page).to have_content('have skills')
      expect(page).to have_content('testing')
      expect(page).to have_content('Taipei')
      expect(page).to have_content('College')
      expect(page).to have_content('None')
      expect(page).to have_content('Cook')
    end

     scenario 'invalid inputs' do
      fill_in '姓名', with: ''
      click_on 'Create Resume'
      expect(page).to have_content("Name can't be blank")
    end
  
    scenario 'invalid inputs' do
      fill_in '信箱', with: ''
      click_on 'Create Resume'
      expect(page).to have_content("Email can't be blank")
    end
  
    scenario 'invalid inputs' do
      fill_in '電話', with: ''
      click_on 'Create Resume'
      expect(page).to have_content("Tel can't be blank")
    end
  end
end
