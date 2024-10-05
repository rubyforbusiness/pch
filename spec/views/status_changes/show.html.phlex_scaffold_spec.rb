require 'rails_helper'

RSpec.describe "status_changes/show", type: :view do
  before(:each) do
    assign(:status_change, StatusChange.create!(
      from: "From",
      to: "To",
      project: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/From/)
    expect(rendered).to match(/To/)
    expect(rendered).to match(//)
  end
end
