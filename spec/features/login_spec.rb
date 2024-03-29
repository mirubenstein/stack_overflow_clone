require 'capybara/rails'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/login'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(page).to have_content 'Logged in'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log in'
    expect(page).to have_content 'invalid'
  end

  it "gives a user an error if the email is already taken" do
    visit '/signup'
    user = User.create(:email => 'user@example.com', :password => 'password')
    another_user = User.create(:email => 'user@example.com', :password => 'blamblam')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'blamblam'
    click_button 'Create User'
    expect(page).to have_content 'Email has already been taken'
  end

  it "gives user login prompt if not logged in and trying to create new question" do
    visit '/questions/new'
    expect(current_path).to eq login_path
  end

  it 'reroutes a user to the root route: questions#index page' do
    visit '/login'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    expect(current_path).to eq root_path
  end
end
