class RenameBadColumnNames < ActiveRecord::Migration
  def change
    rename_column :backpack_contents, :number, :amount
  end
end
