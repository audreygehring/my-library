require "rails_helper"
  # Acceptance Criteria:
  # * I click "Sign In" on the home page
  # * I am presented with a form requesting email and password
  # * My password is not displayed as I enter it
  # * I must specify a valid email and password otherwise I will receive an invalid prompt
  # * If I'm already signed in, I don't have the option to Sign In


feature "user views list of books", %{
  As a user
  I want to view a list of books
  So that I can keep track of my books
} do
  let(:user1) { FactoryGirl.create(:user) }

  scenario "access books list" do

    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    expect(page).to have_content "Sign Out"

    click_link "My Books"

    expect(page).to have_content "My Books"
    expect(page).to have_content "Add a Book"
  end

  scenario "user adds a book" do
    visit new_user_session_path

    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign In"

    expect(page).to have_content "Sign Out"

    visit books_path

    click_link "Add a Book"

    fill_in "Title", with: "Harry Potter and the Prisoner of Azkaban"
    fill_in "Author", with: "J.K. Rowling"
    fill_in "Description", with: "Harry and friends embark on another adventure."
    fill_in "Pages", with: 450
    fill_in "Publication Date", with: "June 10, 2000"

    click_button "Submit Book"

    expect(page).to have_content "Harry Potter and the Prisoner of Azkaban"
  end
end
