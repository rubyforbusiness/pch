module Comments
  class CommentView < ApplicationView
    def initialize(comment:)
      @comment = comment
    end

    def view_template
      div(id: (dom_id comment)) do
        p do
          strong { "Text: " }
          plain comment.text
        end

        p do
          strong { "Project: " }
          plain comment.project_id
        end
      end
    end

    private

    attr_reader :comment
  end
end
