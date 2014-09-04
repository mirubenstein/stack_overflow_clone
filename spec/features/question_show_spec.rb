describe "Questions" do
  it "opens create answer form when current_user clicks 'answer question' link" , js: true do
    visit '/login'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    visit new_question_path
    question = user.questions.create(title: 'test title', question: 'test question')
    visit "/questions/#{question.id}"
    click_link "Answer Question"
    expect(page).to have_button "Create Answer"
  end

    it "creates answer when user clicks 'creates answer' button" , js: true do
      visit '/login'
      user = User.create(:email => 'user@example.com', :password => 'password')
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
      visit new_question_path
      question = user.questions.create(title: 'test title', question: 'test question')
      visit "/questions/#{question.id}"
      click_link "Answer Question"
      fill_in 'Answer', :with => ''

    end
end
