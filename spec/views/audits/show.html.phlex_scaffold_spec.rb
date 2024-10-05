require 'rails_helper'

RSpec.describe "audits/show", type: :view do
  before(:each) do
    assign(:audit, Audit.create!(
      auditable_id: 2,
      auditable_type: "Auditable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Auditable Type/)
  end
end
