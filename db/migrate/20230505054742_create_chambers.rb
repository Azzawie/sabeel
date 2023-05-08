class CreateChambers < ActiveRecord::Migration[7.0]
  def change
    create_table :chambers do |t|
      t.string :name
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
