module Audits
  class EditView < ApplicationView
    def initialize(audit:)
      @audit = audit
    end

    def view_template
      h1 { "Editing audit" }

      render Form.new(audit: audit)

      br

      div do
        link_to "Show this audit", audit
        plain " | "
        link_to "Back to audits", audits_path
      end
    end

    private

    attr_reader :audit
  end
end
