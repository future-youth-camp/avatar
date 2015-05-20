class CreateBackpackContents < ActiveRecord::Migration
  def change
    create_table :backpack_contents do |t|
      t.integer :number
      t.references :team, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
