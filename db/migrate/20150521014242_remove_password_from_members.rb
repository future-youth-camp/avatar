class RemovePasswordFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :password_digest
  end
end
