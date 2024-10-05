module Audits
  class NewView < ApplicationView
    def initialize(audit:)
      @audit = audit
    end

    def view_template
      h1 { "New audit" }

      render Form.new(audit: audit)

      br

      div do
        link_to "Back to audits", audits_path
      end
    end

    private

    attr_reader :audit
  end
end
