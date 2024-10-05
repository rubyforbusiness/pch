require 'rails_helper'

RSpec.describe "status_changes/new", type: :view do
  before(:each) do
    assign(:status_change, StatusChange.new(
      from: "MyString",
      to: "MyString",
      project: nil
    ))
  end

  it "renders new status_change form" do
    render

    assert_select "form[action=?][method=?]", status_changes_path, "post" do

      assert_select "input[name=?]", "status_change[from]"

      assert_select "input[name=?]", "status_change[to]"

      assert_select "input[name=?]", "status_change[project_id]"
    end
  end
end
