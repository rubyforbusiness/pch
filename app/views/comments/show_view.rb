module Comments
  class ShowView < ApplicationView
    def initialize(comment:)
      @comment = comment
    end

    def view_template
      p(style: "color:#008000") { notice }

      render CommentView.new(comment: comment)

      div do
        link_to "Edit this comment", edit_comment_path(comment)
        plain " | "
        link_to "Back to comments", comments_path
        button_to "Destroy this comment", comment, method: :delete
      end
    end

    private

    attr_reader :comment
  end
end
