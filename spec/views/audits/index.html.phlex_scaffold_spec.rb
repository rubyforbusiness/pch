require 'rails_helper'

RSpec.describe "audits/index", type: :view do
  before(:each) do
    assign(:audits, [
      Audit.create!(
        auditable_id: 2,
        auditable_type: "Auditable Type"
      ),
      Audit.create!(
        auditable_id: 2,
        auditable_type: "Auditable Type"
      )
    ])
  end

  it "renders a list of audits" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Auditable Type".to_s), count: 2
  end
end
