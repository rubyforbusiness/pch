class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :status, inclusion: { in: ["draft", "in progress", "finished"] }

  has_many :comments

  after_create :add_status_change
  before_update :add_status_change_update, if: :status_changed?

  private

  def add_status_change
    StatusChange.create!(project: self, from: nil, to: status)
  end

  def add_status_change_update
    StatusChange.create!(project: self, from: status_was, to: status)
  end
end
