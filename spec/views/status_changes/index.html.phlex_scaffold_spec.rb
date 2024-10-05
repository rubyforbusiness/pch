require 'rails_helper'

RSpec.describe "status_changes/index", type: :view do
  before(:each) do
    assign(:status_changes, [
      StatusChange.create!(
        from: "From",
        to: "To",
        project: nil
      ),
      StatusChange.create!(
        from: "From",
        to: "To",
        project: nil
      )
    ])
  end

  it "renders a list of status_changes" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("From".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("To".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
