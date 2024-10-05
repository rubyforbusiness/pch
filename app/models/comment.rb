class Comment < ApplicationRecord
  belongs_to :project
  has_one :audit, as: :auditable

  after_create :add_audit_record

  private

  def add_audit_record
    create_audit!(project_id: project_id, created_at: Time.now)
  end
end
