class CreateActivityGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :activity_groups do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end

    add_index :activity_groups, [:activity_id, :group_id], unique: true
  end
end
