class CreatePointsLogs < ActiveRecord::Migration
  def change
    create_table :points_logs do |t|
      t.string :reason
      t.integer :change
      t.references :team, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
