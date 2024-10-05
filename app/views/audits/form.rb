module Audits
  class Form < ApplicationView
    def initialize(audit:)
      @audit = audit
    end

    def view_template
      form_with(model: audit) do |form|
        if audit.errors.any?
          div(style: "color:red") do
            h2 do
              plain pluralize(audit.errors.count, "error")
              plain " prohibited this audit from being saved:"
            end
            ul { audit.errors.each { |error| li { error.full_message } } }
          end
        end

      div do
        form.label :created_at, style: "display: block"
        form.datetime_field :created_at
      end

      div do
        form.label :auditable_id, style: "display: block"
        form.number_field :auditable_id
      end

      div do
        form.label :auditable_type, style: "display: block"
        form.text_field :auditable_type
      end

        div { plain form.submit }
      end
    end

    private

    attr_reader :audit
  end
end
