module StatusChanges
  class IndexView < ApplicationView
    def initialize(status_changes:)
      @status_changes = status_changes
    end

    def view_template
      p(style: "color:#008000") { notice }

      h1 { "Status changes" }

      div(id: "status_changes") do
        status_changes.each do |status_change|
          render StatusChangeView.new(status_change: status_change)
          p do
            link_to "Show this Status change", status_change
          end
        end
      end

      link_to "New status change", new_status_change_path
    end

    private

    attr_reader :status_changes
  end
end
