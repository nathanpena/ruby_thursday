class RemoveAccounts < ActiveRecord::Migration
  def up
    drop_table :accounts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
