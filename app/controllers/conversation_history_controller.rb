class ConversationHistoryController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    @audits = Audit.where(project: project).order(created_at: :desc)

    respond_to do |format|
      format.html { render ConversationHistories::IndexView.new(audits: @audits) }
      format.json
    end
  end
end
