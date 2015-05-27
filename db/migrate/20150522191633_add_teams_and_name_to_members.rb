class AddTeamsAndNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :name, :string
    add_reference :members, :team, index: true, foreign_key: true
  end
end
