module StatusChanges
  class Form < ApplicationView
    def initialize(status_change:)
      @status_change = status_change
    end

    def view_template
      form_with(model: status_change) do |form|
        if status_change.errors.any?
          div(style: "color:red") do
            h2 do
              plain pluralize(status_change.errors.count, "error")
              plain " prohibited this status_change from being saved:"
            end
            ul { status_change.errors.each { |error| li { error.full_message } } }
          end
        end

      div do
        form.label :from, style: "display: block"
        form.text_field :from
      end

      div do
        form.label :to, style: "display: block"
        form.text_field :to
      end

      div do
        form.label :project_id, style: "display: block"
        form.text_field :project_id
      end

        div { plain form.submit }
      end
    end

    private

    attr_reader :status_change
  end
end
