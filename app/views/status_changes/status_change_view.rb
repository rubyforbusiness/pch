module StatusChanges
  class StatusChangeView < ApplicationView
    def initialize(status_change:)
      @status_change = status_change
    end

    def view_template
      div(id: (dom_id status_change)) do
        p do
          strong { "From: " }
          plain status_change.from
          strong(class: "pl-2") { "To: " }
          plain status_change.to
        end
      end
    end

    private

    attr_reader :status_change
  end
end
