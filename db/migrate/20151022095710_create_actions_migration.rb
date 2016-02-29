class CreateActionsMigration < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.text :activation_message, limit:510, null:false
      t.string :operation, null:false
    end
  end
end
