class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :project, null: false, foreign_key: true
    end
  end
end
