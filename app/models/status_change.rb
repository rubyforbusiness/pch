class StatusChange < ApplicationRecord
  belongs_to :project
  has_one :audit, as: :auditable, dependent: :destroy

  after_create :add_audit_record

  def view_template
    StatusChanges::StatusChangeView.new(status_change: self)
  end

  private

  def add_audit_record
    create_audit!(project_id: project_id, created_at: Time.now)
  end
end
