module Comments
  class Form < ApplicationView
    def initialize(comment:)
      @comment = comment
    end

    def view_template
      form_with(model: comment) do |form|
        if comment.errors.any?
          div(style: "color:red") do
            h2 do
              plain pluralize(comment.errors.count, "error")
              plain " prohibited this comment from being saved:"
            end
            ul { comment.errors.each { |error| li { error.full_message } } }
          end
        end

      div do
        form.label :text, style: "display: block"
        form.text_area :text
      end

      div do
        form.label :project_id, style: "display: block"
        form.text_field :project_id
      end

        div { plain form.submit }
      end
    end

    private

    attr_reader :comment
  end
end
