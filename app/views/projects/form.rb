module Projects
  class Form < ApplicationView
    def initialize(project:)
      @project = project
    end

    def view_template
      form_with(model: project) do |form|
        if project.errors.any?
          div(style: "color:red") do
            h2 do
              plain pluralize(project.errors.count, "error")
              plain " prohibited this project from being saved:"
            end
            ul { project.errors.each { |error| li { error.full_message } } }
          end
        end

        div do
          form.label :status, style: "display: block"
          form.select :status, Project::STATI
        end


        div { button { form.submit } }
      end
    end

    private

    attr_reader :project
  end
end
