class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
