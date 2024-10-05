class CreateAudits < ActiveRecord::Migration[7.1]
  def change
    create_table :audits do |t|
      t.datetime :created_at
      t.integer :auditable_id
      t.string :auditable_type
      t.references :project, null: false, foreign_key: true
    end
  end
end
