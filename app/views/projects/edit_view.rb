module Projects
  class EditView < ApplicationView
    def initialize(project:)
      @project = project
    end

    def view_template
      render Form.new(project: project)
    end

    private

    attr_reader :project
  end
end
