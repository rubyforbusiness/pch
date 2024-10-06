module Audits
  class AuditView < ApplicationView
    def initialize(audit:)
      @audit = audit
    end

    def view_template
      div(id: (dom_id audit)) do
        p do
          strong { "Created at: " }
          plain audit.created_at
        end

        p do
          strong { "Auditable: " }
          plain audit.auditable_id
        end

        p do
          strong { "Auditable type: " }
          plain audit.auditable_type
        end

        p do
          strong { "Project: " }
          plain audit.project.name
        end
      end
    end

    private

    attr_reader :audit
  end
end
