module StatusChanges
  class NewView < ApplicationView
    def initialize(status_change:)
      @status_change = status_change
    end

    def view_template
      h1 { "New status change" }

      render Form.new(status_change: status_change)

      br

      div do
        link_to "Back to status_changes", status_changes_path
      end
    end

    private

    attr_reader :status_change
  end
end
