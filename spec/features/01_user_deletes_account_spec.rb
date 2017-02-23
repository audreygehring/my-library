require "rails_helper"

  # Acceptance Criteria:
  # * On my account page, I see a "Delete" button
  # * If I click the button, I receive an "Are you sure?" prompted
  # * If I confirm the delete, I receive a message that my account has been deleted
  # * I can no longer Sign In

feature "user deletes account", %{
  As a registered  user
  I want to delete my account
  If I am unsatisfied
} do
  let(:user1) { FactoryGirl.create(:user) }

  scenario "delete account" do

    visit new_user_session_path
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    visit edit_user_registration_path

    click_button "Cancel my account"

    expect(page).to have_content("Your account has been successfully cancelled")
  end

end
