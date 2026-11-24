class CreateGroupActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :group_activities do |t|
      t.references :group, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end

    add_index :group_activities,
              [:group_id, :activity_id],
              unique: true
  end
end
