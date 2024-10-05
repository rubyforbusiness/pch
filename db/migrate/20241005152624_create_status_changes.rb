class CreateStatusChanges < ActiveRecord::Migration[7.1]
  def change
    create_table :status_changes do |t|
      t.string :from
      t.string :to
      t.references :project, null: false, foreign_key: true
    end
  end
end
