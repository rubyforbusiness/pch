module Comments
  class NewView < ApplicationView
    def initialize(comment:)
      @comment = comment
    end

    def view_template
      h1 { "New comment" }

      render Form.new(comment: comment)
    end

    private

    attr_reader :comment
  end
end
