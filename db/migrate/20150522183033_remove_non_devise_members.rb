class RemoveNonDeviseMembers < ActiveRecord::Migration
  def change
    drop_table :members
  end
end
