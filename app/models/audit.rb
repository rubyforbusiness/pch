class Audit < ApplicationRecord
  belongs_to :auditable, polymorphic: true
  belongs_to :project
  validates_presence_of :auditable, :project, :created_at
end
