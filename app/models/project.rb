class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :status, inclusion: { in: ["draft", "in progress", "finished"] }
end
