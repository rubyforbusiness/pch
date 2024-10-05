module Audits
  class ShowView < ApplicationView
    def initialize(audit:)
      @audit = audit
    end

    def view_template
      p(style: "color:#008000") { notice }

      render AuditView.new(audit: audit)

      div do
        link_to "Edit this audit", edit_audit_path(audit)
        plain " | "
        link_to "Back to audits", audits_path
        button_to "Destroy this audit", audit, method: :delete
      end
    end

    private

    attr_reader :audit
  end
end
