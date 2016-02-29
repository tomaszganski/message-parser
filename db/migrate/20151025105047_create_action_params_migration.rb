class CreateActionParamsMigration < ActiveRecord::Migration
  def change
    create_table :action_params do |t|
      t.references :action, null: false
      t.integer :ordinal, null: false
      t.string :name, null: false
    end

    add_index :action_params, [:action_id, :ordinal], :unique => true
    add_index :action_params, [:action_id, :name], :unique => true
  end
end
