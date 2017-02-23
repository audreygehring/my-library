require "rails_helper"
  # Acceptance Criteria:
  # * I click "Sign In" on the home page
  # * I am presented with a form requesting email and password
  # * My password is not displayed as I enter it
  # * I must specify a valid email and password otherwise I will receive an invalid prompt
  # * If I'm already signed in, I don't have the option to Sign In


feature "user signs up", %{
  As a Signed Up user
  I want to Sign In
  So that I can access my account
} do
  let(:user1) { FactoryGirl.create(:user) }

  scenario "specify valid credentials" do

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    expect(page).to have_content("Sign Out")
  end

  scenario "specify invalid credentials" do
    visit new_user_session_path

    click_button "Sign In"
    expect(page).to have_content("Invalid Email or password")
    expect(page).to_not have_content("Sign Out")
  end
end
