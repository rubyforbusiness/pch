module ConversationHistories
  class IndexView < ApplicationView
    def initialize(audits:)
      @audits = audits
    end

    def view_template
      p(style: "color:#008000") { notice }

      project = audits.first.project
      h1 { "Conversation History for project: #{project.name}" }

      turbo_frame_tag(project) do
        div(class: "border-2 border-blue-600") do
          render Projects::EditView.new(project: project)
        end

        div(class: "border-2 border-blue-600") do
          comment = Comment.new(project: project)
          render Comments::NewView.new(comment: comment)
        end

        div(id: "audits") do
          audits.each do |audit|
            div(class: "border-4 pt-2 pb-2") do
              p do
                plain audit.created_at
                span(class: "pl-2") do
                  plain audit.auditable_type
                end
              end

              render audit.auditable.view_template
            end
          end
        end
      end
    end

    private

    attr_reader :audits
  end
end
