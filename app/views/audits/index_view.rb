module Audits
  class IndexView < ApplicationView
    def initialize(audits:)
      @audits = audits
    end

    def view_template
      p(style: "color:#008000") { notice }

      h1 { "Audits" }

      div(id: "audits") do
        audits.each do |audit|
          render AuditView.new(audit: audit)
          p do
            link_to "Show this Audit", audit
          end
        end
      end

      link_to "New audit", new_audit_path
    end

    private

    attr_reader :audits
  end
end
