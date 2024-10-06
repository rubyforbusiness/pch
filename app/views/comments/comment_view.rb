module Comments
  class CommentView < ApplicationView
    def initialize(comment:)
      @comment = comment
    end

    def view_template
      div(id: (dom_id comment)) do
        p(class: "italic") { comment.text }
      end
    end

    private

    attr_reader :comment
  end
end
