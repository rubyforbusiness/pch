class Comment < ApplicationRecord
  belongs_to :project
  has_one :audit, as: :auditable, dependent: :destroy

  validates_presence_of :text

  after_create :add_audit_record


  def view_template
    Comments::CommentView.new(comment: self)
  end

  private

  def add_audit_record
    create_audit!(project_id: project_id, created_at: Time.now)
  end
end
