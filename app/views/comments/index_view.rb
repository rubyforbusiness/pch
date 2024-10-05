module Comments
  class IndexView < ApplicationView
    def initialize(comments:)
      @comments = comments
    end

    def view_template
      p(style: "color:#008000") { notice }

      h1 { "Comments" }

      div(id: "comments") do
        comments.each do |comment|
          render CommentView.new(comment: comment)
          p do
            link_to "Show this Comment", comment
          end
        end
      end

      link_to "New comment", new_comment_path
    end

    private

    attr_reader :comments
  end
end
