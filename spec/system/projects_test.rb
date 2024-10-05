require "rails_helper"

RSpec.describe "Projects management", type: :system do
  before do
    driven_by(:rack_test)
    #driven_by(:selenium) # TODO fix hangs
    #driven_by(:selenium_chrome_headless)
  end

  it "enables me to see the list of projects" do
    visit projects_url
    expect(page).to have_text("Projects")
    expect(page).to have_link("New project")
  end

  it "enables me to create a project" do
    visit projects_url
    click_on "New project"

    fill_in "Name", with: "My project"
    fill_in "Status", with: "draft"
    click_on "Create Project"

    expect(page).to have_text("Project was successfully created")
    click_on "Back"
  end
  #
  # it "should update User" do
  #   visit user_url(@user)
  #   click_on "Edit this user", match: :first
  #
  #   fill_in "Name", with: @user.name
  #   click_on "Update User"
  #
  #   assert_text "User was successfully updated"
  #   click_on "Back"
  # end
  #
  # it "should destroy User" do
  #   visit user_url(@user)
  #   click_on "Destroy this user", match: :first
  #
  #   assert_text "User was successfully destroyed"
  # end
end
