module StatusChanges
  class ShowView < ApplicationView
    def initialize(status_change:)
      @status_change = status_change
    end

    def view_template
      p(style: "color:#008000") { notice }

      render StatusChangeView.new(status_change: status_change)

      div do
        link_to "Edit this status change", edit_status_change_path(status_change)
        plain " | "
        link_to "Back to status_changes", status_changes_path
        button_to "Destroy this status change", status_change, method: :delete
      end
    end

    private

    attr_reader :status_change
  end
end
