class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.string :action_name, null: false, index: true
      t.string :resource_name,null: false, index: true
      t.text :note

      t.timestamps
    end
  end
end
