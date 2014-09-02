require 'capybara/rails'

describe "non signed in user path" do
    it "does not show edit and delete for question show unless creator of question" do
      user = User.create(:email => 'user@example.com', :password => 'password')
      question = user.questions.create(title: 'test title', question: 'test question')
      visit "/questions/#{question.id}/edit"
      expect(page).to_not have_content "Edit"
    end
end

describe "create signin path" do
    it "gives current question an error if user does not enter question form correctly" do
      visit '/login'
      user = User.create(:email => 'user@example.com', :password => 'password')
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Log in'
    end

    describe "followed by signin" do
      it "gives current question an error if user does not enter question form correctly" do
        visit '/login'
        user = User.create(:email => 'user@example.com', :password => 'password')
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password'
        click_button 'Log in'
        visit '/questions/new'
        fill_in 'Title', :with => ''
        click_button 'Create Question'
        expect(page).to have_content "Title can't be blank"
      end

      it "gives current user an error if user does not enter question form correctly" do
        visit '/login'
        user = User.create(:email => 'user@example.com', :password => 'password')
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password'
        click_button 'Log in'
        visit '/questions/new'
        fill_in 'Title', :with => 'test title'
        fill_in 'Question', :with => 'test question'
        click_button 'Create Question'
        expect(page).to have_content "was added. Thanks for asking!"
      end

      it "does show edit and delete for question if creator of question" do
        visit '/login'
        user = User.create(:email => 'user@example.com', :password => 'password')
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password'
        click_button 'Log in'
        question = user.questions.create(title: 'test title', question: 'test question')
        visit "/questions/#{question.id}/edit"
        fill_in 'Title', :with => 'test title2'
        fill_in 'Question', :with => 'test question2'
        click_on 'Update Question'
        expect(page).to have_content "test question2"
      end

      it "allows current user to delete a question" do
        visit '/login'
        user = User.create(:email => 'user@example.com', :password => 'password')
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password'
        click_button 'Log in'
        question = user.questions.create(title: 'test title', question: 'test question')
        visit "/questions/#{question.id}"
        click_on 'Delete'
        expect(page).to have_content "The question was deleted."
      end
    end
end
