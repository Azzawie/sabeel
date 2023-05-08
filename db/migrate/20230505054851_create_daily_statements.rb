class CreateDailyStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_statements do |t|
      t.integer :age_days
      t.integer :age_weeks
      t.integer :total_count
      t.integer :deceased
      t.integer :remaining
      t.float :consumed_food
      t.float :consumed_water
      t.float :daily_production
      t.float :production_ratio
      t.float :highest_temp
      t.float :lowest_temp
      t.float :humidity_ratio
      t.references :chamber, null: false, foreign_key: true

      t.timestamps
    end
  end
end
