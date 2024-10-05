require 'rails_helper'

RSpec.describe "audits/edit", type: :view do
  let(:audit) {
    Audit.create!(
      auditable_id: 1,
      auditable_type: "MyString"
    )
  }

  before(:each) do
    assign(:audit, audit)
  end

  it "renders the edit audit form" do
    render

    assert_select "form[action=?][method=?]", audit_path(audit), "post" do

      assert_select "input[name=?]", "audit[auditable_id]"

      assert_select "input[name=?]", "audit[auditable_type]"
    end
  end
end
