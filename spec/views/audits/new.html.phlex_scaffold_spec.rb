require 'rails_helper'

RSpec.describe "audits/new", type: :view do
  before(:each) do
    assign(:audit, Audit.new(
      auditable_id: 1,
      auditable_type: "MyString"
    ))
  end

  it "renders new audit form" do
    render

    assert_select "form[action=?][method=?]", audits_path, "post" do

      assert_select "input[name=?]", "audit[auditable_id]"

      assert_select "input[name=?]", "audit[auditable_type]"
    end
  end
end
