require 'rails_helper'

RSpec.describe "status_changes/edit", type: :view do
  let(:status_change) {
    StatusChange.create!(
      from: "MyString",
      to: "MyString",
      project: nil
    )
  }

  before(:each) do
    assign(:status_change, status_change)
  end

  it "renders the edit status_change form" do
    render

    assert_select "form[action=?][method=?]", status_change_path(status_change), "post" do

      assert_select "input[name=?]", "status_change[from]"

      assert_select "input[name=?]", "status_change[to]"

      assert_select "input[name=?]", "status_change[project_id]"
    end
  end
end
